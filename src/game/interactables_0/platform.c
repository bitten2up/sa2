#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "sprite.h"
#include "task.h"
#include "trig.h"
#include "malloc_vram.h"

#include "constants/animations.h"
#include "constants/interactables.h"
#include "constants/zones.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ u16 unk3C;
    /* 0x40 */ s32 unk40;
    /* 0x44 */ s32 unk44;
    /* 0x48 */ s16 unk48;
    /* 0x4A */ s16 unk4A;
    /* 0x4C */ u16 unk4C;
    /* 0x50 */ s32 unk50[2];
} Sprite_Platform; /* size: 0x58 */

extern void Task_800E89C(void);
extern void TaskDestructor_800F19C(struct Task *);

const AnimId sPlatformLevelAnims[38] = {
    [LEVEL_INDEX(ZONE_1, ACT_1)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_1, ACT_2)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = SA2_ANIM_PLATFORM_LEA_FOR,

    [LEVEL_INDEX(ZONE_2, ACT_1)] = SA2_ANIM_PLATFORM_HOT_CRA,
    [LEVEL_INDEX(ZONE_2, ACT_2)] = SA2_ANIM_PLATFORM_HOT_CRA,
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = SA2_ANIM_PLATFORM_HOT_CRA,
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = SA2_ANIM_PLATFORM_HOT_CRA,

    [LEVEL_INDEX(ZONE_3, ACT_1)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,
    [LEVEL_INDEX(ZONE_3, ACT_2)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,

    [LEVEL_INDEX(ZONE_4, ACT_1)] = SA2_ANIM_PLATFORM_ICE_PAR,
    [LEVEL_INDEX(ZONE_4, ACT_2)] = SA2_ANIM_PLATFORM_ICE_PAR,
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = SA2_ANIM_PLATFORM_ICE_PAR,
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = SA2_ANIM_PLATFORM_ICE_PAR,

    [LEVEL_INDEX(ZONE_5, ACT_1)] = SA2_ANIM_PLATFORM_SKY_CAN_2,
    [LEVEL_INDEX(ZONE_5, ACT_2)] = SA2_ANIM_PLATFORM_SKY_CAN_2,
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = SA2_ANIM_PLATFORM_SKY_CAN_2,
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = SA2_ANIM_PLATFORM_SKY_CAN_2,

    [LEVEL_INDEX(ZONE_6, ACT_1)] = SA2_ANIM_PLATFORM_TEC_BAS,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = SA2_ANIM_PLATFORM_TEC_BAS,
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = SA2_ANIM_PLATFORM_TEC_BAS,
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = SA2_ANIM_PLATFORM_TEC_BAS,

    [LEVEL_INDEX(ZONE_7, ACT_1)] = SA2_ANIM_PLATFORM_EGG_UTO,
    [LEVEL_INDEX(ZONE_7, ACT_2)] = SA2_ANIM_PLATFORM_EGG_UTO,
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = SA2_ANIM_PLATFORM_EGG_UTO,
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = SA2_ANIM_PLATFORM_EGG_UTO,

    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_FINAL, 2)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_FINAL, 3)] = SA2_ANIM_PLATFORM_LEA_FOR,

    [LEVEL_INDEX(8, ACT_1)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(8, ACT_2)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(8, ACT_BOSS)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(8, ACT_UNUSED)] = SA2_ANIM_PLATFORM_LEA_FOR,

    [LEVEL_INDEX(9, ACT_1)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(9, ACT_2)] = SA2_ANIM_PLATFORM_LEA_FOR,
};

void initSprite_Interactable_Platform(MapEntity *me, u16 spriteRegionX,
                                      u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(Task_800E89C, sizeof(Sprite_Platform), 0x2010, 0,
                                TaskDestructor_800F19C);
    Sprite_Platform *platform = TaskGetStructPtr(t);
    Sprite *s = &platform->s;

    platform->base.regionX = spriteRegionX;
    platform->base.regionY = spriteRegionY;
    platform->base.me = me;
    platform->base.spriteX = me->x;
    platform->base.spriteY = spriteY;
    platform->unk40 = 0;
    platform->unk44 = 0;
    platform->unk4C = 0;

    if (me->d.uData[2] > me->d.uData[3]) {
        if (me->d.sData[0] >= 0) {
            platform->unk48 = 0x4;
            platform->unk3C = 0;
            platform->unk4A = 0;
        } else {
            platform->unk48 = 0x4;
            platform->unk3C = 0x80;
            platform->unk4A = 0;
        }
    } else {
        if (me->d.sData[1] >= 0) {
            platform->unk48 = 0;
            platform->unk4A = 0x4;
            platform->unk3C = 0;
        } else {
            platform->unk48 = 0;
            platform->unk4A = 0x4;
            platform->unk3C = 0x80;
        }
    }

    {
        s32 i;
        s32 tileCount, anim, variant;

        s->x = TO_WORLD_POS(me->x, spriteRegionX);
        s->y = TO_WORLD_POS(me->y, spriteRegionY);
        SET_MAP_ENTITY_INITIALIZED(me);

        s->graphics.dest = VramMalloc(18);

        anim = sPlatformLevelAnims[gCurrentLevel];
        s->graphics.anim = anim;
        s->variant = 0;

        s->unk1A = 0x480;
        s->graphics.size = 0;
        s->unk14 = 0;
        s->unk1C = 0;
        s->unk21 = 0xFF;
        s->unk22 = 0x10;
        s->focused = 0;
        s->unk28->unk0 = -1;
        s->unk10 = SPRITE_FLAG_PRIORITY(2);
        sub_8004558(s);
    }
}

void Task_800E89C(void)
{
    Player *p = &gPlayer;
    s16 posX;
    s16 posY;
    MapEntity *me;
    u32 result;
    s32 deltaX = 0, deltaY = 0;

    Sprite_Platform *platform = TaskGetStructPtr(gCurTask);
    Sprite *s = &platform->s;
    me = platform->base.me;

    if (platform->unk48 != 0) {
#ifdef NON_MATCHING
        s32 r5 = platform->unk40;
#else
        register s32 r5 asm("r5") = platform->unk40;
#endif
        s32 meUdata2 = (me->d.uData[2] << 11);

        platform->unk40
            = (SIN((platform->unk48 * ((gUnknown_03005590 + platform->unk3C) & 0xFF))
                   & ONE_CYCLE)
               * meUdata2)
            >> 14;
        r5 = platform->unk40 - r5;
#ifndef NON_MATCHING
        asm("" ::"r"(r5));
#endif
        deltaX = r5;
    }

    if (platform->unk4A != 0) {
#ifdef NON_MATCHING
        s32 r5 = platform->unk44;
#else
        register s32 r5 asm("r5") = platform->unk44;
#endif
        s32 meUdata3 = (me->d.uData[3] << 11);
        platform->unk44
            = (SIN(((platform->unk4A * ((gUnknown_03005590 + platform->unk3C) & 0xFF)))
                   & ONE_CYCLE)
               * meUdata3)
            >> 14;
        r5 = platform->unk44 - r5;
#ifndef NON_MATCHING
        asm("" ::"r"(r5));
#endif
        deltaY = r5;
    }

    posX = TO_WORLD_POS(platform->base.spriteX, platform->base.regionX);
    posY = TO_WORLD_POS(me->y, platform->base.regionY);

    s->x = posX - gCamera.x + Q_24_8_TO_INT(platform->unk40);
    s->y = posY - gCamera.y + Q_24_8_TO_INT(platform->unk44);

    if ((p->moveState & MOVESTATE_8) && (p->unk3C == s)) {
        s32 res, temp, temp2;
        p->x += deltaX;

        if (!GRAVITY_IS_INVERTED) {
            p->y += deltaY + Q_24_8(1.0);
        } else {
            p->y += deltaY - Q_24_8(2.0);
        }
    }

    if (!(p->moveState & MOVESTATE_400000)) {
        s32 x, y;
        u32 otherRes;
        s32 movStateCopy = p->moveState;

        x = (posX + Q_24_8_TO_INT(platform->unk40));
        y = (posY + Q_24_8_TO_INT(platform->unk44));
        result = sub_800CCB8(s, x, y, p);

        if (result & 0x10000) {
            p->y += Q_8_8(result);
        }
    }

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, posX - gCamera.x, posY - gCamera.y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, platform->base.spriteX);
        TaskDestroy(gCurTask);
    } else {
        if (!(gPlayer.moveState & MOVESTATE_400000)) {
            if ((gPlayer.moveState & MOVESTATE_8) && (gPlayer.unk3C == s)) {
                if (platform->unk4C != 0x100) {
                    platform->unk4C += 0x10;
                }
            } else {
                if (platform->unk4C != 0) {
                    platform->unk4C -= 0x10;
                }
            }

            if (!GRAVITY_IS_INVERTED) {
                s->y += SIN_24_8(platform->unk4C) >> 6;
            } else {
                s->y -= SIN_24_8(platform->unk4C) >> 6;
            }
        }

        sub_8004558(s);
        sub_80051E8(s);
    }
}