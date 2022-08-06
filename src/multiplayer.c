#include "global.h"
#include "data.h"
#include "multiplayer.h"
#include "multiplayer_mode_select.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "title_screen.h"
#include "multi_sio.h"
#include "input.h"
#include "m4a.h"
#include "constants/songs.h"
#include "game.h"
#include "flags.h"
#include "zones.h"
#include "character_select.h"

struct MultiplayerConnectScreen {
    struct UNK_802D4CC_UNK270 unk0;
    struct UNK_0808B3FC_UNK240 unkC;
    struct UNK_0808B3FC_UNK240 unk3C;
    struct UNK_0808B3FC_UNK240 unk6C;
    struct Unk_03002400 unk9C;
    u32 unkDC;
    u8 fillerDC[8];
    u16 unkE8;
    u8 fillerEA;
    u8 unkEB;
    u8 fillerEC[2];
    u8 unkEE[MULTI_SIO_PLAYERS_MAX];
    u8 unkF2[MULTI_SIO_PLAYERS_MAX];

    u8 unkF6;
    u8 fillerF7[3];
    u8 unkFA;
    u8 unkFB;
    u8 unkFC;
    u8 unkFD;
}; /** size 0x100 */

u8 gUnknown_03005594;
u8 gUnknown_030054D8;
u32 gUnknown_03005410[MULTI_SIO_PLAYERS_MAX];

// gMultiplayerNames
u16 gUnknown_03005460[MULTI_SIO_PLAYERS_MAX][MAX_PLAYER_NAME_LENGTH];

u32 gUnknown_03005434;
u8 gUnknown_030055B8;

static void sub_805ADAC(void);
static void sub_805B4C0(void);
static void sub_805B454(void);

#define CONNECTION_SUCCESS 0
#define CONNECTION_ERROR 1

// CreateConnectionStateScreen
extern void sub_805BA10(u8);

extern const struct UNK_080E0D64 gUnknown_080D9050[7];

void StartMultiPakConnect(void) {
    struct Task* t;
    struct MultiplayerConnectScreen* connectScreen;
    struct UNK_802D4CC_UNK270* unk0;
    struct UNK_0808B3FC_UNK240* unkC;
    struct Unk_03002400* unk9C;
    const struct UNK_080E0D64* unkD64;
    void* vramAddr = (void*)OBJ_VRAM0;
    u8 i;

    gUnknown_030054D4[3] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[0] = 0;
    DmaFill32(3, 0, &gMultiSioSend, sizeof(gMultiSioSend));
    DmaFill32(3, 0, gMultiSioRecv, sizeof(gMultiSioRecv));
    gDispCnt = 0x1141;
    gBgCntRegs[0] = 0x1401;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;
    gBgScrollRegs[1][0] = 0;
    gBgScrollRegs[1][1] = 0;

    t = TaskCreate(sub_805ADAC, sizeof(struct MultiplayerConnectScreen), 0x2000, 0, NULL);
    connectScreen = TaskGetStructPtr(t, connectScreen);
    connectScreen->unkEB = 0;
    connectScreen->unkFC = 1;
    connectScreen->unkFD = 0;

    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        connectScreen->unkEE[i] = 0;
        connectScreen->unkF2[i] = 0;
    }

    unk0 = &connectScreen->unk0;
    unk0->unk0 = 1;
    unk0->unk4 = 0;
    unk0->unk2 = 2;
    unk0->unk6 = 0x100;
    unk0->unk8 = 0x3FFF;
    unk0->unkA = 0;
    sub_802D4CC(unk0);
    
    unkC = &connectScreen->unkC;
    unkC->unk4 = vramAddr;
    vramAddr += gUnknown_080D9050[gLoadedSaveGame->unk6].unk0 * TILE_SIZE_4BPP;
    unkC->unkA = gUnknown_080D9050[gLoadedSaveGame->unk6].unk4;
    unkC->unk20 = gUnknown_080D9050[gLoadedSaveGame->unk6].unk6;
    unkC->unk21 = 0xFF;
    unkC->unk16 = 8;
    unkC->unk18 = 0x18;
    unkC->unk1A = 0x100;
    unkC->unk8 = 0;
    unkC->unk14 = 0;
    unkC->unk1C = 0;
    unkC->unk22 = 0x10;
    unkC->unk25 = 0;
    unkC->unk28 = -1;
    unkC->unk10 = 0x1000;
    sub_8004558(unkC);

    unkC = &connectScreen->unk3C;
    unkC->unk4 = vramAddr;
    vramAddr += gPressStartTiles[gLoadedSaveGame->unk6].unk0 * TILE_SIZE_4BPP;
    unkC->unkA = gPressStartTiles[gLoadedSaveGame->unk6].unk4;
    unkC->unk20 = gPressStartTiles[gLoadedSaveGame->unk6].unk6;
    unkC->unk21 = 0xFF;
    unkC->unk16 = 0x78;
    unkC->unk18 = 0x7A;
    unkC->unk1A = 0x100;
    unkC->unk8 = 0;
    unkC->unk14 = 0;
    unkC->unk1C = 0;
    unkC->unk22 = 0x10;
    unkC->unk25 = 0;
    unkC->unk28 = -1;
    unkC->unk10 = 0x1000;

    unkC = &connectScreen->unk6C;
    unkC->unk4 = vramAddr;
    unkC->unkA = 0x432;
    unkC->unk20 = 8;
    unkC->unk21 = 0xFF;
    unkC->unk16 = 0x78;
    unkC->unk18 = 0x8C;
    unkC->unk1A = 0x100;
    unkC->unk8 = 0;
    unkC->unk14 = 0;
    unkC->unk1C = 0;
    unkC->unk22 = 0x10;
    unkC->unk25 = 0;
    unkC->unk28 = -1;
    unkC->unk10 = 0x1000;

    // TODO: make macro
    unk9C = &connectScreen->unk9C;
    unk9C->unk4 = BG_SCREEN_ADDR(0);
    unk9C->unkA = 0;
    unk9C->unkC = BG_SCREEN_ADDR(20);
    unk9C->unk18 = 0;
    unk9C->unk1A = 0;
    unk9C->unk1C = 0x72;
    unk9C->unk1E = 0;
    unk9C->unk20 = 0;
    unk9C->unk22 = 0;
    unk9C->unk24 = 0;
    unk9C->unk26 = 0x1E;
    unk9C->unk28 = 0x14;
    unk9C->unk2A = 0;
    unk9C->unk2E = 0;
    sub_8002A3C(unk9C);
    
    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        MultiSioStart();
    }

    gUnknown_03005594 = gLoadedSaveGame->unk13 | 0xF;
    gUnknown_030054D8 = 1;
    
    for (i = 0; i < 5; i++) {
        if (gUnknown_030054D8 < gLoadedSaveGame->unk7[i]) {
            gUnknown_030054D8 = gLoadedSaveGame->unk7[i];
        }
    }

    if (gUnknown_030054D8 > 0x1B) {
        gUnknown_030054D8 = 0x1B;
    }

    connectScreen->unkF6 = 0;
    connectScreen->unkFA = 0;
}

static void sub_805ADAC(void) {
    s32 i;
    s32 x;
    s32 var1 = 0;
    s32 var2 = 0;
    u8 var3 = 0;
    bool8 r4 = FALSE;
    bool8 bool1 = FALSE;
    bool8 bool2 = FALSE;
    bool8 bool3 = TRUE;
    struct MultiplayerConnectScreen *connectScreen = TaskGetStructPtr(gCurTask, connectScreen);
    struct MultiSioData_0_0 *send, *recv;
    struct MultiSioData_0_0 *data;
    struct UNK_0808B3FC_UNK240 *r4p;

    sub_802D4CC(&connectScreen->unk0);

    if (gMultiSioStatusFlags & (MULTI_SIO_PARENT | MULTI_SIO_RECV_ID0)) {
        if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(SIO_MULTI_CNT->id))) {
            if (gUnknown_030054D4[SIO_MULTI_CNT->id]++ > 180) {
                TasksDestroyAll();
                gUnknown_03002AE4 = gUnknown_0300287C;
                gUnknown_03005390 = 0;
                gUnknown_03004D5C = gUnknown_03002A84;
                MultiPakCommunicationError();
                return;
            }
        } else {
            gUnknown_030054D4[SIO_MULTI_CNT->id] = 0;
        }
    }

    
    if (gMultiSioStatusFlags & MULTI_SIO_CONNECTED_ID0) {
        r4 = TRUE;
    }
    
    recv = &gMultiSioRecv[0].pat0;
    if (gMultiSioStatusFlags & MULTI_SIO_HARD_ERROR
        || (r4 && !(gMultiSioStatusFlags & MULTI_SIO_RECV_ID0) && recv->unk0 != 0)) {
        if (++connectScreen->unkFD >= 9) {
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            MultiPakCommunicationError();
            return;
        }
    } else {
        connectScreen->unkFD = 0;
    }
    
    for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
        data = &gMultiSioRecv[i].pat0;
        connectScreen->unkEE[i] <<= 1;
        connectScreen->unkF2[i] <<= 1;
        if (i == SIO_MULTI_CNT->id || 
            (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i) && 
             data->unk0 > 0x400F)) {
            connectScreen->unkEE[i] |= 1;
            var1++;
            var3 |= MULTI_SIO_RECV_ID(i);
            if (bool1) {
                bool2 = TRUE;
            }
            gUnknown_03005410[i] = data->unk4;
            gUnknown_03005460[i][0] = data->unk8[0];
            gUnknown_03005460[i][1] = data->unk8[1];
            gUnknown_03005460[i][2] = data->unk8[2];
            gUnknown_03005594 |= data->unkE;

            if (gUnknown_030054D8 < data->unkF) {
                gUnknown_030054D8 = data->unkF;
            }

            
        } else {
            u16 a = (&REG_SIOMULTI0)[i];
            bool1 = TRUE;
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i)) && a == 0) {
                bool2 = TRUE;
                connectScreen->unkF2[i] |= 1;

                if (connectScreen->unkEE[i] == 0) {
                    bool2 = TRUE;
                    bool3 = FALSE;
                }
            } else {
                if (connectScreen->unkF2[i] != 0
                    || (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i) && data->unk0 < 0x4010)) {
                    bool2 = TRUE;
                    bool3 = FALSE;
                }
            }
        }
        if (connectScreen->unkEE[i] != 0) {
            var2++;
        }
    }

    if (var2 == 0) {
        var2 = 1;
    }

    if (connectScreen->unkFA == 0) {
        if (!(gMultiSioStatusFlags & MULTI_SIO_PARENT) && gMultiSioStatusFlags & MULTI_SIO_RECV_ID0 && recv->unk0 > 0x4010) {
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            MultiPakCommunicationError();
            return;
        }
        connectScreen->unkFA = 1;
    }

    if (!bool2 && recv->unk0 == 0x4011 && connectScreen->unkFA != 0) {
        gUnknown_03005434 = recv->unk10;
        gUnknown_030055B8 = recv->unk2;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            if (GetBit(gUnknown_030055B8, i)) {
                if (i == 0) {
                    gUnknown_03005410[0] = recv->unk4;
                    gUnknown_03005460[0][0] = recv->unk8[0];
                    gUnknown_03005460[0][1] = recv->unk8[1];
                    gUnknown_03005460[0][2] = recv->unk8[2];
                    gUnknown_03005594 |= recv->unkE;
                    if (gUnknown_030054D8 < recv->unkF) {
                        gUnknown_030054D8 = recv->unkF;
                    }
                    continue;
                }
                data = &gMultiSioRecv[i].pat0;
                if (data->unk0 != 0x4010) {
                    continue;
                }
    
                gUnknown_03005410[i] = data->unk4;
                gUnknown_03005460[i][0] = data->unk8[0];
                gUnknown_03005460[i][1] = data->unk8[1];
#ifndef NON_MATCHING            
                do {
#endif
                gUnknown_03005460[i][2] = data->unk8[2];
#ifndef NON_MATCHING
                } while(0);
#endif
                gUnknown_03005594 |= data->unkE;
                if (gUnknown_030054D8 < data->unkF) {
                    gUnknown_030054D8 = data->unkF;
                }
            }
        }
        connectScreen->unkE8 = 0;
        connectScreen->unkF6 = 0;
        gUnknown_030054D4[3] = 0;
        gUnknown_030054D4[2] = 0;
        gUnknown_030054D4[1] = 0;
        gUnknown_030054D4[0] = 0;
        connectScreen->unkFB = 0;
        gCurTask->main = sub_805B4C0;
        sub_805B4C0();
        return;
    }

    if (recv->unk0 >= 0x4013) {
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        MultiPakCommunicationError();
        return;
    }
    
    if (gPressedKeys & B_BUTTON) {
        m4aSongNumStart(SE_RETURN);
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0;
            connectScreen->unkE8 = 0;
            gCurTask->main = sub_805B454;
            return;
        }

        gMultiSioEnabled = FALSE;
        MultiSioStop();
        MultiSioInit(0);
        send = &gMultiSioSend.pat0;
        send->unk0 = 0;
        gUnknown_03004D80[0] = 0;

        gUnknown_03002280[0] = 0;
        gUnknown_03002280[1] = 0;
        gUnknown_03002280[2] = 0xff;
        gUnknown_03002280[3] = 32;
        CreateMultiplayerModeSelectScreen();
        TaskDestroy(gCurTask);
        return;
    }

    if ((gMultiSioStatusFlags & MULTI_SIO_PARENT) && var2 > 1 && bool3) {
        r4p = &connectScreen->unk3C;
        sub_8004558(r4p);
        sub_80051E8(r4p);
    }
    
    if (var2 > 1) {
        r4p = &connectScreen->unk6C;
        r4p->unkA = 0x432;
        r4p->unk20 = var2 + 6;
        r4p->unk21 = 0xFF;
        sub_8004558(r4p);
        sub_80051E8(r4p);
    }
    r4p = &connectScreen->unkC;
    sub_80051E8(r4p);

    if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
        if ((!bool2 && var1 > 1 && gPressedKeys & START_BUTTON) || (connectScreen->unkF6 != 0 && !bool2 && var1 > 1)) {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0x4011;
            send->unk2 = var3;
            send->unk4 = gLoadedSaveGame->unk0;
            send->unk10 = connectScreen->unkDC;
            for (x = 0; x < 3; x++) {
                send->unk8[x] = gLoadedSaveGame->unk20[x];
            }
            send->unkE = gUnknown_03005594;
            send->unkF = gUnknown_030054D8;
            connectScreen->unkF6 = 1;
#ifndef NON_MATCHING            
            do {
#endif
            connectScreen->unkFC = 0;
#ifndef NON_MATCHING            
            } while(0);
#endif
            return;
        }
    }

    if (connectScreen->unkF6 != 0) {
        connectScreen->unkF6 = 0;
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT) {
            connectScreen->unkFC = 1;
        }
    }
    send = &gMultiSioSend.pat0;
    send->unk0 = 0x4010;
    send->unk4 = gLoadedSaveGame->unk0;
    for (x = 0; x < 3; x++) {
        send->unk8[x] = gLoadedSaveGame->unk20[x];
    }
    send->unkE = gUnknown_03005594;
    send->unkF = gUnknown_030054D8;
}

static void sub_805B454(void) {
    struct MultiplayerConnectScreen* connectScreen = TaskGetStructPtr(gCurTask, connectScreen);
    gMultiSioSend.pat0.unk0 = 0;
    if (++connectScreen->unkE8 > 4) {
        gMultiSioEnabled = FALSE;
        MultiSioStop();
        MultiSioInit(0);
        gUnknown_03004D80[0] = 0;
        gUnknown_03002280[0] = 0;
        gUnknown_03002280[1] = 0;
        gUnknown_03002280[2] = 0xFF;
        gUnknown_03002280[3] = 32;
        CreateMultiplayerModeSelectScreen();
        TaskDestroy(gCurTask);
    }
}




static void sub_805B4C0(void) {
    struct MultiSioData_0_0* recv, *data, *send;
    struct UNK_0808B3FC_UNK240* r4p;
    s32 i, j;
    
    u8 recv2;
    s32 count = 0;
    struct MultiplayerConnectScreen* connectScreen = TaskGetStructPtr(gCurTask, connectScreen);
    if (gGameMode > 2) {
        u32 i;
        for (i = 0; i < MULTI_SIO_PLAYERS_MAX && GetBit(gUnknown_030055B8, i); i++) {
            if (!(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
                if (gUnknown_030054D4[i]++ > 180) {
                    TasksDestroyAll();
                    gUnknown_03002AE4 = gUnknown_0300287C;
                    gUnknown_03005390 = 0;
                    gUnknown_03004D5C = gUnknown_03002A84;
                    MultiPakCommunicationError();
                    return;
                };
            } else {
                gUnknown_030054D4[i] = 0;
            }
        }
    }
    recv = &gMultiSioRecv[0].pat0;
    recv2 = recv->unk2;

    if (recv->unk0 == 0x4012) {
        if (!((recv2 >> SIO_MULTI_CNT->id) & 1)) {
            gMultiSioEnabled = FALSE;
            MultiSioStop();
            MultiSioInit(0);
            send = &gMultiSioSend.pat0;
            send->unk0 = 0;
            gUnknown_03004D80[0] = 0;
            gUnknown_03002280[0] = 0;
            gUnknown_03002280[1] = 0;
            gUnknown_03002280[2] = 0xFF;
            gUnknown_03002280[3] = 32;
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            MultiPakCommunicationError();
            return;
        }

        gGameMode = 3;
        for (i = 3; i >= 0; i--) {
            if (GetBit(gUnknown_030055B8, i)) {
                if (i == 0) {
                    if (gUnknown_03005410[i] == recv->unk4) {
                        gUnknown_03005460[i][3] = recv->unk8[0];
                        gUnknown_03005460[i][4] = recv->unk8[1];
                        gUnknown_03005460[i][5] = recv->unk8[2];
                    } else {
                        gUnknown_03005460[i][0] = PLAYER_NAME_END_CHAR;
                    }
                    gUnknown_03005594 |= recv->unkE;
                    if (gUnknown_030054D8 < recv->unkF) {
                        gUnknown_030054D8 = recv->unkF;
                    }
                } else {
                    data = &gMultiSioRecv[i].pat0;
                    if (data->unk0 == 0x4011) {
                        if (gUnknown_03005410[i] == data->unk4) {
                            gUnknown_03005460[i][3] = data->unk8[0];
                            gUnknown_03005460[i][4] = data->unk8[1]; 
                            gUnknown_03005460[i][5] = data->unk8[2];
                        } else {
                            gUnknown_03005460[i][0] = PLAYER_NAME_END_CHAR;
                        }
                        gUnknown_03005594 |= data->unkE;
                        if (gUnknown_030054D8 < data->unkF) {
                            gUnknown_030054D8 = data->unkF;
                        }
                    }
                }

                if (i != SIO_MULTI_CNT->id) {
                    InsertMultiplayerProfile(gUnknown_03005410[i], gUnknown_03005460[i]);
                }
            } 
        }
        WriteSaveGame();
        TaskDestroy(gCurTask);
        sub_805BA10(CONNECTION_SUCCESS);
        return;
    } 
    if (recv->unk0 == 0x4010) {
        gMultiSioEnabled = FALSE;
        MultiSioStop();
        MultiSioInit(0);
        send = &gMultiSioSend.pat0;
        send->unk0 = 0;
        gUnknown_03004D80[0] = 0;
        gUnknown_03002280[0] = 0;
        gUnknown_03002280[1] = 0;
        gUnknown_03002280[2] = 0xFF;
        gUnknown_03002280[3] = 32;
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        MultiPakCommunicationError();
        return;
    } else {
        if (gMultiSioStatusFlags & MULTI_SIO_PARENT && connectScreen->unkFB++ >= 0x3D) {
            TasksDestroyAll();
            gUnknown_03002AE4 = gUnknown_0300287C;
            gUnknown_03005390 = 0;
            gUnknown_03004D5C = gUnknown_03002A84;
            MultiPakCommunicationError();
            return;
        }

        for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
            u8 unkEE = connectScreen->unkEE[i];
            connectScreen->unkEE[i] <<= 1;
            if (unkEE << 0x19) {
                count++;
            }
        }

        if (count == 0) {
            count = 1;
        }

        if (count > 1) {
            r4p = &connectScreen->unk6C;
            r4p->unkA = 0x432;
            r4p->unk20 = count + 6;
            r4p->unk21 = 0xFF;
            sub_8004558(r4p);
            sub_80051E8(r4p);
        }

        if ((gMultiSioStatusFlags & MULTI_SIO_PARENT)) {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0x4012;
            send->unk2 = recv2;
            send->unk4 = gLoadedSaveGame->unk0;
            for (j = 0; j < 3; j++) {
                send->unk8[j] = gLoadedSaveGame->unk20[j + 3];
            }
            send->unkE = gUnknown_03005594;
            send->unkF = gUnknown_030054D8;
    
            for (i = 0; i < MULTI_SIO_PLAYERS_MAX; i++) {
                bool8 someBool = FALSE;

                if (!GetBit(gUnknown_030055B8, i)) {
                    if (gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i)) {
                        someBool = TRUE;
                    } else {
                        continue;
                    }
                }

                if (i != 0) {
                    if (!someBool && !(gMultiSioStatusFlags & MULTI_SIO_RECV_ID(i))) {
                        someBool = TRUE;
                    }
                    if (!someBool) {
                        data = &gMultiSioRecv[i].pat0;
                        if (data->unk0 != 0x4011) {
                            someBool = TRUE;
                        }
                    }
                    if (!someBool) {
                        continue;
                    }
                    send->unk0 = 0x4011;
                    for (j = 0; j < 3; j++) {
                        send->unk8[j] = gLoadedSaveGame->unk20[j];
                    };
                    
                    return;
                }
            }
        } else {
            send = &gMultiSioSend.pat0;
            send->unk0 = 0x4011;
            send->unk2 = recv2;
            send->unk4 = gLoadedSaveGame->unk0;
            for (j = 0; j < 3; j++) {
                send->unk8[j] = gLoadedSaveGame->unk20[j + 3];
            }
            send->unkE = gUnknown_03005594;
            send->unkF = gUnknown_030054D8;
        }
    }
}

UNUSED static void sub_805B98C(struct MultiplayerConnectScreen* connectScreen) {
    struct UNK_0808B3FC_UNK240* unkC = &connectScreen->unkC;
    sub_80051E8(unkC);
    unkC++;
    sub_80051E8(unkC);
}

// MultiPakCommunicationError
void MultiPakCommunicationError(void) {
    m4aMPlayAllStop();
    gFlags &= ~0x4;
    gDispCnt = 0x40;
    gMultiSioEnabled = FALSE;
    MultiSioStop();
    MultiSioInit(0);
    gUnknown_03002260 = gMapHeaders;
    gUnknown_03002794 = &gUnknown_080F40D4;
    gUnknown_030054D4[0] = 0;
    gUnknown_030054D4[1] = 0;
    gUnknown_030054D4[2] = 0;
    gUnknown_030054D4[3] = 0;
    sub_805BA10(CONNECTION_ERROR);
}

struct CommunicationOutcomeScreen {
    struct Unk_03002400 unk0;
    u8 filler40[96];
    struct UNK_0808B3FC_UNK240 unkA0;
    struct UNK_0808B3FC_UNK240 unkD0;
    struct UNK_0808B3FC_UNK240 unk100;
    u8 filler130[204];
    u32 unk1FC;
    u16 unk200;
    u8 filler202;
    u8 unk203;
    u8 unk204[2];
    u8 unk206;
    u8 unk207[21];
}; /* size 0x21C */

void sub_805BC40(void);

extern const u16 gUnknown_080D9088[2];
extern const u8 gUnknown_080D908C[2];

void sub_805BA10(u8 outcome) {
    u8 i;
    u8 count;
    struct Task* t;
    struct CommunicationOutcomeScreen* outcomeScreen; 
    struct UNK_0808B3FC_UNK240* unk100;
    struct Unk_03002400* background;
    gDispCnt = 0x3140;
    gBgCntRegs[0] = 0x803;
    gBgScrollRegs[0][0] = 0x100;
    gBgScrollRegs[0][1] = 0;
    gWinRegs[0] = 0xF0;
    gWinRegs[2] = 0xA0;
    gWinRegs[4] = 0x31;
    gWinRegs[5] = 0x31;

    gBldRegs.bldCnt = 0xBF;
    gBldRegs.bldY = 0x10;

    t = TaskCreate(sub_805BC40, 0x21C, 0x2000, 0, NULL);
    outcomeScreen = TaskGetStructPtr(t, outcomeScreen);

    outcomeScreen->unk203 = outcome;
    outcomeScreen->unk200 = 0x78;
    outcomeScreen->unk1FC = 0;

    for (i = 0, count = 0; i < 4; i++) {
        if (GetBit(gUnknown_030055B8, i)) {
            count++;
        }
    }

    outcomeScreen->unk206 = count;
    
    unk100 = &outcomeScreen->unk100;
    unk100->unk16 = 0x78;
    unk100->unk18 = 0x8C;
    unk100->unk4 = (void*)OBJ_VRAM0;
    unk100->unk1A= 0x3C0;
    unk100->unk8 = 0;
    unk100->unkA = 0x432;
    unk100->unk20 = outcome + 6;
    unk100->unk14 = 0;
    unk100->unk1C = 0;
    unk100->unk21 = 0xFF;
    unk100->unk22 = 0x10;
    unk100->unk25 = 0;
    unk100->unk10 = 0x2000;
    
    unk100 = &outcomeScreen->unkD0;
    unk100->unk16 = 0x78;
    unk100->unk18 = 0x24;
    unk100->unk4 = (void*)OBJ_VRAM0 + 0x2000;
    unk100->unk1A= 0x3C0;
    unk100->unk8 = 0;
    unk100->unkA = gUnknown_080D9088[outcome];
    unk100->unk20 = gUnknown_080D908C[outcome];
    unk100->unk14 = 0;
    unk100->unk1C = 0;
    unk100->unk21 = 0xFF;
    unk100->unk22 = 0x10;
    unk100->unk25 = 0;
    unk100->unk10 = 0x2000;

    unk100 = &outcomeScreen->unkA0;
    unk100->unk16 = 0x78;
    unk100->unk18 = 0x78;
    unk100->unk4 = (void*)OBJ_VRAM0 + 0x4000;
    unk100->unk1A= 0x3C0;
    unk100->unk8 = 0;
    unk100->unkA = gUnknown_080D9088[outcome];
    unk100->unk20 = gUnknown_080D908C[outcome];
    unk100->unk14 = 0;
    unk100->unk1C = 0;
    unk100->unk21 = 0xFF;
    unk100->unk22 = 0x10;
    unk100->unk25 = 0;
    unk100->unk10 = 0x2000;

    background = &outcomeScreen->unk0;
    background->unk4 = BG_SCREEN_ADDR(0);
    background->unkA = 0;
    background->unkC = BG_SCREEN_ADDR(8);
    background->unk18 = 0;
    background->unk1A = 0;
    background->unk1E = 0;
    background->unk20 = 0;
    background->unk22 = 0;
    background->unk24 = 0;
    background->unk26 = 0x1E;
    background->unk28 = 0x14;
    background->unk2A = 0;
    background->unk2E = 0;
    background->unk1C = 0x73;
    sub_8002A3C(background);
    m4aMPlayAllStop();
    if (outcome != CONNECTION_SUCCESS) {
        m4aSongNumStart(MUS_VS_MISS);
    } else { 
        m4aSongNumStart(MUS_VS_SUCCESS);
        
    }
}

extern const struct UNK_080E0D64 gUnknown_080D9090[];

void sub_805BC40(void) {
    struct UNK_0808B3FC_UNK240* unkD0;
    struct CommunicationOutcomeScreen* outcomeScreen = TaskGetStructPtr(gCurTask, outcomeScreen);
    unkD0 = &outcomeScreen->unkA0;
    sub_8004558(unkD0);
    sub_80051E8(unkD0);

    if (outcomeScreen->unk203 == CONNECTION_SUCCESS) {
        const struct UNK_080E0D64* unk9090;
        u32 unk206 = outcomeScreen->unk206;
        u32 offset;
        unkD0 = &outcomeScreen->unkD0;
        unk9090 = gUnknown_080D9090;
        offset = gLoadedSaveGame->unk6 + 7;
        

        unkD0->unkA = unk9090[offset].unk4;
        offset = gLoadedSaveGame->unk6 + 7;
        unkD0->unk20 = unk9090[offset].unk6 + unk206 - 2;
        unkD0->unk21 = 0xFF;
        sub_8004558(unkD0);
        sub_80051E8(unkD0);
    } else {
        const struct UNK_080E0D64* unk9090;
        unkD0 = &outcomeScreen->unkD0;
        unk9090 = gUnknown_080D9090;

        unkD0->unkA = unk9090[gLoadedSaveGame->unk6].unk4;
        unkD0->unk20 = unk9090[gLoadedSaveGame->unk6].unk6;
        unkD0->unk21 = 0xFF;
        sub_8004558(unkD0);
        sub_80051E8(unkD0);
    }

    unkD0 = &outcomeScreen->unk100;
    sub_8004558(unkD0);
    sub_80051E8(unkD0);

    if (outcomeScreen->unk200 != 0) {
         outcomeScreen->unk200--;
        if (gBldRegs.bldY != 0) {
            gBldRegs.bldY--;
        }
        return;
    } 

    if (gBldRegs.bldY != 0x10) {
        gBldRegs.bldY++;
    } else {
        u8 outcome = outcomeScreen->unk203;
        TasksDestroyAll();
        gUnknown_03002AE4 = gUnknown_0300287C;
        gUnknown_03005390 = 0;
        gUnknown_03004D5C = gUnknown_03002A84;
        if (outcome == CONNECTION_SUCCESS) {
            CreateCharacterSelectionScreen(gSelectedCharacter, gUnknown_03005594 & 0x10);
        } else {
            gMultiSioEnabled = FALSE;
            MultiSioStop();
            MultiSioInit(0);
            gUnknown_03002260 = gMapHeaders;
            CreateTitleScreenAndSkipIntro();
        }
    }
}
