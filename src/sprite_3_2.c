#include "global.h"
#include "core.h"
#include "flags.h"

OamData *OamMalloc(u8 p0)
{
    OamData *result;

    if (p0 > 31) {
        p0 = 31;
    }

    if (gOamFreeIndex > OAM_ENTRY_COUNT - 1) {
        result = (OamData *)iwram_end;
    } else {
        if (gUnknown_03001850[p0] == 0xFF) {
            gUnknown_030022D0[gOamFreeIndex].split.fractional = 0xFF;
            gUnknown_03001850[p0] = gOamFreeIndex;
            gUnknown_03004D60[p0] = gOamFreeIndex;
        } else {
            gUnknown_030022D0[gOamFreeIndex].split.fractional = 0xFF;
            gUnknown_030022D0[gUnknown_03004D60[p0]].split.fractional = gOamFreeIndex;
            gUnknown_03004D60[p0] = gOamFreeIndex;
        }

        gOamFreeIndex++;
        result = &gUnknown_030022D0[gOamFreeIndex - 1];
    }

    return result;
}

void CopyOamBufferToOam(void)
{
    OamData *dstOam = &gOamBuffer[0];
    u8 i = 0;
    s32 r3;

    for (r3 = 0; r3 < 32; r3++) {
        s8 index = gUnknown_03001850[r3];

        while (index != -1) {
            u8 newI;
            u8 *byteArray = gUnknown_03002710;
            DmaCopy16(3, &gUnknown_030022D0[index], dstOam, sizeof(OamDataShort));
            dstOam++;

            byteArray += index;
            newI = i++;
            *byteArray = newI;
            index = gUnknown_030022D0[index].split.fractional;
        };
    }

    if (gFlags & FLAGS_800) {
        r3 = gOamFreeIndex;
        dstOam = &gOamBuffer[r3];

        while (r3 < gOamFirstPausedIndex) {
            DmaFill16(3, 0x200, dstOam, sizeof(OamDataShort));
            dstOam++;
            r3++;
        }
    } else if (gFlags & FLAGS_PAUSE_GAME) {
        /* Push all active OAM entries to te end of OAM temporarily while
         * the game is paused */
        s32 k, l;
        r3 = gOamFreeIndex - 1;
        dstOam = &gOamBuffer[r3];

        for (k = l = 0; r3 >= 0;) {
            s32 size = sizeof(OamDataShort);
            DmaCopy16(3, dstOam - k, &gOamBuffer[OAM_ENTRY_COUNT - 1 - l], size);
            k++, r3--, l++;
        }

        // _08005A5E

        gOamFirstPausedIndex = OAM_ENTRY_COUNT - gOamFreeIndex;

        for (r3 = 0; r3 < gOamFirstPausedIndex; r3++) {
            DmaFill16(3, 0x200, &gOamBuffer[r3], sizeof(OamDataShort));
#ifndef NON_MATCHING
            // unlike when using --, using ++ changes the condition to something entirely
            // different unless we tell the compiler that we want to use r3's values
            // (without actually doing so)
            asm("" ::"r"(r3));
#endif
        }

    } else {
        gOamFirstPausedIndex = 0;
    }

    gOamFreeIndex = 0;
    if (gFlags & FLAGS_4000) {
        CpuFill32(-1, gUnknown_03001850, sizeof(gUnknown_03001850));
        CpuFill32(-1, gUnknown_03004D60, sizeof(gUnknown_03004D60));
    } else {
        DmaFill32(3, -1, gUnknown_03001850, sizeof(gUnknown_03001850));
        DmaFill32(3, -1, gUnknown_03004D60, sizeof(gUnknown_03004D60));
    }
}