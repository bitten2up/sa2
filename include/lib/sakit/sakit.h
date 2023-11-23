#ifndef GUARD_SAKIT_H
#define GUARD_SAKIT_H

#include "core.h"
#include "lib/sakit/camera.h"
#include "lib/sakit/player.h"

// Incomplete

extern u8 gDemoPlayCounter;
extern u8 gGameMode;

#define IS_SINGLE_PLAYER                                                                \
    ((gGameMode == GAME_MODE_SINGLE_PLAYER) || (gGameMode == GAME_MODE_TIME_ATTACK)     \
     || (gGameMode == GAME_MODE_BOSS_TIME_ATTACK))

#define IS_MULTI_PLAYER (!(IS_SINGLE_PLAYER))

extern s8 gCurrentLevel;
extern s8 gSelectedCharacter;

extern u8 gMultiplayerLanguage;

// Sometimes loaded as s16, but as u16 most of the time.
// If you encounter it being loaded as s16, please cast it.
extern u16 gRingCount;

typedef struct {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u16 unk6;
} UNK_30054A8; /* size: 8 */

extern UNK_30054A8 gUnknown_030054A8;
extern u32 gCourseTime;

// Collected Special Rings in current stage?
extern u8 gSpecialRingCount;

// TODO: Types not checked yet!
extern s32 gUnknown_030054E0;
extern s32 gUnknown_030054FC;

extern u16 gUnknown_03005440;
extern u16 gUnknown_030054BC;
extern u8 gRandomItemBox;
extern u8 gUnknown_030053E0;

extern u8 gUnknown_0300543C;
extern struct Task *gEntitiesManagerTask;

extern u8 gUnknown_030054E4;

extern u8 gUnknown_03005420;

#define EXTRA_STATE__CLEAR              0x0000
#define EXTRA_STATE__ACT_START          0x0001 // Turns timer off, likely other effects?
#define EXTRA_STATE__2                  0x0002
#define EXTRA_STATE__4                  0x0004
#define EXTRA_STATE__10                 0x0010
#define EXTRA_STATE__DISABLE_PAUSE_MENU 0x0020
#define EXTRA_STATE__DEMO_RUNNING       0x0040 // TODO: Check accuracy of name
#define EXTRA_STATE__GRAVITY_INVERTED   0x0080
#define EXTRA_STATE__100                0x0100 // Set during stage's "loading screen"
#define EXTRA_STATE__TURN_OFF_TIMER     0x0200
#define EXTRA_STATE__TURN_OFF_HUD       0x0400
// "Extra State" (see above #defines for states)
// TODO: Find better name. Put somewhere else?
extern u16 gUnknown_03005424;
extern u16 gUnknown_0300544C;

#define DIFFICULTY_NORMAL 0
#define DIFFICULTY_EASY   1

extern u8 gDifficultyLevel;

extern s8 gTrappedAnimalVariant;

extern u8
    gUnknown_030055B0; // TODO: Boss ID in XX-Stage? But it's used in checkpointc.c ...
extern u8 gUnknown_030054F8;

// Incremented by 1 every frame if the game is not paused.
extern u32 gStageTime;

extern u32 gUnknown_030054A0;

extern u32 gCheckpointTime; // Checkpoint timer?

extern u8 gUnknown_03005438;

extern u8 gBossRingsRespawnCount;
extern bool8 gBossRingsShallRespawn;
extern bool8 gUnknown_030055BC;

extern struct Task *gMultiplayerPlayerTasks[4];
extern s8 gMultiplayerCharacters[4];
extern s8 gUnknown_030054B4[4];
extern u8 gUnknown_030054B8;

extern u8 gMultiplayerMissingHeartbeats[4];
extern u8 gActiveCollectRingEffectCount;

extern u8 gMultiplayerUnlockedCharacters;
extern u8 gMultiplayerUnlockedLevels;
extern u32 gMultiplayerIds[MULTI_SIO_PLAYERS_MAX];
extern u16 gMultiplayerNames[MULTI_SIO_PLAYERS_MAX][MAX_PLAYER_NAME_LENGTH];

extern u32 gMultiplayerPseudoRandom;

extern s32 gLevelScore;
extern u8 gNumLives;
extern u8 gUnknown_030054B0;

typedef struct {
    s32 unk0;
    u16 unk4;
} Struct_30054C0;
extern Struct_30054C0 gUnknown_030054C0;

extern u8 gMultiplayerConnections;

// TODO: move to player_controls.c
extern struct ButtonConfig gPlayerControls;

// Only set after the player passed it, used to determine extra score
extern s32 gStageGoalX;

extern u8 gUnknown_03005428[4];
extern u8 gUnknown_030053E8[4];

// Some Multiplayer struct
struct UNK_3005510 {
    u8 unk0;
    u8 unk1; // regionX (truncated)
    u8 unk2; // regionY (truncated)
    u8 unk3; // spriteY (truncated) as per sub_800EDF8
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
}; /* 0x8 */

extern struct UNK_3005510 gUnknown_03005510[16];

extern const u32 *gUnknown_030059C8;

#endif
