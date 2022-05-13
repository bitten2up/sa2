#include "title_screen.h"

#include "constants/songs.h"
#include "constants/text.h"
#include "flags.h"
#include "global.h"
#include "m4a.h"
#include "task.h"
#include "sprite.h"
#include "save.h"
#include "main.h"
#include "data.h"
#include "input.h"
#include "input_recorder.h"
#include "random.h"
#include "math.h"
#include "mb_programs.h"
#include "options_screen.h"
#include "game.h"
#include "player.h"
#include "zones.h"
#include "recordings.h"
#include "trig.h"

// Might not be declared here
struct UNK_3005B80 gUnknown_03005B80;

// TODO: move this function to palette or whatever
void sub_808D874(void);

static void sub_808B768(struct TitleScreen*);
static void InitTitleScreenUI(struct TitleScreen*);
static void sub_808CBA4(struct TitleScreen*);
static void IntroHoldSegaLogo(void);
static void IntroStartTeamSonicLogoAnim(void);
static void IntroFadeInSonicTeamLogoAnim(void);
static void IntroHoldSonicTeamLogo(void);
static void sub_808D4DC(struct TitleScreen*);
static void IntroStartSkyTransition(void);
static void IntroPanSkyTransitionAnim(void);
static void sub_808BF7C(void);
static void sub_808C1AC(void);
static void sub_808D124(void);
static void IntroTitleScreenWaitForFanfare(void);
static void sub_808D76C(void);
static void sub_808D740(struct TitleScreen*);
static void PressStartScreenEndAnim(void);
static void StartTitleScreenDemo(void);
static void sub_808D790(struct UNK_0808B3FC_UNK240*, u8);
static void PlayModeMenuMain(void);
static void PressStartScreenMain(void);
static void sub_808C498(void);
static void sub_808C58C(void);
static void HandleTitleScreenExit(void);
static void sub_808D35C(void);
static void sub_808D53C(void);
static void sub_808CE00(u16, s16, u16, u16, u16);
static void sub_808CEFC(void);
static void sub_808D23C(void);
static void sub_808D7F0(void);
static void IntroStartSegaLogoAnim(void);

#define FadeInBlend(frame)  \
    BLDALPHA_BLEND(frame, 16 - (frame))

#define FadeOutBlend(frame) \
    BLDALPHA_BLEND(16 - (frame), frame)

#define MenuTextIdx(language, menuItemId) menuItemId + language * NUM_LANGUAGES

const struct UNK_080E0D64 gPressStartTiles[] = 
{ 
    [LANG_DEFAULT] = {0x2E, 0x364, 0},
    [LANG_JAPANESE] = {0x2E, 0x364, 0},
    [LANG_ENGLISH] = {0x26, 0x36A, 0},
    [LANG_GERMAN] = {0x26, 0x36B, 0},
    [LANG_FRENCH] = {0x2E, 0x36C, 0},
    [LANG_SPANISH] = {0x1E, 0x36D, 0},
    [LANG_ITALIAN] = {0x1E, 0x36E, 0}
};

static const struct UNK_080E0D64 sMenuTiles[] = {
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_SINGLE_PLAYER)] = { 0x14, 0x364, 0x5 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_MULTI_PLAYER)] = { 0x14, 0x364, 0x6 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_GAME_START)] = { 0x14, 0x364, 0x1 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_TIME_ATTACK)] = { 0x14, 0x364, 0x2 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_OPTIONS)] = { 0x10, 0x364, 0x3 },
    [MenuTextIdx(LANG_DEFAULT, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x1C, 0x364, 0x4 },

    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_SINGLE_PLAYER)] = { 0x14, 0x364, 0x5 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_MULTI_PLAYER)] = { 0x14, 0x364, 0x6 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_GAME_START)] = { 0x14, 0x364, 0x1 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_TIME_ATTACK)] = { 0x14, 0x364, 0x2 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_OPTIONS)] = { 0x10, 0x364, 0x3 },
    [MenuTextIdx(LANG_JAPANESE, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x1C, 0x364, 0x4 },

    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_SINGLE_PLAYER)] = { 0x22, 0x36A, 0x5 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_MULTI_PLAYER)] = { 0x20, 0x36A, 0x6 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_GAME_START)] = { 0x1E, 0x36A, 0x1 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_TIME_ATTACK)] = { 0x20, 0x36A, 0x2 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_OPTIONS)] = { 0x16, 0x36A, 0x3 },
    [MenuTextIdx(LANG_ENGLISH, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x2C, 0x36A, 0x4 },

    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_SINGLE_PLAYER)] = { 0x1E, 0x36B, 0x5 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_MULTI_PLAYER)] = { 0x22, 0x36B, 0x6 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_GAME_START)] = { 0x1A, 0x36B, 0x1 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_TIME_ATTACK)] = { 0x1C, 0x36B, 0x2 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_OPTIONS)] = { 0x16, 0x36B, 0x3 },
    [MenuTextIdx(LANG_GERMAN, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x2E, 0x36B, 0x4 },
    
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_SINGLE_PLAYER)] = { 0x22, 0x36C, 0x5 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_MULTI_PLAYER)] = { 0x1A, 0x36C, 0x6 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_GAME_START)] = { 0x1A, 0x36C, 0x1 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_TIME_ATTACK)] = { 0x1C, 0x36C, 0x2 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_OPTIONS)] = { 0x14, 0x36C, 0x3 },
    [MenuTextIdx(LANG_FRENCH, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x2C, 0x36C, 0x4 },

    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_SINGLE_PLAYER)] = { 0x16, 0x36D, 0x5 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_MULTI_PLAYER)] = { 0x1E, 0x36D, 0x6 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_GAME_START)] = { 0x1E, 0x36D, 0x1 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_TIME_ATTACK)] = { 0x26, 0x36D, 0x2 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_OPTIONS)] = { 0x16, 0x36D, 0x3 },
    [MenuTextIdx(LANG_SPANISH, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x26, 0x36D, 0x4 },

    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_SINGLE_PLAYER)] = { 0x26, 0x36E, 0x5 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_MULTI_PLAYER)] = { 0x26, 0x36E, 0x6 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_GAME_START)] = { 0x1A, 0x36E, 0x1 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_TIME_ATTACK)] = { 0x28, 0x36E, 0x2 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_OPTIONS)] = { 0x12, 0x36E, 0x3 },
    [MenuTextIdx(LANG_ITALIAN, MENU_ITEM_TINY_CHAO_GARDEN)] = { 0x26, 0x36E, 0x4 },

    // TODO: What's this text
    { 0x28, 0x364, 0x7 }
};

static const u8 sUnknown_080E0EF4[] = INCBIN_U8("graphics/80E0EF4.gbapal");

static const u8 sUnknown_080E1054[] = { 
    0, 3, 8, 14, 21, 
    32, 46, 66, 96, 160 
};

static const u8 sPanUpNextVelocityChangeFrame[] = { 
    60, 19, 10, 10, 255, 
};

static const u8 sUnknown_080E1063[] = { 
    1, 2, 3, 4, 5, 
    6, 8, 10, 11, 13, 
    14, 16, 16, 16, 16, 
    16, 16, 16, 16, 4, 
    4, 4, 4, 4, 4, 
    4, 4, 4, 4, 3, 
    3, 3, 3, 3, 3, 
    3, 2, 2, 2, 2, 
    2, 1, 1, 1, 1, 
    1, 0, 1, 0, 1, 
    0, 0, 1, 0, 0, 
    1, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0, 0, 0, 
    0, 0, 0,
};

static const u8 sUnknown_080E10D4[] = {
    1, 1, 0, 1, 0, 
    0, 1, 1, 0, 0
};

// I wonder if they were ever going to
// make the demos show different levels
// atm only the first is used
static const u8 sDemoZones[] = {
    ZONE_1_1, ZONE_1_BOSS, ZONE_2_1, ZONE_2_BOSS, 
    ZONE_1_1, ZONE_1_2, 3, ZONE_1_BOSS
};

static const u16 sUnknown_080E10E6[] = {
    0, 1, 2, 3,
    4, 5, 6, 6,
};

static const u16 sUnknown_080E10F6[][2] = {
    { 20, 10 },
    { 36, 26 },
    { 52, 42 },
    { 68, 58 },
    { 92, 82 },
    { 124, 114 },
    { 148, 138 },
    { 180, 170 }
};

// Don't know who these belong to yet
extern u8 sub_802D4CC(struct TitleScreen_UNK270*);
extern void sub_801A6D8(void);
extern void sub_803143C(u32, u8);
extern void sub_8087FC0(void);

extern void sub_8063A00(u16);
extern void sub_805A1CC(void);
extern void sub_8009F94(void);
extern void sub_801A770(void);
extern u32 sub_8007C10(u32);
extern void sub_8007CF0(u32);

// pallette?
extern void sub_808DB2C(void);

void CreateTitleScreen(void) {
    struct Task* t;
    struct TitleScreen* titleScreen;
    struct TitleScreen_UNK270* config270;
    struct TitleScreen_UNK27C* config27C;
    s32 i, val;
    s16 denom;

    t = TaskCreate(IntroStartSegaLogoAnim, sizeof(struct TitleScreen), 0x1000, 0, NULL);
    titleScreen = TaskGetStructPtr(t, titleScreen);

    titleScreen->unkF34 = 512;
    titleScreen->unkF36 = 0x100;
    titleScreen->wavesTopOffset = 2;

    titleScreen->menuCursorIndex = 0;
    titleScreen->startScreenTimer = 0;

    titleScreen->animFrame = 0;
    titleScreen->unkF3A = 0x20;

    titleScreen->introTransitionStep = 0;
    titleScreen->introPanUpVelocity = 1;

    // Generate the wave effects
    for (i = 0; i < DISPLAY_HEIGHT; i++) {
        denom = Div(65536, (i + 1) * 8);

        // I.E: (512 * demon) - Not sure why it uses this when it's constant
        val = (titleScreen->unkF34 * denom) >> 8;
        
        // Goes from 16384 -> 102 in an log curve \_
        titleScreen->wavesTranslationX[i] = val;
        // Goes from 4 -> 642 in steps of 4 but becomes 
        // a slightly more jagged line as i in creases
        titleScreen->wavesTranslationY[i] = Div(65536, val);
    };

    config270 = &titleScreen->unk270;
    config270->unk0 = 1;
    config270->unk4 = 0;
    config270->unk2 = 2;
    config270->unk6 = 0x100;
    config270->unk8 = 0x3FBF;
    config270->unkA = 0;

    config27C = &titleScreen->unk27C;
    config27C->unk0 = 0;
    config27C->unk2 = 0;
    config27C->unk34 = titleScreen->wavesTopOffset;
    config27C->unk1 = 0xE;
    config27C->unk4 = sUnknown_080E1054;
    config27C->unk8 = sUnknown_080E0EF4;
    config27C->unk36 = 0;

    gUnknown_03005B80.unk0 = config27C;
    gUnknown_03005B80.unk4 = titleScreen;

    sub_808B768(titleScreen);
    m4aSongNumStart(MUS_INTRO);
    gFlags |= 0x8000;

    sub_802D4CC(config270);
}

static void CreateTitleScreenWithoutIntro(struct TitleScreen* titleScreen) {
    struct TitleScreen_UNK270* config270;
    struct Unk_03002400 *config0, *config40;

    // Size of filler between unk2B4
    // and unkDF4
    titleScreen->unkF34 = 0xa00;
    
    titleScreen->unkF36 = 3;
    titleScreen->wavesTopOffset = 2;
    titleScreen->menuCursorIndex = 0;
    titleScreen->startScreenTimer = 0;
    titleScreen->animFrame = 0;
    titleScreen->unkF3A = 0x20;
    titleScreen->introTransitionStep = 0;
    titleScreen->introPanUpVelocity = 1;

    config270 = &titleScreen->unk270;
    config270->unk0 = 1;
    config270->unk4 = 0;
    config270->unk2 = 2;
    config270->unk6 = 0x200;
    config270->unk8 = 0x3fbf;
    config270->unkA = 0;

    InitTitleScreenUI(titleScreen);

    // Possibly a macro, why would this be set to 0 first
    gDispCnt = 0;
    gDispCnt |= DISPCNT_MODE_1 | DISPCNT_OBJ_1D_MAP | DISPCNT_BG1_ON | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
    
    gBgCntRegs[0] = BGCNT_PRIORITY(0) | BGCNT_CHARBASE(1) | BGCNT_SCREENBASE(31) | BGCNT_16COLOR;
    gBgCntRegs[1] = BGCNT_PRIORITY(2) | BGCNT_CHARBASE(2) | BGCNT_SCREENBASE(29) | BGCNT_AFF512x512 | BGCNT_16COLOR;
    gBgCntRegs[2] = BGCNT_PRIORITY(1) | BGCNT_CHARBASE(0) | BGCNT_SCREENBASE(26) | BGCNT_AFF256x256 | BGCNT_256COLOR;

    DmaFill32(3, 0, (void*)BG_VRAM, BG_VRAM_SIZE);
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xFF;
    gUnknown_03002280[3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xff;
    gUnknown_03002280[7] = 32;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xFF;
    gUnknown_03002280[11] = 0x20;

    gBgScrollRegs[1][0] = 8;
    gBgScrollRegs[1][1] = 512;

    config0 = &titleScreen->unk0;
    config0->unk4 = BG_SCREEN_ADDR(0);
    config0->unkA = 0;
    config0->unkC = BG_SCREEN_ADDR(26);
    config0->unk18 = 0;
    config0->unk1A = 0;
    if (gLoadedSaveGame->unk6 < 2) {
        config0->unk1C = 0x108;
    } else {
        config0->unk1C = 0x109;
    }
    config0->unk1E = 0;
    config0->unk20 = 0;
    config0->unk22 = 0;
    config0->unk24 = 0;
    config0->unk26 = 0x1a;
    config0->unk28 = 10;
    config0->unk2A = 0;
    config0->unk2E = 6;

    sub_8002A3C(config0);

    gDispCnt &= ~DISPCNT_BG0_ON;
    gDispCnt |= DISPCNT_BG1_ON | DISPCNT_BG2_ON;

    gBgCntRegs[2] &= ~BGCNT_WRAP;

    gBldRegs.bldCnt = BLDCNT_EFFECT_NONE;
    gFlags &= ~0x8000;

    config40 = &titleScreen->unk40;
    config40->unk4 = BG_SCREEN_ADDR(16);
    config40->unkA = 0;
    config40->unkC = BG_SCREEN_ADDR(29);
    config40->unk18 = 0;
    config40->unk1A = 0;
    config40->unk1C = 0x105;
    config40->unk1E = 0;
    config40->unk20 = 0;
    config40->unk22 = 0;
    config40->unk24 = 0;
    config40->unk26 = 0x20;
    config40->unk28 = 0x40;
    config40->unk2A = 0;
    config40->unk2E = 1;

    sub_8002A3C(config40);

    m4aSongNumStart(MUS_TITLE_FANFARE);

    sub_802D4CC(&titleScreen->unk270);
}

// Maybe create background sprites
static void sub_808B768(struct TitleScreen* titleScreen) {
    struct Unk_03002400 *config80, *config0;

    gDispCnt = DISPCNT_MODE_1;
    gDispCnt |= DISPCNT_OBJ_1D_MAP | DISPCNT_BG2_ON | DISPCNT_OBJ_ON;
    
    gBgCntRegs[0] = 0x1f04;
    gBgCntRegs[1] = 0x9d0a;
    gBgCntRegs[2] = 0x7a81;
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xFF;
    gUnknown_03002280[3] = 0x20;
    gUnknown_03004D80[1] = 0;
    gUnknown_03002280[4] = 0;
    gUnknown_03002280[5] = 0;
    gUnknown_03002280[6] = 0xFF;
    gUnknown_03002280[7] = 0x20;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xFF;
    gUnknown_03002280[11] = 0x20;

    DmaFill32(3, 0, (void*)BG_VRAM, BG_VRAM_SIZE);

    gBgScrollRegs[2][0] = 0;
    gBgScrollRegs[2][1] = 0;
    gBgScrollRegs[1][0] = 8;
    gBgScrollRegs[1][1] = 0x200;
    gBgScrollRegs[0][0] = 0;
    gBgScrollRegs[0][1] = 0;

    config80 = &titleScreen->unk80;

    config80->unk4 = BG_SCREEN_ADDR(8);
    config80->unkA = 0;
    config80->unkC = BG_SCREEN_ADDR(31);
    config80->unk18 = 0;
    config80->unk1A = 0;
    config80->unk1C = 0x60;
    config80->unk1E = 0;
    config80->unk20 = 0;
    config80->unk22 = 0;
    config80->unk24 = 0;
    config80->unk26 = 0x1e;
    config80->unk28 = 0x14;
    config80->unk2A = 0;
    config80->unk2E = 0;

    sub_8002A3C(config80);

    config0 = &titleScreen->unk0;

    config0->unk4 = BG_SCREEN_ADDR(0);
    config0->unkA = 0;
    config0->unkC =  BG_SCREEN_ADDR(26);
    config0->unk18 = 0;
    config0->unk1A = 0;
    config0->unk1C = 0x106;
    config0->unk1E = 0;
    config0->unk20 = 0;
    config0->unk22 = 0;
    config0->unk24 = 0;
    config0->unk26 = 0x20;
    config0->unk28 = 0x20;
    config0->unk2A = 0;
    config0->unk2E = 6;

    sub_8002A3C(config0);
}

static void InitTitleScreenUI(struct TitleScreen* titleScreen) {
    // Credit to @jiang for the match on this one too
    s8 language;
    u32 menuItemId, objAddr;
    struct UNK_0808B3FC_UNK240 *config;

    // Must be 0 - 6;
    language = gLoadedSaveGame->unk6;
    objAddr = OBJ_VRAM0;

    // TODO: make these into macros maybe?
    config = &titleScreen->unkC0;
    
    config->unk4 = objAddr;
    objAddr += (90 * TILE_SIZE_4BPP);
    
    config->unkA = 0x33e;
    config->unk20 = 1;
    config->unk21 = 0xFF;
    config->unk16 = 0;
    config->unk18 = 0x82;
    config->unk8 = 0;
    config->unk1A = 0x100;
    config->unk1C = 0;
    config->unk22 = 0x10;
    config->unk25 = 0;
    config->unk10 = 0;
    sub_8004558(config);

    config = &titleScreen->unkF0;

    config->unk4 = objAddr;
    objAddr += (gPressStartTiles[language].unk0 * TILE_SIZE_4BPP);
    
    config->unkA = gPressStartTiles[language].unk4;
    config->unk20 = gPressStartTiles[language].unk6;
    config->unk21 = 0xFF;
    config->unk16 = 0x78;
    config->unk18 = 0x6E;
    config->unk8 = 0;
    config->unk1A = 0xC0;
    config->unk1C = 0;
    config->unk22 = 0x10;
    config->unk25 = 0;
    config->unk10 = 0;
    sub_8004558(config);

    for (menuItemId = 0; menuItemId < ARRAY_COUNT(titleScreen->menuItems); menuItemId++) {
        config = &titleScreen->menuItems[menuItemId];

        config->unk4 = objAddr;
        objAddr += (sMenuTiles[MenuTextIdx(language, menuItemId)].unk0 * TILE_SIZE_4BPP);
        
        config->unkA = sMenuTiles[MenuTextIdx(language, menuItemId)].unk4;
        config->unk20 = sMenuTiles[MenuTextIdx(language, menuItemId)].unk6;
        config->unk21 = 0xFF;
        config->unk16 = 0x78;
        
        // Generate menu item y positions
        // position * lineHeight + topPadding
        if (menuItemId < SinglePlayerMenuItem(0)) {
            // PlayModeMenu positions
            config->unk18 = (PlayModeMenuIndex(menuItemId) * 0x12) + 0x60;
        } else if (gLoadedSaveGame->unk14) {
            // SinglePlayerMenu positions if we have the chao garden available
            config->unk18 = (SinglePlayerMenuIndex(menuItemId) * 0x10) + 0x60;
        } else {
            // SinglePlayerMenu positions if we don't have the chao garden
            config->unk18 = (SinglePlayerMenuIndex(menuItemId) * 0x12) + 0x64;
        }
        
        config->unk8 = 0;
        config->unk1A = 0xc0;
        config->unk1C = 0;
        config->unk22 = 0x10;
        config->unk25 = 0;
        config->unk10 = 0;
        sub_8004558(config);
    };

    config = &titleScreen->unk240;
    config->unk4 = objAddr;
    // Uses last value for this one
    config->unkA = sMenuTiles[42].unk4;
    config->unk20 = sMenuTiles[42].unk6;
    config->unk21 = 0xFF;
    config->unk16 = 0x78;
    config->unk18 = 0x50;
    config->unk8 = 0;
    config->unk1A = 0x780;
    config->unk1C = 0;
    config->unk22 = 0x10;
    config->unk25 = 0;
    config->unk10 = 0x3000;
    sub_8004558(config);
}

static void IntroFadeInSegaLogoAnim(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    sub_808CBA4(titleScreen);

    gBldRegs.bldAlpha = FadeInBlend(titleScreen->animFrame);

    if (titleScreen->animFrame >= 16) {
        titleScreen->animFrame = 0;
        gBldRegs.bldAlpha = FadeInBlend(16);
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
        gCurTask->main = IntroHoldSegaLogo;
    }

    titleScreen->animFrame++;
}

static void IntroFadeOutSegaLogoAnim(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    sub_808CBA4(titleScreen);

    gBldRegs.bldAlpha = FadeOutBlend(titleScreen->animFrame * 2);

    if (titleScreen->animFrame >= 8) {
        gDispCnt &= ~DISPCNT_BG0_ON;
        gBldRegs.bldAlpha = FadeOutBlend(16);
        titleScreen->animFrame = 0;
        gFlags &= ~0x8000;
        gCurTask->main = IntroStartTeamSonicLogoAnim;
    }

    titleScreen->animFrame++;
}

static void IntroStartTeamSonicLogoAnim(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    struct Unk_03002400* config80;
    
    sub_808CBA4(titleScreen);

    if (titleScreen->animFrame == 1) {
        // TODO: some macro for this
        config80 = &titleScreen->unk80;
        config80->unk4 = BG_SCREEN_ADDR(8);
        config80->unkA = 0;
        config80->unkC = BG_SCREEN_ADDR(31);
        config80->unk18 = 0;
        config80->unk1A = 0;
        // GFX asset
        config80->unk1C = 0x61;
        config80->unk1E = 0;
        config80->unk20 = 0;
        config80->unk22 = 0;
        config80->unk24 = 0;
        config80->unk26 = 0x1e;
        config80->unk28 = 0x14;
        config80->unk2A = 0;
        config80->unk2E = 0x10;
        sub_8002A3C(config80);
    }

    if (titleScreen->animFrame > 2) {
        titleScreen->animFrame = 0;
        gDispCnt |= DISPCNT_BG0_ON;
        gCurTask->main = IntroFadeInSonicTeamLogoAnim;
    }

    titleScreen->animFrame++;
}

static void IntroFadeInSonicTeamLogoAnim(void) {
    // Wondering if this is some inline function
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    sub_808CBA4(titleScreen);

    gBldRegs.bldAlpha = FadeInBlend(titleScreen->animFrame);

    if (titleScreen->animFrame >= 16) {
        titleScreen->animFrame = 0;
        gBldRegs.bldAlpha = FadeInBlend(16);
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;
        // Only diference is this function assignment for the next task
        gCurTask->main = IntroHoldSonicTeamLogo;
    }

    titleScreen->animFrame++;
}

static void IntroFadeOutSonicTeamLogoAnim(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    sub_808CBA4(titleScreen);

    gBldRegs.bldAlpha = FadeOutBlend(titleScreen->animFrame * 2);

    if (titleScreen->animFrame >= 8) {
        gCurTask->main = IntroStartSkyTransition;
        titleScreen->animFrame = 0;
        gDispCnt &= ~DISPCNT_BG0_ON;
        gBgScrollRegs[0][0] = 0;
        gBgScrollRegs[0][1] = 0;    
    }

    titleScreen->animFrame++;
}

static void IntroStartSkyTransition(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    struct Unk_03002400* config40;
    sub_808CBA4(titleScreen);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        sub_808D4DC(titleScreen);
        return;
    }

    // If animation frame is 59
    // Load the island sprite
    if (titleScreen->animFrame == 59) {
        config40 = &titleScreen->unk40;
        config40->unk4 = BG_SCREEN_ADDR(16);
        config40->unkA = 0;
        config40->unkC = BG_SCREEN_ADDR(29);
        config40->unk18 = 0;
        config40->unk1A = 0;
        config40->unk1C = 0x105;
        config40->unk1E = 0;
        config40->unk20 = 0;
        config40->unk22 = 0;
        config40->unk24 = 0;
        config40->unk26 = 0x20;
        config40->unk28 = 0x40;
        config40->unk2A = 0;
        config40->unk2E = 1;
        sub_8002A3C(config40);
    }
    
    // Once the animation frame is at 140
    // begin the pan, and load the bird animations
    if (titleScreen->animFrame > 140) {
        gCurTask->main = IntroPanSkyTransitionAnim;
        titleScreen->animFrame = 0;
        gDispCnt |= DISPCNT_BG1_ON;
        gBldRegs.bldAlpha = FadeOutBlend(16);
        gBldRegs.bldCnt = BLDCNT_TGT1_BG0 | BLDCNT_EFFECT_BLEND | BLDCNT_TGT2_BG1;
        sub_808CE00(0x7c, 0xffc4, 0, 0xffdf, 0);
        sub_808CE00(0xb4, 0xffe8, 3, 0x20, 0);
    }
    
    titleScreen->animFrame++;
}

static void IntroPanSkyTransitionAnim(void) {
    struct Unk_03002400* config0;
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        sub_808D4DC(titleScreen);
        return;
    }

    gBgScrollRegs[1][1] -= titleScreen->introPanUpVelocity;
    if (gBgScrollRegs[1][1] < 0xAF) {
        gBgScrollRegs[1][1] = 0xAF;
    }

    if (gBgScrollRegs[1][1] < 0x15F) {
        gDispCnt &= 0xFBFF;
        gDispCnt &= 0xBFFF;
    } else {
        titleScreen->wavesTopOffset += titleScreen->introPanUpVelocity;
        sub_808CBA4(titleScreen);
    }

    // Increase the pan up velocity once the correct
    // frame is reached
    if (titleScreen->animFrame == sPanUpNextVelocityChangeFrame[titleScreen->introTransitionStep]) {
        titleScreen->animFrame = 0;
        titleScreen->introPanUpVelocity++;
        titleScreen->introTransitionStep++;
    }

    // After 1 second, show the lens flare
    // animation
    if (titleScreen->animFrame > 60 && titleScreen->introTransitionStep > 2) {
        gBgCntRegs[2] &= ~BGCNT_WRAP;

        gUnknown_03004D80[0] = 2;
        gUnknown_03002280[0] = 0;
        gUnknown_03002280[1] = 0;
        gUnknown_03002280[2] = 0x20;
        gUnknown_03002280[3] = 0x20;

        gBldRegs.bldCnt = 0;

        config0 = &titleScreen->unk0;
        config0->unk4 = BG_SCREEN_ADDR(8);
        config0->unkA = 0;
        config0->unkC = BG_SCREEN_ADDR(31);
        config0->unk18 = 0;
        config0->unk1A = 0;
        config0->unk1C = 0x107;
        config0->unk1E = 0;
        config0->unk20 = 0;
        config0->unk22 = 0;
        config0->unk24 = 0;
        config0->unk26 = 7;
        config0->unk28 = 0x10;
        config0->unk2A = 0;
        config0->unk2E = 0x10;
        sub_8002A3C(config0);

        gBgScrollRegs[0][1] = 0x4F;
        gCurTask->main = sub_808BF7C;

        titleScreen->animFrame = 0;
        gWinRegs[1] = 0xF0;
        gWinRegs[3] = 0xA0;
        gWinRegs[4] |= 0x3F00;
        gWinRegs[5] |= 0x3F;

        gBldRegs.bldCnt = 0x3FBF;
        gBldRegs.bldY = 0;

        gDispCnt |= DISPCNT_WIN1_ON;
        REG_SIOCNT |= SIO_INTR_ENABLE;
    }
    titleScreen->animFrame++;
}

// Task
static void sub_808BF7C(void) {
    struct Unk_03002400* config0;
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        sub_808D4DC(titleScreen);
        return;
    }

    if (titleScreen->animFrame == 2) {
        sub_808D124();
    }

    // Every other frame
    if (titleScreen->animFrame & 1) {
        sub_8003EE4(0, 0x100, 0x100, 0, 0, 0, 10, &gBgAffineRegs);
        gDispCnt |= DISPCNT_BG0_ON;
    }

    // transition step is always > 2 to be here
    if (titleScreen->introTransitionStep > 2 && (u16)(titleScreen->animFrame - 20) < 119) {
        gDispCnt &= 0xFEFF;
        gDispCnt |= 0x4000;

        gWinRegs[1] = 0xF0;
        // Display height?
        gWinRegs[3] = 0xA0;
        gWinRegs[4] |= 0x3F00;
        gWinRegs[5] |= 0x3F;

        gBldRegs.bldCnt = 0x3FBF;
        
        if (titleScreen->animFrame > 0x1D) {
            gBldRegs.bldY = 0x10 - ((titleScreen->animFrame - 0x1E) >> 3);
        } else {
            gBldRegs.bldY = 0x10;
        }
        
        if (titleScreen->animFrame == 0x15) {
            gBgScrollRegs[1][1] = 0;
        }
    }

   
    if (titleScreen->animFrame > 0x8A) {
        config0 = &titleScreen->unk0;

        // Probably wrong size here (0x4000)
        DmaFill32(3, 0, (void *)VRAM, OBJ_VRAM1_SIZE);

        gUnknown_03004D80[0] = 2;
        gUnknown_03002280[0] = 0;
        gUnknown_03002280[1] = 0;
        gUnknown_03002280[2] = 0xff;
        gUnknown_03002280[3] = 0x20;
        gUnknown_03004D80[2] = 0;
        gUnknown_03002280[8] = 0;
        gUnknown_03002280[9] = 0;
        gUnknown_03002280[10] = 0xff;
        gUnknown_03002280[11] = 0x20;
        
        config0->unk4 = BG_SCREEN_ADDR(0);
        config0->unkA = 0;
        config0->unkC = BG_SCREEN_ADDR(26);
        config0->unk18 = 0;
        config0->unk1A = 0;
        
        if (gLoadedSaveGame->unk6 < 2) {
            config0->unk1C = 0x108;
        } else {
            config0->unk1C = 0x109;
        }

        config0->unk1E = 0;
        config0->unk20 = 0;
        config0->unk22 = 0;
        config0->unk24 = 0;
        config0->unk26 = 0x1A;
        config0->unk28 = 10;
        config0->unk2A = 0;
        config0->unk2E = 6;

        sub_8002A3C(config0);

        gBgCntRegs[2] &= 0xDFFF;
        gCurTask->main = sub_808C1AC;
        
        gDispCnt |= 0x400;
        gDispCnt &= 0xFEFF;

        gBldRegs.bldAlpha = 0x1000;
        gBldRegs.bldCnt = 0x244;

        titleScreen->animFrame = 0;
        gBgScrollRegs[1][1] = 0;
        
        InitTitleScreenUI(titleScreen);
    }
    titleScreen->animFrame++;
}

// Task_FadeInTitleScreen
static void sub_808C1AC(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);

    if (gPressedKeys & (A_BUTTON | START_BUTTON)) {
        sub_808D4DC(titleScreen);
        return;
    }

    gBldRegs.bldAlpha = FadeInBlend(titleScreen->animFrame >> 2);

    if (titleScreen->animFrame > 64) {
        gBldRegs.bldCnt = 0;
        titleScreen->animFrame = 0;
        gCurTask->main = IntroTitleScreenWaitForFanfare;
    }

    titleScreen->animFrame++;
    sub_808D740(titleScreen);
}

#define FRAME_TIME_SECONDS(n) ((n) * 60)

static void PressStartScreenMain(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);

    // Show the press start text for 2/3 of a second
    if (titleScreen->animFrame < 40) {
        sub_80051E8(&titleScreen->unkF0);
    }

    titleScreen->animFrame++;
    // And don't show it for the next 2/3 of a second
    if (titleScreen->animFrame > 80) {
        titleScreen->animFrame = 0;
    }
    sub_80051E8(&titleScreen->unkC0);

    if (gPressedKeys & START_BUTTON) {
        m4aSongNumStart(SE_SELECT);
        titleScreen->animFrame = 0;
        titleScreen->menuCursorIndex = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        gCurTask->main = PressStartScreenEndAnim;
    }

    sub_808D740(titleScreen);

    titleScreen->startScreenTimer++;
    if (titleScreen->startScreenTimer == FRAME_TIME_SECONDS(15)) {
        // Start the demo after 15 seconds on this screen
        gCurTask->main = StartTitleScreenDemo;
    }
}

static void PressStartScreenEndAnim(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);

    // Flash the start button
    if ((titleScreen->animFrame & 7) > 3) {
        sub_80051E8(&titleScreen->unkF0);
    }
    titleScreen->animFrame++;

    sub_80051E8(&titleScreen->unkC0);

    // Show the next menu items after 1/6 of a second (10 frames) 
    if (titleScreen->animFrame == 10) {
        sub_808D790(&titleScreen->menuItems[PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER)], 1);
        sub_808D790(&titleScreen->menuItems[PlayModeMenuIndex(MENU_ITEM_MULTI_PLAYER)], 1);
    }

    if (titleScreen->animFrame > 16) {
        titleScreen->animFrame = 0;
        titleScreen->menuCursorIndex = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        gCurTask->main = PlayModeMenuMain;
    }

    sub_808D740(titleScreen);
}

static inline void PlayModeMenuHighlightFocused(struct TitleScreen* titleScreen) {
    struct UNK_0808B3FC_UNK240* menuItem;
    u8 menuIndex;
    // Highlight the menu items from cursor position
    for (menuIndex = 0; menuIndex < 2; menuIndex++) {
        menuItem = &titleScreen->menuItems[menuIndex ^ 1];
        menuItem->unk25 = (menuIndex ^ titleScreen->menuCursorIndex);
        sub_80051E8(menuItem);
    }; 
}

static void PlayModeMenuMain(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    struct TitleScreen_UNK270* config270;
    
    sub_80051E8(&titleScreen->unkC0);
    sub_808D740(titleScreen);
    
    PlayModeMenuHighlightFocused(titleScreen);

    // Move the cursor if buttons are pressed
    if (gRepeatedKeys & (DPAD_UP | DPAD_DOWN)) {
        if (titleScreen->menuCursorIndex != PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER)) {
            titleScreen->menuCursorIndex = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        } else {
            titleScreen->menuCursorIndex = PlayModeMenuIndex(MENU_ITEM_MULTI_PLAYER);
        }

        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    }

    // Select option
    if (gPressedKeys & A_BUTTON) {
        m4aSongNumStart(SE_SELECT);

        if (titleScreen->menuCursorIndex == PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER)) {
            titleScreen->menuItems[MENU_ITEM_MULTI_PLAYER].unk16 = 0x78;
            sub_808D790(&titleScreen->menuItems[MENU_ITEM_MULTI_PLAYER], 0);
            
            titleScreen->animFrame = SinglePlayerMenuIndex(MENU_ITEM_GAME_START);

            gCurTask->main = sub_808C498;
        } else {
            config270 = &titleScreen->unk270;
            sub_808D790(&titleScreen->menuItems[MENU_ITEM_SINGLE_PLAYER], 0);
            
            config270->unk8 = 0x3FFF;
            config270->unk4 = 0;
            config270->unk6 = 0x100;
            config270->unk2 = 1;
            
            titleScreen->menuCursorIndex = SPECIAL_MENU_INDEX_MULTI_PLAYER;
            gCurTask->main = HandleTitleScreenExit;
        }
        return;
    }

    // Return to start screen
    if (gPressedKeys & B_BUTTON) {
        titleScreen->startScreenTimer = 0;
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = PressStartScreenMain;
    }
}

// Task_SinglePlayerSelectedTransition
static void sub_808C498(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    struct UNK_0808B3FC_UNK240* menuItems = titleScreen->menuItems;
    
    // Flash the previous selected single player menu item
    if ((titleScreen->animFrame & 7) > 3) {
        sub_80051E8(&menuItems[MENU_ITEM_SINGLE_PLAYER]);
    }
    titleScreen->animFrame++;

    sub_80051E8(&titleScreen->unkC0);

    // Allow back to be pressed during animation
    // to cancel
    if (gPressedKeys & B_BUTTON) {
        titleScreen->menuCursorIndex = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = PlayModeMenuMain;
    }

    if (titleScreen->animFrame == 8) {
        sub_808D790(&menuItems[MENU_ITEM_GAME_START], 1);
        sub_808D790(&menuItems[MENU_ITEM_TIME_ATTACK], 1);
        sub_808D790(&menuItems[MENU_ITEM_OPTIONS], 1);
        
        if (gLoadedSaveGame->unk14) {
            sub_808D790(&menuItems[MENU_ITEM_TINY_CHAO_GARDEN], 1);
        }
    }

    if (titleScreen->animFrame > 12) {
        titleScreen->animFrame = 0;
        titleScreen->menuCursorIndex = SinglePlayerMenuIndex(MENU_ITEM_GAME_START);
        gCurTask->main = sub_808C58C;
    }

    sub_808D740(titleScreen);

}

static inline void SinglePlayerMenuHighlightFocused(struct TitleScreen* titleScreen, u8 numMenuItems) {
    struct UNK_0808B3FC_UNK240 * menuItem;
    u8 menuIndex;

    for (menuIndex = 0; menuIndex < numMenuItems; menuIndex++) {
        menuItem = &titleScreen->menuItems[SinglePlayerMenuItem(menuIndex)];
        if (titleScreen->menuCursorIndex == menuIndex) {
            menuItem->unk25 = 1;
        } else {
            menuItem->unk25 = 0;
        }
        sub_80051E8(menuItem);
    }
};

// Task_SinglePlayerMenu
static void sub_808C58C(void) {
    struct TitleScreen* titleScreen;
    struct TitleScreen_UNK270* config270;
    u8 menuIndex;

    u8 numMenuItems = 3;
    if (gLoadedSaveGame->unk14) {
        numMenuItems = 4;
    }

    titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    SinglePlayerMenuHighlightFocused(titleScreen, numMenuItems);

    sub_808D740(titleScreen);

    // Handle input and wrap the cursor around
    if (gRepeatedKeys & DPAD_UP) {
        if (titleScreen->menuCursorIndex > 0) {
            titleScreen->menuCursorIndex--;
        } else {
            titleScreen->menuCursorIndex = numMenuItems - 1;
        }
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    } else if (gRepeatedKeys & DPAD_DOWN) {
        if (titleScreen->menuCursorIndex < (numMenuItems - 1)) {
            titleScreen->menuCursorIndex++;
        } else {
            titleScreen->menuCursorIndex = 0; 
        }
        m4aSongNumStart(SE_MENU_CURSOR_MOVE);
    }


    if (gPressedKeys & B_BUTTON) {
        titleScreen->menuCursorIndex = PlayModeMenuIndex(MENU_ITEM_SINGLE_PLAYER);
        m4aSongNumStart(SE_RETURN);
        gCurTask->main = PlayModeMenuMain;
        return;
    }

    if (gPressedKeys & A_BUTTON) {
        config270 = &titleScreen->unk270;
        config270->unk8 = 0x3FFF;
        if (titleScreen->menuCursorIndex == SinglePlayerMenuIndex(MENU_ITEM_TINY_CHAO_GARDEN)) {
           config270->unk8 = 0x3FBF;
        }
        config270->unk6 = 0x100;
        config270->unk4 = 0;
        config270->unk2 = 1;

        for (menuIndex = 0; menuIndex < numMenuItems; menuIndex++) {
            if (menuIndex != titleScreen->menuCursorIndex) {
                sub_808D790(&titleScreen->menuItems[SinglePlayerMenuItem(menuIndex)], 0);
            }
        }

        m4aSongNumStart(SE_SELECT);
        gCurTask->main = HandleTitleScreenExit;
    }
}

static void HandleTitleScreenExit(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    struct UNK_0808B3FC_UNK240* menuItem;
    u8 i;

    if (sub_802D4CC(&titleScreen->unk270) == 1) {
        gUnknown_03005424 = 0;
        gSelectedZone = ZONE_1_1;
        gSelectedCharacter = CHARACTER_SONIC;
        
        switch(titleScreen->menuCursorIndex) {
            case SinglePlayerMenuIndex(MENU_ITEM_GAME_START):
                gGameMode = GAME_MODE_SINGLE_PLAYER;
                sub_801A6D8();
                if (gLoadedSaveGame->unk13 & 0x10) {
                    sub_803143C(0, 1);
                } else {
                    sub_803143C(0, 0);   
                }
                break;
            case SinglePlayerMenuIndex(MENU_ITEM_TIME_ATTACK):
                sub_801A6D8();
                gSelectedZone = ZONE_1_1;
                gSelectedCharacter = CHARACTER_SONIC;
                gGameMode = GAME_MODE_TIME_ATTACK;
                sub_8087FC0();
                break;
            case SinglePlayerMenuIndex(MENU_ITEM_OPTIONS):
                gGameMode = GAME_MODE_SINGLE_PLAYER;
                sub_8063730(0);
                break;
            case SinglePlayerMenuIndex(MENU_ITEM_TINY_CHAO_GARDEN):
                sub_808D35C();
                break;
            case SPECIAL_MENU_INDEX_MULTI_PLAYER:
                gGameMode = GAME_MODE_MULTI_PLAYER;
                sub_801A6D8();
                if (gLoadedSaveGame->unk20[0] != 0xFFFF) {
                    sub_805A1CC();
                } else {
                    sub_8063A00(0);
                }
                break;
        }
        TaskDestroy(gCurTask);
    } else {
        sub_808D740(titleScreen);
        if (titleScreen->menuCursorIndex == SPECIAL_MENU_INDEX_MULTI_PLAYER) {
            // ?? wat, who writes for loops like this
            // is some macro for the numMenuItems so it wasn't
            // obvious
            for (i = 0; i < 1; i++) {
                menuItem = &titleScreen->menuItems[i ^ 1];
                menuItem->unk25 = i ^ 1;
                if ((++titleScreen->animFrame & 7) > 3) {
                    sub_80051E8(menuItem);
                }
            }
            sub_80051E8(&titleScreen->unkC0);
        } else {
            menuItem = &titleScreen->menuItems[SinglePlayerMenuItem(titleScreen->menuCursorIndex)];
            menuItem->unk25 = 1;
            if ((++titleScreen->animFrame & 7) > 3) {
                sub_80051E8(menuItem);
            }
        }
    }
}

static void sub_808C8EC(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    struct Unk_03002400* config0 = &titleScreen->unk0;
    struct Unk_03002400* config40;

    DmaFill32(3, 0, (void *)BG_VRAM, BG_VRAM_SIZE);
    gUnknown_03004D80[0] = 0;
    gUnknown_03002280[0] = 0;
    gUnknown_03002280[1] = 0;
    gUnknown_03002280[2] = 0xFF;
    gUnknown_03002280[3] = 32;
    gUnknown_03004D80[2] = 0;
    gUnknown_03002280[8] = 0;
    gUnknown_03002280[9] = 0;
    gUnknown_03002280[10] = 0xFF;
    gUnknown_03002280[11] = 32;

    config0->unk4 = BG_SCREEN_ADDR(0);
    config0->unkA = 0;
    config0->unkC = BG_SCREEN_ADDR(26);
    config0->unk18 = 0;
    config0->unk1A = 0;

    if (gLoadedSaveGame->unk6 < 2) {
        config0->unk1C = 0x108;
    } else {
        config0->unk1C = 0x109;
    }

    config0->unk1E = 0;
    config0->unk20 = 0;
    config0->unk22 = 0;
    config0->unk24 = 0;
    config0->unk26 = 0x1A;
    config0->unk28 = 10;
    config0->unk2A = 0;
    config0->unk2E = 6;
    sub_8002A3C(config0);

    config40 = &titleScreen->unk40;
    config40->unk4 = BG_SCREEN_ADDR(16);
    config40->unkA = 0;
    config40->unkC = BG_SCREEN_ADDR(29);
    config40->unk18 = 0;
    config40->unk1A = 0;
    config40->unk1C = 0x105;
    config40->unk1E = 0;
    config40->unk20 = 0;
    config40->unk22 = 0;
    config40->unk24 = 0;
    config40->unk26 = 0x20;
    config40->unk28 = 0x40;
    config40->unk2A = 0;
    config40->unk2E = 1;
    sub_8002A3C(config40);

    gDispCnt &= ~0x100;
    gDispCnt |= 0x600;
    gBgScrollRegs[1][0] = 8;
    gBgScrollRegs[1][1] = 0;
    gBgCntRegs[2] &= ~0x2000;
    gBldRegs.bldCnt = 0;
    gFlags &= ~0x8000;

    sub_802D4CC(&titleScreen->unk270);
    m4aSongNumStart(MUS_TITLE_FANFARE);

    sub_808D740(titleScreen);
    gCurTask->main = sub_808D53C;
    
    REG_SIOCNT |= SIO_INTR_ENABLE;
}

// Loads the title screen to the play mode menu
static void sub_808CA6C(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    PlayModeMenuHighlightFocused(titleScreen);

    sub_80051E8(&titleScreen->unkC0);
    sub_808D740(titleScreen);
    
    if (sub_802D4CC(&titleScreen->unk270) == 1) {
        m4aSongNumStart(SS_TITLE_SCREEN_ANNOUNCEMENT);
        titleScreen->animFrame = 0;
        gCurTask->main = PlayModeMenuMain;
    }
}

// Loads the title screen to the single player menu
static void sub_808CAFC(void) {
    struct TitleScreen* titleScreen;
    struct TitleScreen_UNK270* config270;

    u8 numMenuItems = 3;
    if (gLoadedSaveGame->unk14) {
        numMenuItems = 4;
    }

    titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    SinglePlayerMenuHighlightFocused(titleScreen, numMenuItems);

    sub_808D740(titleScreen);

    if (sub_802D4CC(&titleScreen->unk270) == 1) {
        m4aSongNumStart(SS_TITLE_SCREEN_ANNOUNCEMENT);
        titleScreen->animFrame = 0;
        gCurTask->main = sub_808C58C;
    }
}

// TODO: work out what this is doing
static void sub_808CBA4(struct TitleScreen* titleScreen) {
    u32 i;
    u32 *pointer;
    s32 j;

    REG_SIOCNT &= ~SIO_INTR_ENABLE;
    gDispCnt |= 0x4000;
    gWinRegs[1] = 0xF0;
    gWinRegs[3] = (titleScreen->wavesTopOffset - 2) * 0x100;
    gWinRegs[3] |= 0xA0;
    gWinRegs[4] |= 0x3F00;
    gWinRegs[5] &= 0x13;

    titleScreen->unkF3A -= 768;
    if (titleScreen->unkF3A < 0) {
        titleScreen->unkF3A = 7680;
    }

    gUnknown_03001870[gUnknown_03004D50++] = sub_808D874;
    gFlags |= 0x10;
    
    titleScreen->unk27C.unk34 = (titleScreen->wavesTopOffset - 2);
    
    gUnknown_030026E0[gUnknown_0300188C++] = sub_808DB2C;

    gFlags |= 0x8;
    gFlags |= 0x4;
    gUnknown_03002A80 = 16;
    gUnknown_03002878 = 0x4000020;

    // TODO: not sure unk3F4 is the correct type
    gUnknown_03001884 = titleScreen->unk3F4[0];
    pointer = titleScreen->unk3F4[0];
    for (i = 0, j = 0; i < DISPLAY_HEIGHT; i++) {
        s32 temp, r3;
        if (titleScreen->wavesTopOffset <= i) {
            r3 = titleScreen->wavesTranslationX[i - titleScreen->wavesTopOffset];
            *pointer++ = r3;
            *pointer++ = 0;

            // * DISPLAY_WIDTH
            temp = (titleScreen->wavesTranslationY[i - titleScreen->wavesTopOffset] * 0xF000) >> 8;
            temp = (0xF000 - (temp)) >> 1;
            temp = ((temp) * r3) >> 8;

            if (temp > 0x7FFFFFF) {
                temp = 0x7FFFFFF;
            }
            *pointer++ = -temp;
            // j * r3
            if (((j << 8) * r3) >> 8 >= 0x1F80) {
                j = 0;
                // again possibly a macro
                temp = titleScreen->unkF3A;
                *pointer++ = temp;
            } else {
                temp = (((j << 8) * r3) >> 8) + titleScreen->unkF3A;
                *pointer++ = temp;
            }
            j++;
        } else {
            *pointer++ = 0;
            *pointer++ = 0;
            *pointer++ = 0;
            // Could be a macro
            *pointer++ = (({i + 0x200;}) - titleScreen->wavesTopOffset) << 8;
        }
    }
}

UNUSED static void sub_808CD64(struct TitleScreen* titleScreen) {
    u16 last = titleScreen->unkF44[6];
    titleScreen->unkF44[6] = titleScreen->unkF44[5];
    titleScreen->unkF44[5] = titleScreen->unkF44[4];
    titleScreen->unkF44[4] = titleScreen->unkF44[3];
    titleScreen->unkF44[3] = titleScreen->unkF44[2];
    titleScreen->unkF44[2] = titleScreen->unkF44[1];
    titleScreen->unkF44[1] = last;
}

UNUSED static void sub_808CDB0(struct TitleScreen* titleScreen, s8 index) {
    // Might just be a the normal pallet
    u16* pal = (u16*)BG_PLTT + (index * 16);

    titleScreen->unkF44[0] = pal[0];
    titleScreen->unkF44[1] = pal[1];
    titleScreen->unkF44[2] = pal[2];
    titleScreen->unkF44[3] = pal[3];
    titleScreen->unkF44[4] = pal[4];
    titleScreen->unkF44[5] = pal[5];
    titleScreen->unkF44[6] = pal[6];
}

static void sub_808CE00(u16 p1, s16 p2, u16 p3, u16 p4, u16 p5) {
    struct Task* t = TaskCreate(sub_808CEFC, 0x40, 0x2000, 0, 0);
    struct UNK_808CE00* obj = TaskGetStructPtr(t, obj);

    obj->sprite.unk4 = sub_8007C10(3);
    obj->sprite.unkA = 0x33F;
    obj->sprite.unk20 = 0;
    obj->sprite.unk21 = 0xFF;
    obj->sprite.unk16 = p1;
    obj->sprite.unk18 = p2;
    obj->sprite.unk8 = 0;
    obj->sprite.unk1A = 0xC0;
    obj->sprite.unk1C = 0;
    obj->sprite.unk22 = 0x10;
    obj->sprite.unk25 = 0;
    obj->sprite.unk10 = 0;
    sub_8004558(&obj->sprite);

    obj->unk30 = gBgScrollRegs[1][0];
    obj->unk32 = gBgScrollRegs[1][1];
    obj->unk38 = p1 * 128;
    obj->unk3A = p2 * 128;
    obj->unk34 = p4;
    obj->unk36 = p5;
    obj->unk3C = 0;
    obj->unk3D = 0;
    obj->unk3E = p3;
}

static void sub_808CEFC(void) {
    struct UNK_808CE00* obj = TaskGetStructPtr(gCurTask, obj);
    struct UNK_0808B3FC_UNK240* sprite = &obj->sprite;
    u16 temp;

    switch (obj->unk3C) {
        case 0:
            obj->unk3A += 0x30;
            break;
        case 1:
            obj->unk3A -= gSineTable[obj->unk3D * 16] >> 10;
            break;
    
    }

    obj->unk38 += obj->unk34;
    obj->unk3A += obj->unk36;

    if (obj->unk38 & 0x8000) {
        temp = obj->unk38 >> 7 | 0xE000;
    } else {
        temp = (obj->unk38) >> 7;
    }
    sprite->unk16 = (temp << 0x10 >> 0x10) + obj->unk30 - gBgScrollRegs[1][0];
    
    if (obj->unk3A & 0x8000) {
        temp = obj->unk3A >> 7 | 0xE000;
    } else {
        temp = obj->unk3A >> 7;
    }
    sprite->unk18 = (temp << 0x10 >> 0x10) + obj->unk32 - gBgScrollRegs[1][1];
    
    sub_8004558(sprite);
    sub_80051E8(sprite);

    if ((u16)(sprite->unk16 + 0x40) > 0x170) {
        sub_808D76C();
    }

    if ((u16)(sprite->unk18 + 0x40) > 0x134) {
        sub_808D76C();
    }

    if (++obj->unk3D > 0xF) {
        obj->unk3C = sUnknown_080E10D4[obj->unk3E];
        obj->unk3E++;
        obj->unk3D = 0;
    }
}

static void sub_808D034(void) {
    struct UNK_808D034* obj = TaskGetStructPtr(gCurTask, obj);
    struct UNK_0808B3FC_UNK240* sprite = obj->sprite;

    sprite->unk16 -= sUnknown_080E1063[obj->unk10];
    gBldRegs.bldAlpha = FadeOutBlend(obj->unk10 * 2);

    sub_80051E8(sprite);

    if (++obj->unk10 > 8) {
        sprite->unk16 = obj->unk12;
        
        sprite->unk10 &= ~0x80;
        TaskDestroy(gCurTask);
    }
}

static void sub_808D09C(void) {
    struct UNK_808D034* obj = TaskGetStructPtr(gCurTask, obj);
    struct UNK_0808B3FC_UNK240* sprite = obj->sprite;
    s32 i;
    s16 sum = 0;

    for (i = 0; i < 7 - obj->unk10; i++) {
        sum += sUnknown_080E1063[i];
    };

    sprite->unk16 = sum + obj->unk12;

    gBldRegs.bldAlpha = FadeInBlend(obj->unk10 * 2);
    sub_80051E8(sprite);

    if (++obj->unk10 > 8) {
        sprite->unk16 = obj->unk12;
        
        sprite->unk10 &= ~0x80;
        TaskDestroy(gCurTask);
    }
}

static void sub_808D124(void) {
    struct Task* t = TaskCreate(sub_808D23C, sizeof(struct UNK_808D124), 0x2000, 0, 0);
    struct UNK_808D124* config = TaskGetStructPtr(t, config);
    struct UNK_0808B3FC_UNK240* sprite;
    struct UNK_808D124_UNK180* config180;
    u16 F6_0;
    u32 i;

    for (i = 0; i < 8; i++) {
        sprite = &config->sprites[i];
        config180 = &config->unk180[i];
        
        sprite->unk4 = sub_8007C10(0x40);

        sprite->unkA = 0x340;
        sprite->unk20 = sUnknown_080E10E6[i];
        sprite->unk21 = 0xFF;

        config->unk1E0[i] = F6_0 = sUnknown_080E10F6[i][0];
        config->unk1F0[i] = sUnknown_080E10F6[i][1];

        sprite->unk8 = 0;
        sprite->unk1A = (8 - i) * 0x40;
        sprite->unk1C = 0;
        sprite->unk22 = 0x10;
        sprite->unk25 = 0;
        sprite->unk10 = i | 0x60;

        config180->unk0 = 0;
        config180->unk4 = config180->unk2 = F6_0 * 2 + 0xB0;
        config180->unk6[0] = config->unk1E0[i];
        config180->unk6[1] = config->unk1F0[i];

        sub_8004558(sprite);
    }

    config->unk200 = gBgScrollRegs[1][0];
    config->unk202 = gBgScrollRegs[1][1];
    config->unk204 = 0;
    config->unk205 = 0;
}

static void sub_808D23C(void) {
    struct UNK_808D124* config = TaskGetStructPtr(gCurTask, config);
    struct UNK_0808B3FC_UNK240* sprite;
    struct UNK_808D124_UNK180* config180;
    u32 i;

    config->unk202 += 3;
    gBgScrollRegs[0][1] -= 3;

    gBldRegs.bldCnt = 
        BLDCNT_TGT2_BD | BLDCNT_TGT2_OBJ | BLDCNT_TGT2_BG3 | 
        BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG0 | 
        BLDCNT_EFFECT_BLEND | BLDCNT_TGT1_OBJ;
    gBldRegs.bldAlpha = BLDALPHA_BLEND(7, 31);

    if (!(config->unk205 & 1)) {
        for (i = 0; i < 8; i++) {
            sprite = &config->sprites[i];
            config180 = &config->unk180[i];

            // Potentially a macro
            config180->unk6[0] = sub_8085654(
                config->unk1E0[i], 
                -0x14, 
                config->unk205 * 16, 
                8, 
                0
            );

            config180->unk6[1] = sub_8085654(
                config->unk1F0[i] + config->unk202 - gBgScrollRegs[1][1], 
                -0x14 + config->unk202 - gBgScrollRegs[1][1], 
                config->unk205 * 16, 
                8, 
                0
            );

            sub_8004860(sprite, config180);
            sub_80051E8(sprite);
        }
    }

    if (++config->unk205 > 17) {
        sub_808D7F0();
    };
}

// LoadTinyChaoGarden
static void sub_808D35C(void) {
    u32 langVal;
    u32 unk374 = gLoadedSaveGame->unk374;

    switch (gLoadedSaveGame->unk6) {
        case 1:
            langVal = 0;
            break;
        case 3:
            langVal = 3;
            break;
        case 4:
            langVal = 2;
            break;
        case 5:
            langVal = 4;
            break;    
        case 2:
        case 6:
            langVal = 1;
            break;
        default:
            langVal = gLoadedSaveGame->unk6 & 1;
            break;
    }

    gFlags |= 0x8000;
    m4aMPlayAllStop();
    m4aSoundVSyncOff();
    LZ77UnCompWram(gMultiBootProgram_TinyChaoGarden, (void*)EWRAM_START);

    // TODO: what is going on here, doesn't work as a struct
    *(u32*)(EWRAM_START + 0x8) = unk374;
    *(u32*)(EWRAM_START + 0xC) = langVal;
    *(u32*)(EWRAM_START + 0x10) = (Random() + gFrameCount) * 0x100 + Random();
    SoftResetExram(0);
}

void CreateTitleScreenAndSkipIntro(void) {
    struct Task* t;
    REG_SIOCNT |= SIO_INTR_ENABLE;

    t = TaskCreate(sub_808D53C, sizeof(struct TitleScreen), 0x1000, 0, 0);
    CreateTitleScreenWithoutIntro(TaskGetStructPtr(t, struct TitleScreen*));
}

// CreateTitleScreenAtPlayModeMenu
void sub_808D45C(void) {
    struct Task* t;
    REG_SIOCNT |= SIO_INTR_ENABLE;

    t = TaskCreate(sub_808CA6C, sizeof(struct TitleScreen), 0x1000, 0, 0);
    CreateTitleScreenWithoutIntro(TaskGetStructPtr(t, struct TitleScreen*));
}

// CreateTitleScreenSkipToPlayModeMenu
void sub_808D49C(void) {
    struct Task* t;
    REG_SIOCNT |= SIO_INTR_ENABLE;

    t = TaskCreate(sub_808CAFC, sizeof(struct TitleScreen), 0x1000, 0, 0);
    CreateTitleScreenWithoutIntro(TaskGetStructPtr(t, struct TitleScreen*));
}

static void sub_808D4DC(struct TitleScreen* titleScreen) {
    struct TitleScreen_UNK270* config270 = &titleScreen->unk270;
    gFlags &= ~0x4;
    
    config270->unk0 = 1;
    config270->unk4 = 0;
    config270->unk2 = 2;
    config270->unk6 = 0x100;
    config270->unk8 = 0x3FBF;
    config270->unkA = 0;
    sub_802D4CC(config270);
    
    m4aMPlayAllStop();

    InitTitleScreenUI(titleScreen);
    sub_808D740(titleScreen);
    gCurTask->main = sub_808C8EC;
}

// ShowPressStartScreen
static void sub_808D53C(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    
    sub_80051E8(&titleScreen->unkC0);
    sub_808D740(titleScreen);

    if (sub_802D4CC(&titleScreen->unk270) == 1) {
        m4aSongNumStart(SS_TITLE_SCREEN_ANNOUNCEMENT);
        titleScreen->animFrame = 0;
        gCurTask->main = PressStartScreenMain;
    }
}

static void IntroStartSegaLogoAnim(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    sub_808CBA4(titleScreen);

    if (sub_802D4CC(&titleScreen->unk270) == 1) {
        gCurTask->main = IntroFadeInSegaLogoAnim;
        gBldRegs.bldAlpha = FadeInBlend(0);
        gBldRegs.bldCnt = 0x441;
        gDispCnt |= 0x100;
    }
}

static void IntroHoldSegaLogo(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    sub_808CBA4(titleScreen);
    
    if (titleScreen->animFrame > FRAME_TIME_SECONDS(2)) {
        titleScreen->animFrame = 0;
        gCurTask->main = IntroFadeOutSegaLogoAnim;
    }
    titleScreen->animFrame++;
}

static void IntroHoldSonicTeamLogo(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);
    sub_808CBA4(titleScreen);
    
    // After 120 frames
    if (titleScreen->animFrame > FRAME_TIME_SECONDS(2)) {
        gCurTask->main = IntroFadeOutSonicTeamLogoAnim;
        titleScreen->animFrame = 0;
    }
    titleScreen->animFrame++;
}

static void IntroTitleScreenWaitForFanfare(void) {
    struct TitleScreen* titleScreen = TaskGetStructPtr(gCurTask, titleScreen);

    // Wait for the fanfare to start on the intro music
    // before playing annoucement
    if (titleScreen->animFrame > FRAME_TIME_SECONDS(1)) {
        gFlags &= ~0x4;
        titleScreen->animFrame = 0;
        m4aSongNumStart(SS_TITLE_SCREEN_ANNOUNCEMENT);
        gCurTask->main = PressStartScreenMain;
    }
    titleScreen->animFrame++;

    sub_808D740(titleScreen);
}

static void StartTitleScreenDemo(void) {
    gInputRecorder.mode = RECORDER_PLAYBACK;
    
    gInputPlaybackData = gDemoRecordings[0];
    gSelectedCharacter = CHARACTER_SONIC;
    gSelectedZone = sDemoZones[0];

    gDemoPlayCounter++;
    // Don't count higher than 3
    gDemoPlayCounter &= 3;

    gGameMode = GAME_MODE_SINGLE_PLAYER;

    sub_8009F94();
    sub_801A6D8();
    sub_801A770();

    TaskDestroy(gCurTask);
}

static void sub_808D740(struct TitleScreen* _) {
    sub_8003EE4(0, 0x100, 0x100, 0, 0, 0x14, 8, &gBgAffineRegs);
}

static void sub_808D76C(void) {
    struct UNK_808CE00* obj = TaskGetStructPtr(gCurTask, obj);
    sub_8007CF0(obj->sprite.unk4);
    TaskDestroy(gCurTask);
}

static void sub_808D790(struct UNK_0808B3FC_UNK240* sprite, u8 a) {
    struct Task* t;
    struct UNK_808D034* obj;
    
    if (a == 0) {
        t = TaskCreate(sub_808D034, sizeof(struct UNK_808D034), 0x2000, 0, 0);
    } else if (a == 1) {
        t = TaskCreate(sub_808D09C, sizeof(struct UNK_808D034), 0x2000, 0, 0);
    } else {
        return;
    }
    obj = TaskGetStructPtr(t, obj);

    sprite->unk10 |= 0x80;
    obj->sprite = sprite;
    obj->unk12 = sprite->unk16;
    obj->unk10 = 0;
}

static void sub_808D7F0(void) {
    struct UNK_808D124* config = TaskGetStructPtr(gCurTask, config);
    
    u32 i;
    for (i = 0; i < 8; i++) {
        sub_8007CF0(config->sprites[i].unk4);
    }

    TaskDestroy(gCurTask);
}

// TODO: understand why this is inline
static inline void sub_808D824_CreateTitleScreenTask(TaskMain main) {
    struct Task* t = TaskCreate(main, sizeof(struct TitleScreen), 0x1000, 0, 0);
    CreateTitleScreenWithoutIntro(TaskGetStructPtr(t, struct TitleScreen*));
}

UNUSED void sub_808D824(void) {
    // Unused but required for match
    struct Task* prevTask = gCurTask;
    REG_SIOCNT |= SIO_INTR_ENABLE;
    
    sub_808D824_CreateTitleScreenTask(sub_808D53C);

    TaskDestroy(gCurTask);
}

// Might not in title_screen
void sub_808D874(void) {
    CpuFastSet(sUnknown_080E0EF4, (void*)(PLTT + 0x1C0), 1);
    REG_SIOCNT |= SIO_INTR_ENABLE;
}
