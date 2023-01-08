#include "main.h"
#include "game.h"
#include "true_area_53_intro.h"
#include "task.h"
#include "m4a.h"
#include "sprite.h"
#include "trig.h"
#include "constants/songs.h"

typedef struct {
    u8 unk0;
    u32 unk4;
    u32 unk8;
    u16 unkC;
    u8 unkE;
    u8 unkF;
    u8 unk10[32];
    u32 unk30[32][2];
    u16 unk130[32][2];
    u8 unk1B0;
    u32 unk1B4;
    u32 unk1B8;
    Sprite unk1BC;
    Sprite unk1EC[3];
} TrueArea53Intro; /* size 0x27C */

extern const s16 gUnknown_080D7830[][5];
extern const TileInfo gUnknown_080D7560[];

void sub_80392AC(void);
void sub_803986C(void);
void sub_8039A4C(void);

void CreateTrueArea53(void)
{
    u8 i;
    struct Task *t;
    TrueArea53Intro *intro;
    Sprite *sprite;
    gBldRegs.bldCnt = 0x3FFF;
    gBldRegs.bldAlpha = 0;
    gBldRegs.bldY = 0x10;

    t = TaskCreate(sub_80392AC, 0x27C, 0x7000, 0, NULL);
    intro = TaskGetStructPtr(t);
    intro->unk0 = 0;
    intro->unk4 = 0x172;
    intro->unk8 = 0xE8;
    intro->unkE = 0;
    intro->unkF = 0;

    for (i = 0; i < 32; i++) {
        intro->unk10[i] = 1;
        intro->unk30[i][0] = gUnknown_080D7830[i][0] << 8;
        intro->unk30[i][1] = gUnknown_080D7830[i][1] << 8;
        intro->unk130[i][0] = 0;
        intro->unk130[i][1] = 0;
    }

    intro->unk1B0 = 1;
    intro->unk1B4 = 0x6400;
    intro->unk1B8 = 0xB400;

    sprite = &intro->unk1BC;
    sprite->x = 0;
    sprite->y = 0;
    sprite->graphics.dest = (void *)gUnknown_080D7560[0].numTiles;
    sprite->graphics.anim = gUnknown_080D7560[4].anim;
    sprite->variant = gUnknown_080D7560[4].variant;
    sprite->unk1A = 0x100;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk21 = 0xFF;
    sprite->unk22 = 0x10;
    sprite->focused = 5;
    sprite->unk10 = 0x400;

    for (i = 0; i < 3; i++) {
        sprite = &intro->unk1EC[i];
        sprite->x = 0;
        sprite->y = 0;
        sprite->graphics.dest = (void *)gUnknown_080D7560[i + 1].numTiles;
        sprite->graphics.anim = gUnknown_080D7560[i + 1].anim;
        sprite->variant = gUnknown_080D7560[i + 1].variant;
        sprite->unk1A = 0x100;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        sprite->focused = i + 1;
        sprite->unk28[0].unk0 = -1;
        sprite->unk10 = 0;
    }

    sub_803986C();
    sub_8039A4C();
    m4aSongNumStart(MUS_EXTRA_DEMO_1);
}

typedef struct {
    u8 unk0[8];
    u16 unk8[7];
    u32 unk18[7];
    u32 unk34;
    Sprite unk38[7];
    Background background;
} UNK_8036E08;

void sub_8036EF8(void);

void sub_8036E08(void)
{
    u8 i;
    Background *background;
    Sprite *sprite;

    struct Task *t = TaskCreate(sub_8036EF8, 0x1C8, 0x7000, 0, NULL);
    UNK_8036E08 *unkE08 = TaskGetStructPtr(t);
    unkE08->unk34 = 32;

    background = &unkE08->background;
    background->graphics.dest = (void *)BG_SCREEN_ADDR(16);
    background->graphics.anim = 0;
    background->unkC = BG_SCREEN_ADDR(28);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1C = 0x17B;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 9;
    background->unk24 = 1;
    background->unk26 = 0xD;
    background->unk28 = 0x12;
    background->unk2A = 0;
    background->unk2E = 2;

    for (i = 0; i < 7; i++) {
        unkE08->unk8[i] = 0;
        unkE08->unk18[i] = 0xB400;
        sprite = &unkE08->unk38[i];
        sprite->x = 0;
        sprite->y = 0;
        sprite->graphics.dest = (void *)OBJ_VRAM0 + 0x3000 + (i * 0x200);
        sprite->graphics.anim = 0x345;
        sprite->variant = i;
        sprite->unk21 = 0xFF;
        sprite->unk1A = 0x500;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk22 = 0x10;
        sprite->focused = 0;
        sprite->unk10 = 0;
    }
}

void sub_8036FE4(void);

void sub_8036EF8(void)
{
    u8 i;
    s32 pos[2];
    s32 temp[2];
    Sprite *sprite;
    UNK_8036E08 *unkE08 = TaskGetStructPtr(gCurTask);

    for (i = 0; i < 7; i++) {
        sprite = &unkE08->unk38[i];
        unkE08->unk8[i] += 5;
        unkE08->unk18[i] += unkE08->unk8[i];

        temp[0] = ((unkE08->unk18[i] * (i + 0xF)) >> 9) & ONE_CYCLE;
        temp[1] = ((unkE08->unk18[i] * (i + 0xD)) >> 9) & ONE_CYCLE;

        pos[0] = (COS(temp[0]) * (0x20 - unkE08->unk34)) >> 0xE;
        pos[1] = (SIN(temp[1]) * (0x20 - unkE08->unk34)) >> 0x10;

        sprite->x = pos[0] + 0x78;
        sprite->y = pos[1] + 100;

        sub_8004558(sprite);
        sub_80051E8(sprite);
    }

    if (--unkE08->unk34 == 0) {
        unkE08->unk34 = 0x168;
        gCurTask->main = sub_8036FE4;
    };
}

void sub_80370C0(void);

void sub_8036FE4(void)
{
    u8 i;
    s32 pos[2];
    s32 temp[2];
    s32 temp2;
    Sprite *sprite;
    UNK_8036E08 *unkE08 = TaskGetStructPtr(gCurTask);

    for (i = 0; i < 7; i++) {
        sprite = &unkE08->unk38[i];
        unkE08->unk8[i] += 5;
        unkE08->unk18[i] += unkE08->unk8[i];

        temp[0] = ((unkE08->unk18[i] * (i + 0xF)) >> 9) & ONE_CYCLE;
        temp[1] = ((unkE08->unk18[i] * (i + 0xD)) >> 9) & ONE_CYCLE;

        temp2 = COS(temp[0]);
        pos[0] = (temp2 >> 9);

        temp2 = SIN(temp[1]);
        pos[1] = temp2 >> 0xB;

        sprite->x = pos[0] + 0x78;
        sprite->y = pos[1] + 100;

        sub_8004558(sprite);
        sub_80051E8(sprite);
    }

    if (--unkE08->unk34 == 0) {
        unkE08->unk34 = 0x20;
        gCurTask->main = sub_80370C0;
    };
}

void sub_8037254(void);

void sub_80370C0(void)
{
    u8 i;
    s32 pos[2];
    s32 temp[2];
    s32 temp2;
    Sprite *sprite;
    UNK_8036E08 *unkE08 = TaskGetStructPtr(gCurTask);

    if (--unkE08->unk34 == 0) {
        unkE08->unk34 = 0x78;
        gBgCntRegs[2] = 0x1C08;
        gBldRegs.bldY = 0x10;
        gDispCnt = 0x40;
        gDispCnt |= 0x5500;
        gBgScrollRegs[1][0] = 0;
        gBgScrollRegs[1][1] = 0;
        gBgScrollRegs[2][0] = 0;
        gBgScrollRegs[2][1] = 0;

        gUnknown_03004D80[2] = 0;
        gUnknown_03002280[2][0] = 0;
        gUnknown_03002280[2][1] = 0;
        gUnknown_03002280[2][2] = 0xff;
        gUnknown_03002280[2][3] = 0x14;

        sub_8002A3C(&unkE08->background);
        gCurTask->main = sub_8037254;
        return;
    }

    if (unkE08->unk34 < 0x10) {
        gDispCnt |= 0x4000;
        gBldRegs.bldCnt = 0xBF;
        gBldRegs.bldY = 0x10 - unkE08->unk34;
        gWinRegs[1] = 0xF0;
        gWinRegs[3] = 0xA0;
        gWinRegs[4] = 0xFF00;
        gWinRegs[5] = 0xFF;
    }

    for (i = 0; i < 7; i++) {
        sprite = &unkE08->unk38[i];
        unkE08->unk8[i] += 5;
        unkE08->unk18[i] += unkE08->unk8[i];

        temp[0] = ((unkE08->unk18[i] * (i + 0xF)) >> 9) & ONE_CYCLE;
        temp[1] = ((unkE08->unk18[i] * (i + 0xD)) >> 9) & ONE_CYCLE;

        pos[0] = (unkE08->unk34 * COS(temp[0])) >> 0xE;
        pos[1] = (unkE08->unk34 * SIN(temp[1])) >> 0x10;

        sprite->x = pos[0] + 0x78;
        sprite->y = pos[1] + 100;

        sub_8004558(sprite);
        sub_80051E8(sprite);
    }
}

void sub_8037254(void)
{
    UNK_8036E08 *unkE08 = TaskGetStructPtr(gCurTask);

    if (--unkE08->unk34 == 0) {
        gDispCnt = 0x1140;
        gBgCntRegs[2] = 0x1C0B;
        TaskDestroy(gCurTask);
        return;
    }

    if (unkE08->unk34 < 0x75 && gBldRegs.bldY != 0) {
        gBldRegs.bldCnt = 0xbf;
        gBldRegs.bldY--;
        gWinRegs[1] = 0xf0;
        gWinRegs[3] = 0xa0;
        gWinRegs[4] = 0xff00;
        gWinRegs[5] = 0xff;
    }
}

typedef struct {
    u16 unk0;
    u32 unk4;
    s32 unk8;
    s16 unkC;
    s16 unkE;
    Sprite unk10;
} UNK_80372C8;

void sub_80373CC(void);

extern const TileInfo gUnknown_080D7540[];

void sub_80372C8(s32 a, s32 b)
{
    Sprite *sprite;
    struct Task *t = TaskCreate(sub_80373CC, 0x40, 0x7000, 0, NULL);
    u32 id = (PseudoRandom32() & 1) + 2;
    UNK_80372C8 *unk2C8 = TaskGetStructPtr(t);
    unk2C8->unk0 = 0x28;

    unk2C8->unk4 = a + (s16)(((PseudoRandom32() & 0x1F) - 0x10) << 8);
    unk2C8->unk8 = b + (s16)(((PseudoRandom32() & 0x1F) - 0x10) << 8);
    unk2C8->unkC = 0;
    unk2C8->unkE = 0;

    sprite = &unk2C8->unk10;
    sprite->x = 0;
    sprite->y = 0;
    sprite->graphics.dest = (void *)gUnknown_080D7540[id].numTiles;
    sprite->graphics.anim = gUnknown_080D7540[id].anim;
    sprite->variant = gUnknown_080D7540[id].variant;
    sprite->unk21 = 0xFF;
    sprite->unk1A = 0x100;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk22 = 0x20;
    sprite->focused = 0;
    sprite->unk10 = 0x1000;
}

void sub_80373CC(void)
{
    s32 unk4, unkC;
    Sprite *sprite;
    UNK_80372C8 *unk2C8 = TaskGetStructPtr(gCurTask);
    sprite = &unk2C8->unk10;

    unk2C8->unkE += 0x10;
    unkC = unk2C8->unkC;
    unk4 = unk2C8->unk4;
    unk2C8->unk4 += unk2C8->unkC;

    unk2C8->unk8 += unk2C8->unkE;

    if (--unk2C8->unk0 == 0) {
        TaskDestroy(gCurTask);
        return;
    }

    sprite->x = (unk4 + unkC) >> 8;
    sprite->y = (unk2C8->unk8 >> 8) - gCamera.y;

    sub_8004558(sprite);
    sub_80051E8(sprite);
}

typedef struct {
    u8 unk0;
    u8 unk1;
    u16 unk2;
    s32 unk4;
    s32 unk8;
    s32 unkC;
    s16 unk10;
    s16 unk12;
    Sprite unk14;
    Sprite unk44;
} UNK_8037438;

extern const TaskMain gUnknown_080D7970[];

extern const u16 gUnknown_080D7704[][17];
extern const u32 gUnknown_080D77D0[][4];
extern const TileInfo *gUnknown_080D76F0[];
extern const TileInfo gUnknown_080D7540[];
extern const s8 gUnknown_080D7984[];

void sub_8037438(u8 p1)
{
    Sprite *sprite;
    const TileInfo *tileInfo;
    struct Task *t = TaskCreate(gUnknown_080D7970[p1], 0x74, 0x7000, 0, NULL);
    UNK_8037438 *unk438 = TaskGetStructPtr(t);
    unk438->unk0 = p1;
    unk438->unk1 = 0;
    unk438->unk2 = gUnknown_080D7704[unk438->unk0][0];
    unk438->unk8 = gUnknown_080D77D0[unk438->unk0][0];
    unk438->unkC = gUnknown_080D77D0[unk438->unk0][1];
    unk438->unk10 = gUnknown_080D77D0[unk438->unk0][2];
    unk438->unk12 = gUnknown_080D77D0[unk438->unk0][3];

    tileInfo = gUnknown_080D76F0[p1];
    sprite = &unk438->unk14;

    sprite->x = gUnknown_080D77D0[unk438->unk0][0] << 8;
    sprite->y = gUnknown_080D77D0[unk438->unk0][1] << 8;

    sprite->graphics.dest = (void *)tileInfo->numTiles;
    sprite->graphics.anim = tileInfo->anim;
    sprite->variant = tileInfo->variant;
    sprite->unk21 = 0xFF;
    sprite->unk1A = (0x10 - gUnknown_080D7984[p1]) * 0x40;
    sprite->graphics.size = 0;
    sprite->unk14 = 0;
    sprite->unk1C = 0;
    sprite->unk22 = 0x20;
    if (p1 < 4) {
        sprite->focused = p1;
    } else {
        sprite->focused = 0;
    }

    sprite->unk10 = 0x1400;

    if (p1 < 4) {
        sprite = &unk438->unk44;
        sprite->x = 0;
        sprite->y = 0;

        sprite->graphics.dest = (void *)gUnknown_080D7540[p1].numTiles;
        sprite->graphics.anim = gUnknown_080D7540[p1].anim;
        sprite->variant = gUnknown_080D7540[p1].variant;
        sprite->unk21 = 0xFF;
        sprite->unk1A = 0x400;
        sprite->graphics.size = 0;
        sprite->unk14 = 0;
        sprite->unk1C = 0;
        sprite->unk22 = 0x10;
        sprite->focused = 0;
        sprite->unk10 = 0x1000;
    }
}

void sub_8037674(void);

void sub_80375B4(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];

        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8037674;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}
void sub_8037744(void);

void sub_8037674(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    // Only difference
    unk438->unk10 -= 0x20;
    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];

        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8037744;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037818(void);

void sub_8037744(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    // Only difference
    unk438->unk10 -= 0x20;
    if (unk438->unk10 < 0) {
        unk438->unk10 = 0;
    }

    unk438->unk8 += unk438->unk10;
    unk438->unkC += unk438->unk12;

    if (--unk438->unk2 == 0) {
        unk438->unk10 = 0;
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];

        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8037818;
    }

    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_80378BC(void);

void sub_8037818(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_80378BC;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_803796C(void);

void sub_80378BC(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        unk438->unk4 = 0;
        gCurTask->main = sub_803796C;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037A38(void);

void sub_803796C(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    if (unk438->unk2 < 0x135) {
        if (unk438->unk2 == 0xF0) {
            sub_8036E08();
            m4aSongNumStart(MUS_EXTRA_DEMO_2);
        }

        if ((unk438->unkC >> 8) > 0x9C) {
            unk438->unkC -= 0x18;
        }
    }

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        gCurTask->main = sub_8037A38;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037B04(void);

void sub_8037A38(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;

    if (!(unk438->unk2 & 7)) {
        sprite->unk22++;
    }

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        sprite->unk22 = 0x10;
        m4aSongNumStart(SE_114);
        gCurTask->main = sub_8037B04;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037BD0(void);

void sub_8037B04(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;
    unk438->unkC -= SIN(((++unk438->unk4) * 5) & 0x3FF) >> 8;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8037BD0;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);
}

void sub_8037CEC(void);

void sub_8037BD0(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;
    unk438->unkC -= SIN(((++unk438->unk4) * 5) & 0x3FF) >> 8;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8037CEC;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite = &unk438->unk44;
    sprite->x = unk438->unk8 >> 8;
    sprite->y = 0xB2 - gCamera.y;
    sprite->unk10 &= ~0x400;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite->unk10 |= 0x400;
    sub_80051E8(sprite);

    if (!(unk438->unk2 & 3)) {
        sub_80372C8(unk438->unk8, unk438->unkC);
    }
}

void sub_8037E08(void);

void sub_8037CEC(void)
{
    Sprite *sprite;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;
    unk438->unkC -= SIN(((++unk438->unk4) * 5) & 0x3FF) >> 8;

    if (--unk438->unk2 == 0) {
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;
        gCurTask->main = sub_8037E08;
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite = &unk438->unk44;
    sprite->x = unk438->unk8 >> 8;
    sprite->y = 0xB2 - gCamera.y;
    sprite->unk10 &= ~0x400;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite->unk10 |= 0x400;
    sub_80051E8(sprite);

    if (!(unk438->unk2 & 3)) {
        sub_80372C8(unk438->unk8, unk438->unkC);
    }
}

void sub_8037F68(void);

void sub_8037E08(void)
{
    Sprite *sprite, *sprite2;
    const TileInfo *animSet;
    const TileInfo *tileInfo;
    UNK_8037438 *unk438 = TaskGetStructPtr(gCurTask);
    sprite = &unk438->unk14;
    sprite2 = &unk438->unk44;
    unk438->unkC -= SIN(((++unk438->unk4) * 5) & 0x3FF) >> 8;

    if (--unk438->unk2 == 0) {
        gBldRegs.bldY = 0;
        unk438->unk2 = gUnknown_080D7704[unk438->unk0][++unk438->unk1];

        animSet = gUnknown_080D76F0[unk438->unk0];
        tileInfo = &animSet[unk438->unk1];
        sprite->graphics.anim = tileInfo->anim;
        sprite->variant = tileInfo->variant;
        sprite->unk21 = 0xFF;

        sprite2->graphics.dest = (void *)gUnknown_080D7540[1].numTiles;
        sprite2->graphics.anim = gUnknown_080D7540[1].anim;
        sprite2->variant = gUnknown_080D7540[1].variant;
        sprite2->unk21 = 0xFF;

        gCurTask->main = sub_8037F68;

        m4aSongNumStop(SE_114);
        m4aSongNumStart(SE_221);
    }
    sprite->x = unk438->unk8 >> 8;
    sprite->y = (unk438->unkC >> 8) - gCamera.y;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite = &unk438->unk44;
    sprite->x = unk438->unk8 >> 8;
    sprite->y = 0xB2 - gCamera.y;
    sprite->unk10 &= ~0x400;
    sub_8004558(sprite);
    sub_80051E8(sprite);

    sprite->unk10 |= 0x400;
    sub_80051E8(sprite);

    if (!(unk438->unk2 & 3)) {
        sub_80372C8(unk438->unk8, unk438->unkC);
    }
}