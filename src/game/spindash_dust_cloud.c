#include "global.h"
#include "game/game.h"
#include "core.h"
#include "malloc_vram.h"
#include "task.h"

#include "constants/animations.h"

typedef struct {
    Sprite s;
} DustCloud;

void Task_SpindashDustCloud(void);
void Task_SpindashDustCloudBig(void);
void TaskDestructor_SpindashDustCloud(struct Task *);

struct Task *CreateSpindashDustCloud()
{
    struct Task *t = TaskCreate(Task_SpindashDustCloud, sizeof(DustCloud), 0x4001, 0,
                                TaskDestructor_SpindashDustCloud);

    DustCloud *sdc = TaskGetStructPtr(t);
    Sprite *s = &sdc->s;
    s->graphics.dest = VramMalloc(20);
    s->graphics.size = 0;
    s->graphics.anim = SA2_ANIM_SPINDASH_DUST_CLOUD;
    s->variant = 0;
    s->unk21 = 0xFF;
    s->unk1A = 0x200;
    s->unk1C = 0;
    s->unk22 = 0x10;
    s->palId = 0;
    s->unk10 = SPRITE_FLAG(PRIORITY, 2);

    return t;
}

void Task_SpindashDustCloud(void)
{
    struct Camera *cam;
    Player *p = &gPlayer;
    s32 offY;

    if (p->spriteTask == NULL
        || (p->moveState & (MOVESTATE_400 | MOVESTATE_DEAD)) != MOVESTATE_400) {
        TaskDestroy(gCurTask);
        return;
    } else {
        DustCloud *sdc = TaskGetStructPtr(gCurTask);
        Sprite *s = &sdc->s;

        if (p->spindashAccel > Q_24_8(2.0)) {
            s->graphics.anim = SA2_ANIM_SPINDASH_DUST_CLOUD_BIG;
            s->variant = 0;
            s->unk21 = 0xFF;
            gCurTask->main = Task_SpindashDustCloudBig;
        }

        cam = &gCamera;
        offY = p->unk17;

        if (GRAVITY_IS_INVERTED) {
            offY = -offY;
        }

        if (IS_MULTI_PLAYER) {
            struct Task *t = gMultiplayerPlayerTasks[SIO_MULTI_CNT->id];
            struct MultiplayerPlayer *mpp = TaskGetStructPtr(t);
            s->x = (mpp->unk50 - cam->x);
            s->y = ((mpp->unk52 + offY) - cam->y);
        } else {
            s->x = Q_24_8_TO_INT(p->x) - cam->x;
            s->y = (Q_24_8_TO_INT(p->y) + offY) - cam->y;
        }

        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
            s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
        }

        if (GRAVITY_IS_INVERTED) {
            s->unk10 |= SPRITE_FLAG_MASK_Y_FLIP;
        } else {
            s->unk10 &= ~SPRITE_FLAG_MASK_Y_FLIP;
        }

        sub_8004558(s);
        sub_80051E8(s);
    }
}

void Task_SpindashDustCloudBig(void)
{
    struct Camera *cam;
    Player *p = &gPlayer;
    s32 offY;

    if (p->spriteTask == NULL
        || (p->moveState & (MOVESTATE_400 | MOVESTATE_DEAD)) != MOVESTATE_400) {
        TaskDestroy(gCurTask);
        return;
    } else {
        DustCloud *sdc = TaskGetStructPtr(gCurTask);
        Sprite *s = &sdc->s;

        if (p->spindashAccel <= Q_24_8(2.0)) {
            s->graphics.anim = SA2_ANIM_SPINDASH_DUST_CLOUD;
            s->variant = 0;
            s->unk21 = 0xFF;
            gCurTask->main = Task_SpindashDustCloud;
        }

        cam = &gCamera;
        offY = p->unk17;

        if (GRAVITY_IS_INVERTED) {
            offY = -offY;
        }

        if (IS_MULTI_PLAYER) {
            struct Task *t = gMultiplayerPlayerTasks[SIO_MULTI_CNT->id];
            struct MultiplayerPlayer *mpp = TaskGetStructPtr(t);
            s->x = (mpp->unk50 - cam->x);
            s->y = ((mpp->unk52 + offY) - cam->y);
        } else {
            s->x = Q_24_8_TO_INT(p->x) - cam->x;
            s->y = (Q_24_8_TO_INT(p->y) + offY) - cam->y;
        }

        if (!(p->moveState & MOVESTATE_FACING_LEFT)) {
            s->unk10 |= SPRITE_FLAG_MASK_X_FLIP;
        } else {
            s->unk10 &= ~SPRITE_FLAG_MASK_X_FLIP;
        }

        if (GRAVITY_IS_INVERTED) {
            s->unk10 |= SPRITE_FLAG_MASK_Y_FLIP;
        } else {
            s->unk10 &= ~SPRITE_FLAG_MASK_Y_FLIP;
        }

        sub_8004558(s);
        sub_80051E8(s);
    }
}

void TaskDestructor_SpindashDustCloud(struct Task *t)
{
    DustCloud *sdc = TaskGetStructPtr(t);
    VramFree(sdc->s.graphics.dest);
}