#ifndef GUARD_GBA_DEFINES
#define GUARD_GBA_DEFINES

#include <stddef.h>
#include <stdint.h> // for uint16_t

#define TRUE  1
#define FALSE 0

#define IWRAM_DATA __attribute__((section("iwram_data")))
#define EWRAM_DATA __attribute__((section("ewram_data")))

// TODO: Move these elsewhere?
// #ifdef __GNUC__
#define NAKED __attribute__((naked))
#define UNUSED __attribute__((unused))
//#define PACKED __attribute__((packed))
#define ALIGNED(n) __attribute__((aligned(n)))
// #endif

#define EWRAM_SIZE      0x40000
#define IWRAM_SIZE      0x7E00
#define PLTT_SIZE       0x400
#define BG_PLTT_SIZE    0x200
#define OBJ_PLTT_SIZE   0x200
#define VRAM_SIZE       0x18000
#define BG_VRAM_SIZE    0x10000
// The size of OBJ_VRAM0_SIZE depends on the "Mode" of the graphics hardware.
// The data is interpreted differently by the hardware in each mode.
#define OBJ_VRAM0_SIZE  0x8000
#define OBJ_VRAM1_SIZE  0x4000
#define OAM_ENTRY_COUNT 128
#if PORTABLE
#include "gba/types.h"
#define OAM_SIZE (OAM_ENTRY_COUNT*sizeof(OamData))
extern struct SoundInfo *SOUND_INFO_PTR;
extern uint16_t INTR_CHECK;
extern void (*INTR_VECTOR)(void);

extern uint8_t EWRAM_START[EWRAM_SIZE];
extern uint8_t IWRAM_START[IWRAM_SIZE];
extern uint16_t PLTT[PLTT_SIZE/sizeof(uint16_t)];
#define BG_PLTT (u8*)&PLTT[0]
#define OBJ_PLTT (u8*)&PLTT[BG_PLTT_SIZE/sizeof(uint16_t)]
extern uint8_t OAM[OAM_SIZE];
extern uint8_t VRAM[VRAM_SIZE];

#define BG_VRAM           &VRAM[0]
#define BG_CHAR_ADDR(n)   (((u8*)BG_VRAM) + (0x4000 * (n)))
#define BG_SCREEN_ADDR(n) (((u8*)BG_VRAM) + (0x800 * (n)))
#define BG_TILE_ADDR(n)   (((u8*)BG_VRAM) + (0x80 * (n)))

#define OBJ_VRAM0         &VRAM[0x10000]
#define OBJ_VRAM1         &VRAM[0x14000]

#define DISPLAY_WIDTH  240
#define DISPLAY_HEIGHT 160
#else
// NOTE(Jace): I tried replacing these altogether,
//             but that resulted in a nonmatching ROM
//             (see notes above)
#define SOUND_INFO_PTR (*(struct SoundInfo **)0x3007FF0)
#define INTR_CHECK     (*(u16 *)0x3007FF8)
#define INTR_VECTOR    (*(void **)0x3007FFC)

#define EWRAM_START 0x02000000
#define IWRAM_START 0x03000000

#define PLTT         0x5000000
#define BG_PLTT      PLTT
#define OBJ_PLTT      (PLTT + BG_PLTT_SIZE)

#define VRAM      0x6000000

#define BG_VRAM           VRAM
#define BG_CHAR_ADDR(n)   (BG_VRAM + (0x4000 * (n)))
#define BG_SCREEN_ADDR(n) (BG_VRAM + (0x800 * (n)))
#define BG_TILE_ADDR(n)   (BG_VRAM + (0x80 * (n)))

// text-mode BG
#define OBJ_VRAM0      (u8*)(VRAM + 0x10000)

// bitmap-mode BG
#define OBJ_VRAM1      (u8*)(VRAM + 0x14000)

#define OAM      0x7000000
#define OAM_SIZE (OAM_ENTRY_COUNT*sizeof(OamData))

#define DISPLAY_WIDTH  240
#define DISPLAY_HEIGHT 160
#endif

#define TILE_SIZE_4BPP 32
#define TILE_SIZE_8BPP 64

// NOTE/TODO: Maybe this should somewhere else?
// NOTE: This appears to not match when using pointers, but with integers it's fine.
//       uintptr_t should always be defined to be as big as a pointer, so there should be no issues.
#define GET_TILE_NUM_COMMON(vramPtr, tileSize) (((uintptr_t)(vramPtr) - (uintptr_t)OBJ_VRAM0) / (tileSize))
#define GET_TILE_NUM(vramPtr) GET_TILE_NUM_COMMON((vramPtr), TILE_SIZE_4BPP) 

#define TOTAL_OBJ_TILE_COUNT 1024

#define RGB16(r, g, b) ((r) | ((g) << 5) | ((b) << 10))

#define RGB_BLACK RGB16(0, 0, 0)
#define RGB_WHITE RGB16(31, 31, 31)
#define RGB_RED RGB16(31, 0, 0)
#define RGB_GREEN RGB16(0, 31, 0)
#define RGB_BLUE RGB16(0, 0, 31)
#define RGB_YELLOW RGB16(31, 31, 0)
#define RGB_MAGENTA RGB16(31, 0, 31)
#define RGB_CYAN RGB16(0, 31, 31)
#define RGB_WHITEALPHA (RGB_WHITE | 0x8000)

#define WIN_RANGE(a, b) (((a) << 8) | (b))

#define SYSTEM_CLOCK           (16 * 1024 * 1024)   // System Clock

#endif // GUARD_GBA_DEFINES
