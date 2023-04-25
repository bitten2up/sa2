#include "global.h"
#include "malloc_vram.h"
#include "lib/m4a.h"

#include "game/game.h"
#include "task.h"
#include "core.h"
#include "sprite.h"
#include "trig.h"
#include "game/entity.h"

#include "constants/animations.h"
#include "constants/move_states.h"
#include "constants/songs.h"

typedef struct {
    SpriteBase base;
    s32 unkC;
    s32 unk10;
} Sprite_Corkscrew;

void sub_8060ED0(void);

void Task_8060D34(void)
{
    Sprite_Corkscrew *corkscrew = TaskGetStructPtr(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(corkscrew->base.me->y, regionY);

    if (PLAYER_IS_ALIVE) {
        if ((x + (me->d.sData[0] * 8) <= Q_24_8_TO_INT(gPlayer.x)
             && (x + (me->d.sData[0] * 8) + (me->d.uData[2] * 8)
                 >= Q_24_8_TO_INT(gPlayer.x)))
            && (y + (me->d.sData[1] * 8) <= Q_24_8_TO_INT(gPlayer.y)
                && y + (me->d.sData[1] * 8) + (me->d.uData[3] * 8)
                    >= Q_24_8_TO_INT(gPlayer.y))) {
            if (x < Q_24_8_TO_INT(gPlayer.x) && (corkscrew->base.spriteY & 1)) {
                s32 idx;
                s32 y24_8;
                gPlayer.unk6D = 27;

                idx = ((((Q_24_8_TO_INT(gPlayer.x) - x) * 930) >> 8) + 256) & ONE_CYCLE;
                gPlayer.x += gPlayer.speedGroundX;
                y24_8 = Q_24_8(y);
                gPlayer.y = SIN_24_8(idx) * 24 + y24_8 - Q_24_8(28);

                gPlayer.speedAirY = 0;
                gCurTask->main = sub_8060ED0;
            } else if ((x >= Q_24_8_TO_INT(gPlayer.x)) && gPlayer.speedGroundX > Q_8_8(4)
                       && !(gPlayer.moveState & MOVESTATE_IN_AIR)
                       && !(gPlayer.unk5E & gPlayerControls.jump)) {
                corkscrew->base.spriteY |= 1;
            } else {
                corkscrew->base.spriteY &= ~1;
            }
        } else {
            corkscrew->base.spriteY &= ~1;
        }
    }

    x -= gCamera.x;
    y -= gCamera.y;

    if (IS_OUT_OF_CAM_RANGE_TYPED(u32, x, y)) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
    }
}

void sub_8060ED0(void)
{
    s32 y24_8, idx;

    Sprite_Corkscrew *corkscrew = TaskGetStructPtr(gCurTask);
    MapEntity *me = corkscrew->base.me;

    u16 regionX = corkscrew->base.regionX;
    u16 regionY = corkscrew->base.regionY;
    Player *player = &gPlayer;
    s32 x = TO_WORLD_POS(corkscrew->base.spriteX, regionX);
    s32 y = TO_WORLD_POS(me->y, regionY);

    if (!PLAYER_IS_ALIVE) {
        SET_MAP_ENTITY_NOT_INITIALIZED(me, corkscrew->base.spriteX);
        TaskDestroy(gCurTask);
        return;
    }

    if (Q_24_8_TO_INT(player->x) - x > 0x230) {
        if (player->moveState & MOVESTATE_4) {
            player->unk6D = 2;
        } else {
            player->unk6D = 1;
        }
        gCurTask->main = Task_8060D34;
        return;
    }

    idx = Q_24_8_TO_INT((Q_24_8_TO_INT(player->x) - x) * 930);
    idx = (idx + 256) & ONE_CYCLE;

    player->x += player->speedGroundX;
    y24_8 = Q_24_8(y);
    player->y = SIN_24_8(idx) * 24 + y24_8 - Q_24_8(28);
    player->speedAirY = 0;

    if (player->speedGroundX < corkscrew->unk10) {
        player->unk64 = 50;
        player->speedAirX = player->speedGroundX;
        player->unk6D = 5;
        gCurTask->main = Task_8060D34;
    } else if (player->unk5E & gPlayerControls.jump) {
        player->unk64 = 50;
        player->speedAirX = player->speedGroundX;
        player->speedAirY = -Q_24_8(4.875);
        player->unk6D = 5;
        gCurTask->main = Task_8060D34;
    } else if (!(player->moveState & MOVESTATE_4) && player->unk5E & DPAD_DOWN) {
        player->unk64 = 4;
        sub_8023B5C(player, 9);
        player->unk16 = 6;
        player->unk17 = 9;
        player->moveState |= MOVESTATE_4;
        m4aSongNumStart(SE_SPIN_ATTACK);
    } else if (!(player->moveState & MOVESTATE_4)) {
        player->unk68 = PlayerCharacterIdleAnims[player->character] + 68;
        player->unk6A = Div((idx - 282) & ONE_CYCLE, 94);
    }
}
