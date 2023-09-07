#include "global.h"
#include "game/game.h"
#include "game/entity.h"
#include "game/enemies/kiki.h"
#include "malloc_vram.h"
#include "sprite.h"

#include "constants/animations.h"

typedef struct {
    /* 0x00 */ SpriteBase base;
    /* 0x0C */ Sprite s;
    /* 0x3C */ s8 unk3C;
    /* 0x3D */ s8 unk3D;
    /* 0x3E */ u8 unk3E;
    /* 0x3F */ u8 unk3F;
} Sprite_Kiki; /* size: 0x40 */

void sub_80538A0(void);
void TaskDestructor_80095E8(struct Task *);

void CreateEntity_Kiki(MapEntity *me, u16 spriteRegionX, u16 spriteRegionY, u8 spriteY)
{
    struct Task *t = TaskCreate(sub_80538A0, 0x40, 0x4020, 0, TaskDestructor_80095E8);
    Sprite_Kiki *kiki = TaskGetStructPtr(t);
    Sprite *s = &kiki->s;

    kiki->base.regionX = spriteRegionX;
    kiki->base.regionY = spriteRegionY;
    kiki->base.me = me;
    kiki->base.spriteX = me->x;
    kiki->base.spriteY = spriteY;

    kiki->unk3C = 1;
    kiki->unk3D = 0;
    kiki->unk3E = 0;
    kiki->unk3F = 0;

    s->x = TO_WORLD_POS(me->x, spriteRegionX);
    s->y = TO_WORLD_POS(me->y, spriteRegionY);
    SET_MAP_ENTITY_INITIALIZED(me);

    s->graphics.dest = VramMalloc(0x14);
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_KIKI;
    s->variant = 0;
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}

void sub_8053A38(void);

void sub_80538A0(void)
{
    Sprite_Kiki *kiki = TaskGetStructPtr(gCurTask);
    Sprite *s = &kiki->s;
    MapEntity *me = kiki->base.me;
    s16 x, y;

    x = TO_WORLD_POS(kiki->base.spriteX, kiki->base.regionX);
    y = TO_WORLD_POS(me->y, kiki->base.regionY);

    kiki->unk3D += kiki->unk3C;
    y += kiki->unk3D;

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (ENEMY_CROSSED_TOP_BORDER_RAW(kiki, me, kiki->unk3D)) {
        kiki->unk3E++;
        kiki->unk3C = 1;
        if (!(kiki->unk3E & 1)) {
            kiki->unk3F = 0;
            s->variant = 1;
            gCurTask->main = sub_8053A38;
        }
    } else if (ENEMY_CROSSED_BOTTOM_BORDER_RAW(kiki, me, kiki->unk3D)) {
        kiki->unk3C = -1;
    }

    if (sub_800C4FC(s, x, y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y - kiki->unk3D)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kiki->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Q_24_8_TO_INT(gPlayer.x) < x) {
        SPRITE_FLAG_CLEAR(s, X_FLIP);
    } else {
        SPRITE_FLAG_SET(s, X_FLIP);
        s->x += 8;
    }

    ENEMY_UPDATE_EX_RAW(s, Q_24_8_NEW(x), Q_24_8_NEW(y), {});
}

void sub_8053BBC(s16, s16);

void sub_8053A38(void)
{
    Sprite_Kiki *kiki = TaskGetStructPtr(gCurTask);
    Sprite *s = &kiki->s;
    MapEntity *me = kiki->base.me;
    s16 x, y;

    x = TO_WORLD_POS(kiki->base.spriteX, kiki->base.regionX);
    y = TO_WORLD_POS(me->y, kiki->base.regionY);

    y += kiki->unk3D;

    s->x = x - gCamera.x;
    s->y = y - gCamera.y;

    if (sub_800C4FC(s, x, y, 0)) {
        TaskDestroy(gCurTask);
        return;
    }

    if (IS_OUT_OF_CAM_RANGE(s->x, s->y - kiki->unk3D)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, kiki->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Q_24_8_TO_INT(gPlayer.x) < x) {
        SPRITE_FLAG_CLEAR(s, X_FLIP);
    } else {
        SPRITE_FLAG_SET(s, X_FLIP);
        s->x += 8;
    }

    kiki->unk3F++;

    sub_80122DC(Q_24_8_NEW(x), Q_24_8_NEW(y));

    if (kiki->unk3F == 0x12) {
        if (s->unk10 & SPRITE_FLAG_MASK_X_FLIP) {
            sub_8053BBC(x - 4, y + 2);
        } else {
            sub_8053BBC(x + 9, y + 2);
        }
    }
    if (UpdateSpriteAnimation(s) == 0) {
        gCurTask->main = sub_80538A0;
        s->variant = 0;
    };
    DisplaySprite(s);
}

typedef struct {
    Sprite s;
    u16 unk30;
    s16 unk32;
    s16 unk34;
    s16 unk36;
    s16 unk38;
} Kiki_Proj; /* 0x3C */

void sub_8053CC0(void);
void sub_8054054(struct Task *);

void sub_8053BBC(s16 x, s16 y)
{
    struct Task *t = TaskCreate(sub_8053CC0, 0x3C, 0x4028, 0, sub_8054054);
    Kiki_Proj *proj = TaskGetStructPtr(t);
    Sprite *s = &proj->s;

    proj->unk32 = -512;
    proj->unk30 = 0;
    proj->unk36 = 0;
    proj->unk38 = x;
    if (Q_24_8_TO_INT(gPlayer.x) < x) {
        proj->unk34 = -Div((x - Q_24_8_TO_INT(gPlayer.x)) * 400, 800);
        if (proj->unk34 < -0x3C) {
            proj->unk34 = -60;
        }
    } else {
        proj->unk34 = Div((Q_24_8_TO_INT(gPlayer.x) - x) * 400, 800);

        if (proj->unk34 >= 0x3D) {
            proj->unk34 = 60;
        }
    }

    s->x = x;
    s->y = y;

    s->graphics.dest = VramMalloc(4);
    s->unk1A = SPRITE_OAM_ORDER(17);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_KIKI_PROJ;
    s->variant = 0;
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    UpdateSpriteAnimation(s);
}

void sub_8053DCC(void);

void sub_8053E64(s16, s16);

void sub_8053CC0(void)
{
    Kiki_Proj *proj = TaskGetStructPtr(gCurTask);
    Sprite *s = &proj->s;
    s16 x, y;

    proj->unk32 += 40;
    proj->unk36 += proj->unk34;

    s->x = proj->unk38 + Div(proj->unk36, 0x28);
    s->y += Q_8_8_TO_INT(proj->unk32);

    if (proj->unk32 && proj->unk32 > -1) {
        s32 delta = sub_801F07C(s->y, s->x, 1, 8, 0, sub_801EE64);
        if (delta < 0) {
            s->y += delta;
            if (proj->unk30 == 0) {
                proj->unk32 = -(proj->unk32 >> 2);
                proj->unk30 += 1;
            } else {
                gCurTask->main = sub_8053DCC;
                proj->unk30 = 0;
                proj->unk32 = 0;
            }
        }
    }

    x = s->x;
    y = s->y;
    if (sub_800C84C(s, x, y) != 0) {
        s->prevVariant = -1;
        s->graphics.anim = SA2_ANIM_DUST_CLOUD;
        s->variant = 0;
        sub_8053E64(x, y);
        TaskDestroy(gCurTask);
        return;
    }
    s->x -= gCamera.x;
    s->y -= gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    s->x = x;
    s->y = y;
}

void sub_8053DCC(void)
{
    Kiki_Proj *proj = TaskGetStructPtr(gCurTask);
    Sprite *s = &proj->s;
    s16 x, y;

    x = s->x;
    y = s->y;
    if (proj->unk30++ >= 0x60) {
        sub_8053E64(x, y);
        TaskDestroy(gCurTask);
        return;
    }

    if (sub_800C84C(s, x, y) != 0) {
        sub_8053E64(x, y);
        TaskDestroy(gCurTask);
        return;
    }

    s->x -= gCamera.x;
    s->y -= gCamera.y;
    UpdateSpriteAnimation(s);
    DisplaySprite(s);
    s->x = x;
    s->y = y;
}

void sub_8053F24(void);

void sub_8053E64(s16 x, s16 y)
{
    struct Task *t = TaskCreate(sub_8053F24, 0x3C, 0x2000, 0, sub_8054054);
    Kiki_Proj *proj = TaskGetStructPtr(t);
    Sprite *s = &proj->s;

    proj->unk32 = -512;
    proj->unk30 = 0;

    if (Q_24_8_TO_INT(gPlayer.x) < x) {
        proj->unk34 = -1;
    } else {
        proj->unk34 = 1;
    }

    s->x = x;
    s->y = y;
    s->graphics.dest = VramMalloc(16);
    s->unk1A = SPRITE_OAM_ORDER(18);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_KIKI_PROJ_EXPLOSION;
    s->variant = 0;
    SPRITE_INIT_SCRIPT(s, 1.0);
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);
    UpdateSpriteAnimation(s);
}
