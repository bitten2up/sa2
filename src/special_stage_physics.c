#include "main.h"
#include "special_stage.h"
#include "special_stage_player.h"
#include "special_stage_physics.h"
#include "special_stage_guard_robo.h"
#include "special_stage_data.h"
#include "task.h"
#include "trig.h"
#include "game.h"
#include "m4a.h"
#include "constants/songs.h"

void sub_806F9CC(void);
void sub_806F9CC(void);
void sub_806F9CC(void);
void sub_806F9CC(void);
void sub_806EFB4(void);
void sub_806F034(void);
void sub_806F3C4(void);
void sub_806F36C(void);
void sub_806F9E4(void);
void sub_806F0C4(void);
void sub_806F154(void);
void sub_806F1E8(void);
void sub_806F268(void);
void sub_806FB00(void);
void sub_806F300(void);
void sub_806F300(void);

s16 sub_806F69C(struct SpecialStage*);
void sub_806FAA0(void);
void sub_806F56C(void);
void sub_806F604(void);
void sub_806FA34(void);

static const struct UNK_8C87920 gUnknown_080DF794[3] = {
    { 2, 890, },
    { 1, 890, },
    { 0, 890, },
};

typedef void (*TaskFunc_80DF7A0)(void);

static TaskFunc_80DF7A0 const gUnknown_080DF7A0[18] = {
    NULL,
    sub_806F9CC,
    sub_806F9CC,
    sub_806F9CC,
    sub_806F9CC,
    sub_806EFB4,
    sub_806F034,
    sub_806F3C4,
    sub_806F36C,
    sub_806F9E4,
    sub_806F0C4,
    sub_806F154,
    sub_806F1E8,
    sub_806F268,
    sub_806FB00,
    sub_806F300,
    sub_806F300,
    NULL,
};

void sub_806EC24(void) {
    s32 temp5;
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = physics->stage;
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);
    
    TaskFunc_80DF7A0 funcs[18];
    memcpy(funcs, gUnknown_080DF7A0, sizeof(gUnknown_080DF7A0));

    switch (stage->state) {
        case 4:
        case 5:
        case 6:
            if (stage->paused == FALSE) {
                funcs[player->state + 1]();
            }
            break;
        case 7:
            if (player->state < 0xB) {
                player->state = 0xB;
            }
            if (stage->paused == FALSE) {
                funcs[player->state + 1]();
            }
            break;
    }

    if (player->state < 0xB) {
        s32 screenX, screenY;
        struct UNK_0808B3FC_UNK240* element;
        s16 result = sub_806F69C(stage);
        s32 sin = SIN(result) * 4;
        s32 cos = COS(result) * 4;

        screenX = sin * 0x14;
        screenY = cos * 0x14;
    
        screenX = Q_16_16_TO_INT(screenX) + 0x70;
        screenY = -(Q_16_16_TO_INT(screenY) >> 1) + 0x78;
        
        player->unk68.unk16 = screenX;
        player->unk68.unk18 = screenY;

        if (result > 0x100 && result < 0x300) {
            player->unk68.unk1A = 0;
        } else {
            player->unk68.unk1A = 0x280;
        }

        sub_80047A0(result, 0x100, 0x100, 0x1E);

        if (stage->paused == FALSE) {
            sub_8004558(&player->unk68);
        }
        sub_80051E8(&player->unk68);
    }

    sub_806FAA0();
    stage->cameraX = player->x;
    stage->cameraY = player->y;
    stage->cameraBearing = player->bearing;

    gBgScrollRegs[2][1] = temp5 = -Q_16_16_TO_INT(player->y);
    gBgScrollRegs[2][0] = temp5 = -Q_16_16_TO_INT(player->x);
}

void sub_806EDB4(UNUSED u32 unused) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    s32 speed = player->speed;
    s32 maxSpeed = player->maxSpeed;

    u16 bearing = player->bearing;
    s32 sin = SIN(bearing);
    s32 cos = COS(bearing);

    if (gInput & DPAD_UP) {
        s32 acceleration = player->acceleration;
        if (speed < maxSpeed) {
            if ((speed + acceleration) < maxSpeed) {
                player->speed = speed + acceleration;
                speed = player->speed;
                
                if (player->speed > 0x2300) {
                    player->state = 2;
                } else {
                    player->state = 1;
                }
            } else {
                player->speed = maxSpeed;
                speed = player->speed;
                player->state = 2;
            }
        } else {
            player->speed = speed + player->coastResistence;
            speed = player->speed;
            player->state = 2;
        }
        player->animSpeed = speed >> 9;
    } else if (gInput & DPAD_DOWN) {
        s32 deceleration = player->deceleration;
        if (player->state == 0) {
            player->state = 7;
            return;
        }

        if ((speed + deceleration) > 0) {
            player->speed = speed + deceleration; 
            speed = player->speed;
        } else {
            player->speed = 0;
            speed = 0;
        }

        if (speed == 0) {
            player->animSpeed = 0;
            player->state = 8;
        } else {
            player->state = 3;
        }
    } else {
        if (speed + player->coastResistence > 0) {
            player->speed = speed + player->coastResistence;
            speed = player->speed;
        } else {
            player->speed = 0;
            speed = 0;
            
        }
    
        if (speed == 0) {
            player->animSpeed = 0;
            player->state = 0;
        } else {
            if (speed > 0x2300) {
                player->state = 2;
                player->animSpeed = speed >> 9;
            } else {
                player->state = 1;
                player->animSpeed = speed >> 9;
            }
        }
    }
    {
        s32 dX = (sin * speed) >> 10;
        s32 dY = (cos * speed) >> 10;
        player->x -= dX;
        player->y -= dY;
    }
}

void sub_806EF44(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    u16 bearing = player->bearing;
    
    if (gInput & (DPAD_LEFT | DPAD_RIGHT)) {
        if (gInput & DPAD_LEFT) {
            bearing += player->rotateSpeed;
        }
        if (gInput & DPAD_RIGHT) {
            bearing -= player->rotateSpeed;
        }
        
        player->bearing = bearing;
        player->bearing &= 0x3FF;
    }
}

void sub_806EFB4(void) { 
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);
    sub_806EF44();
    sub_806F56C();

    player->unkBA++;

    player->unkB8 += player->unkF2;

    if (player->unkBA >= player->unkF0 || !(gInput & gUnknown_03005B38.unk0)) {
        player->state = 5;
    }
}

void sub_806F034(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);
    sub_806EF44();
    sub_806F56C();
    
    player->unkB8 += player->unkF4;

    if (player->unkB0 < 1) {
        s32 speed = player->speed;
        player->unkB0 = 0;
        if (speed < 1) {
            player->state = 8;
        } else if (speed < 0x2301) {
            player->state = 1;
        } else {
            player->state = 2;
        }
    }
}

void sub_806F0C4(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);
    sub_806EF44();
    sub_806F604();
    
    player->unkB8 += player->unkF6;

    if (player->unkB0 < 1) {
        s32 speed = player->speed;
        player->unkB0 = 0;
        if (speed < 1) {
            player->state = 8;
        } else if (speed < 0x2301) {
            player->state = 1;
        } else {
            player->state = 2;
        }
    }
}

void sub_806F154(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    sub_806EF44();
    sub_806F604();

    player->x += player->unkD0;
    player->y += player->unkD4;
    player->unkB8 += player->unkF4;

    if (player->unkB0 < 1) {
        player->speed = 0x2000;
        player->unkB0 = 0;
        player->state = 1;
    }
}

void sub_806F1E8(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);
    physics->animFrame++;
    player->unkB8 += player->unkFA;
    sub_806F56C();

    if (player->unkB0 < 1) {
        physics->animFrame = 0;
        player->unkB8 = 0;
        player->unkB0 = 0;
        
        if (player->speed == 0) {
            player->state = 0xD;
        } else {
            player->state = 0xC;
        }
    }
}

void sub_806F268(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    s32 deceleration = player->deceleration;
    s32 speed = player->speed;
    u16 bearing = player->bearing;

    s32 sin = SIN(bearing);
    s32 cos = COS(bearing);
    if ((speed + deceleration) > 0) {
        player->speed = speed + deceleration;
        speed += deceleration;
    } else {
        player->speed = 0;
        speed = 0;
    }

    {
        s32 temp2 = (sin * speed) >> 10;
        s32 temp3 = (cos * speed) >> 10;
        player->x -= temp2;
        player->y -= temp3;
    }

    if (speed == 0) {
        player->state = 0xD;
    }
}

void sub_806F300(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    physics->animFrame++;
    player->unkB8 += player->unkFE;

    if (player->unkB0 < -0x4000) {
        physics->animFrame = 0;
        player->unkB8 = 0;
        player->unkB0 = -0x4000;
        player->state = 0xF;
    }
}

void sub_806F36C(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    u16 bearing = (player->bearing + 0x10);
    player->bearing = bearing & 0x3FF;
    physics->animFrame++;

    if (physics->animFrame > 0x1F) {
        physics->animFrame = 0;
        player->speed = 0;
        player->state = 8;
    }
}

void sub_806F3C4(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    if (player->x <= Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X);
    } 

    if (player->x >= Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->y <= Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y);
    }

    if (player->y >= Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y);
    }

    physics->animFrame++;

    player->unkB8 += player->unkFA;

    if (player->unkB0 < 0) {
        player->unkB0 = 0;
        player->unkB8 = 0;
        physics->animFrame = 0;

        // TODO: must be a macro
        player->unkB8 = 0;
        player->unkB0 = 0;
        player->state = 0;
    }
}

void sub_806F468(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStage* stage = physics->stage;
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);
    const struct UNK_8C87904* unk7904 = gUnknown_08C87904[stage->zone];

    s16 playerX = Q_16_16_TO_INT(player->x);
    s16 playerY = Q_16_16_TO_INT(player->y);

    while (unk7904->unk0 != -1) {
        if (playerX >= unk7904->unk2 && playerX < (unk7904->unk2 + unk7904->unk6)) {
            if (playerY >= unk7904->unk4 && playerY < (unk7904->unk4 + unk7904->unk8)) {
                switch(unk7904->unk0) {
                    case 0:
                        player->speed = player->unkE8;
                        player->state = 2;
                        m4aSongNumStart(SE_277);
                        return;
                    case 1:
                        player->speed = player->speed < 0x600 ? 
                            0x600 : 
                            player->speed;
            
                        player->state = 9;
                        player->unkB0 = 0;
                        player->unkB8 = player->unkEE;
                        player->unkBA = 0;
                        m4aSongNumStart(SE_276);
                        return;
                }
            }
        }
        unk7904++;
    }
}

void sub_806F56C(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    s32 speed = player->speed;
    u16 bearing = player->bearing;
    s32 unk100 = player->unk100;

    s32 sin1 = gSineTable[bearing];
    s32 sin2 = gSineTable[bearing + 0x100];

    if ((speed + unk100) > 0) {
        player->speed = (speed + unk100);
        speed = (speed + unk100);
    } else {
        player->speed = 0;
        speed = 0;
    }
    {
        s32 temp1 = (sin1 * speed) >> 10;
        s32 temp2 = (sin2 * speed) >> 10;
        player->x -= temp1;
        player->y -= temp2;
    }
}

void sub_806F604(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    s32 c8 = player->speed;
    u16 b2 = player->bearing;
    s32 unk104 = player->unk104;

    s32 sin1 = gSineTable[b2];
    s32 sin2 = gSineTable[b2 + 0x100];

    if ((c8 + unk104) > 0) {
        player->speed = c8 + unk104;
        c8 += unk104;
    } else {
        player->speed = 0;
        c8 = 0;
    }

    {
        s32 temp1 = (sin1 * c8)  >> 10;
        s32 temp2 = (sin2 * c8) >> 10;
        player->x -= temp1;
        player->y -= temp2;
    }
}

// handle collision
s16 sub_806F69C(struct SpecialStage* stage) {
    u32 i;
    s32 cos, sin;
    struct UNK_0808B3FC_UNK240* element;
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);
    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(stage->guardRoboTask);

    u32 temp1;
    u32 temp2;
    u16 temp3;
    s32 f_dX;
    s32 f_dY;
    s16 dX;
    s16 dY;

    u16 b2 = -player->bearing & 0x3FF;

    f_dX = guardRobo->x - player->x;
    f_dY = guardRobo->y - player->y;
    dX = f_dX >> 0x10;
    dY = f_dY  >> 0x10;

    if (dX > -16 && dX < 16 && dY > -16 && dY < 16) {
        temp1 = 0xC;
    } else {
        if (dX > -256 && dX < 256 && dY > -256 && dY < 256) {
            temp1 = 0x10;
        } else {
            temp1 = 0x14;
        }
    }
    

    if (dX > -48 && dX < 48 && dY > -48 && dY < 48) {
        temp2 = 0;
    } else {
        if (dX > -96 && dX < 96 && dY > -96 && dY < 96) {
            temp2 = 1;
        } else {
            temp2 = 2;
        }
    }

    player->unk68.unk20 = gUnknown_080DF794[temp2].unk0;
    player->unk68.unkA = gUnknown_080DF794[temp2].unk2;

    temp3 = temp1;
    f_dX = f_dX >> temp3;
    f_dY = f_dY >> temp3;

    sin = SIN(b2);
    cos = COS(b2);

    {
        s32 sin5 = sin * f_dY;
        s32 sin6 = cos * f_dX;
        s32 sin3 = -sin * f_dX;
        s32 sin4 = cos * f_dY;
    
        f_dX = sin5 + sin6;
        f_dY = sin3 + sin4;
    }
    
    for (i = 256; i > 0; i >>= 1) {
        sin = gSineTable[b2] >> 6;
        cos = gSineTable[b2 + 0x100] >> 6;

        if ((sin * f_dY + cos * f_dX) > 0) {
            b2 = (b2 + i) & 0x3FF;
        } else {
            if ((sin * f_dY + cos * f_dX) >= 0) {
                s32 a = -sin * f_dX;
                s32 b = cos * f_dY;
                b = a + cos * f_dY;
                if (b >= 0) {
                    return (b2 + 0x200) & 0x3FF;
                }
                break;
            }
            b2 = (b2 - i) & 0x3FF;
        }
    }

    return b2;
}

s16 sub_806F84C(s32 a, s32 b) {
    u32 r2, r3;
    u16 r1, r3_2;
    s32 r4;

    s32 x = (a >> 8);
    s32 y = (b >> 8);
    s16 i = 0;

    x *= x;
    y *= y;
    r4 = (x + y);

    if (r4 == 0 || r4 == 1) {
        return r4;
    }

    while (r4 > 0) {
        r4 *= 2;
        i++;
    };

    r2 = (u16)(~Q_16_16_TO_INT((u32)r4));

#ifndef NON_MATCHING
    r2++; r2--;
#endif

    r3 = (r2 >> 1);
    r1 = r3;
    r3 = (r3 * r2) >> 0x12;
    r1 += r3;
    r3 = (r3 * r2) >> 0x11;
    r1 += r3;
    r3 = (r3 * r2) >> 0x10;
    r3_2 = (r3 * 0xA000) >> 0x10;

    r1 = r1 + r3_2;
    r3_2 = (r3_2 * r2) >> 0x10;
    r3_2 = (r3_2 * 0xB333) >> 0x10;
    r1 += r3_2;
    r3_2 = r1 ^ 0xFFFF;
    r3_2 = r3_2 + ((r4 - (r3_2 * r3_2)) >> 0x11);

    if (i & 1) {
        r3_2 = (((r3_2 >> (i >> 1)) * 0xB505) + 0x8000) >> 0x10;
    } else {
        r3_2 = r3_2 >> (i >> 1);
    }

    return r3_2;
}

struct Task* CreateSpecialStagePhysics(struct SpecialStage* stage) {
    struct Task* t = TaskCreate(sub_806EC24, 8, 0x4000, 0, 0);
    struct SpecialStagePhysics* physics = TaskGetStructPtr(t);

    physics->stage = stage;
    physics->animFrame = 0;
    physics->unk6 = 0x3C;

    return t;
}

void sub_806F944(struct SpecialStage* stage) {
    struct SpecialStagePlayer* player = TaskGetStructPtr(stage->playerTask);
    struct SpecialStageGuardRobo* guardRobo = TaskGetStructPtr(stage->guardRoboTask);

    s32 playerX = player->x;
    s32 playerY = player->y;
    s32 guardRoboX = guardRobo->x;
    s32 guardRoboY = guardRobo->y;

    s16 result = sub_806F84C((playerX - guardRoboX) >> 4, (playerY - guardRoboY) >> 4);
    player->unkD0 = ((playerX - guardRoboX) * 0x20) / result;
    player->unkD4 = ((playerY - guardRoboY) * 0x20) / result;

    player->unkB8 = 0x300;
}

void sub_806F9CC(void) {
    sub_806EDB4(0);
    sub_806EF44();
    sub_806FA34();
    sub_806F468();
}

void sub_806F9E4(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    sub_806EDB4(1);
    sub_806EF44();
    sub_806FA34();
    if (!(gInput & DPAD_DOWN)) {
        player->state = 0;
    }
    sub_806F468();
}

void sub_806FA34(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    if (gPressedKeys & gUnknown_03005B38.unk0) {
        player->state = 4;
        player->unkB0 = 0;
        player->unkB8 = player->unkEC;
        player->unkBA = 0;
        m4aSongNumStart(SE_JUMP);
    }
}

void sub_806FAA0(void) {
    struct SpecialStagePhysics* physics = TaskGetStructPtr(gCurTask);
    struct SpecialStagePlayer* player = TaskGetStructPtr(physics->stage->playerTask);

    if (player->x < Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->x > Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X)) {
        player->x = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_X);
    }

    if (player->y < Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MIN_SPECIAL_STAGE_PLAYER_Y);
    }

    if (player->y > Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y)) {
        player->y = Q_16_16(MAX_SPECIAL_STAGE_PLAYER_Y);
    }
}

void sub_806FB00(void) {

}