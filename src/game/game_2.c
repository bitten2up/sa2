#include "global.h"
#include "core.h"
#include "sprite.h"
#include "trig.h"
#include "game/game.h"
#include "game/game_2.h"
#include "game/game_3.h"

#include "constants/animations.h"

void Task_802B1AC(void);

// Called when air bubbles spawn underwater
struct Task *sub_802B018(s32 p0, s32 p1, s32 p2, s32 p3)
{
    if ((s8)gUnknown_03005B34 > 11) {
        return NULL;
    } else {
        struct Task *t;
        TaskStrc_801F15C *ts;
        Sprite *s;
        SpriteTransform *transform;

        gUnknown_03005B34++;

        t = sub_801F15C(0, 0, 0, 0, Task_802B1AC, TaskDestructor_802B3EC);

        ts = TaskGetStructPtr(t);
        s = &ts->s;
        transform = &ts->transform;

        ts->x = p0;
        ts->y = p1;
        ts->unk8 = p2;
        ts->unkA = -0x80;
        ts->unk10 = 0;
        ts->unk12 = 0x100;
        ts->unk14 = 0;

        if (p3 == 0) {
            s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2A40);
            s->graphics.anim = SA2_ANIM_BUBBLES_SMALL;
            s->variant = 0;
        } else {
            s->graphics.dest = (void *)(OBJ_VRAM0 + 0x2AC0);
            s->graphics.anim = SA2_ANIM_BUBBLES_GROUP;
            s->variant = 0;

            ts->unk14 = (((u32)PseudoRandom32() & 0x30000) >> 16);
        }

        s->unk1A = 0x240;

        transform->unk0 = 0;
        transform->width = 0;
        transform->height = 0;
        transform->x = 0;
        transform->y = 0;

        return t;
    }
}

bool32 sub_802B118(Player *p)
{
    u32 rand, randX, randY;

    u32 result = FALSE;

    u32 flags = gUnknown_03005590 & 0x7;
    if (!flags) {
        rand = ((u32)PseudoRandom32() & 0x300);
        if (!rand) {
            randX = (((u32)PseudoRandom32() & 0xF00) >> 8);
            randY = (((u32)PseudoRandom32() & 0xF00) >> 8) - 8;

            if (!(p->moveState & MOVESTATE_FACING_LEFT))
                randX = -randX;

            sub_802B018(p->x - randX, p->y - randY, p->speedAirX,
                        ((u32)PseudoRandom32() & 0x100) >> 8);

            result = TRUE;
        }
    }

    return result;
}

void Task_802B1AC(void)
{
    TaskStrc_801F15C *ts = TaskGetStructPtr(gCurTask);
    Sprite *s = &ts->s;
    SpriteTransform *transform = &ts->transform;

    s32 r1 = ts->x;
    s32 r4 = ts->y;
    s32 r2;
    s32 unk10 = ts->unk10;

    r1 += SIN((unk10 & 0xFF) * 4) >> 4;
    {
        struct Camera *cam = &gCamera;
        transform->x = Q_24_8_TO_INT(r1) - cam->x;
        transform->y = Q_24_8_TO_INT(r4) - cam->y;
    }
    // TODO: MIN()!
    r2 = ((unk10 + 1) << 4);
    if (r2 > 0x100)
        r2 = 0x100;

    // _0802B200
    transform->width = r2;
    transform->height = r2;

    if (ts->unk14 & 0x1)
        transform->width = -r2;

    if (ts->unk14 & 0x2)
        transform->height = -transform->height;

    // _0802B222
    if (((u16)(transform->x + 0x20) > 0x130) || ((u16)(transform->y + 0x20) > 0xE0)
        || ((u16)gUnknown_03005660.unk0 != 1) || (gUnknown_03005660.unk4 < 0)
        || (Q_24_8_TO_INT(r4) - 3 < gUnknown_03005660.unk4) || (ts->unk10 > 0x1E0)) {
        TaskDestroy(gCurTask);
        return;
    } else {
        // _0802B27C
        u8 byte;
        ts->x += ts->unk8;
        ts->y += ts->unkA;

        ts->unk8 -= (ts->unk8 >> 3);
        ts->unk10 += 1;
        s->unk10 = SPRITE_FLAG(PRIORITY, 2);

        byte = gUnknown_030054B8++ | 0x20;
        s->unk10 |= byte;

        sub_8004558(s);
        sub_8004860(s, transform);
        sub_80051E8(s);
    }
}
