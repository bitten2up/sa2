#include "global.h"
#include "core.h"

const u16 Palette_unlocked_bosses_time_attack_de[]
    = INCBIN_U16("data/tilemaps/unlocked_bosses_time_attack_de/palette.gbapal");
const u8 Tiles_unlocked_bosses_time_attack_de[]
    = INCBIN_U8("data/tilemaps/unlocked_bosses_time_attack_de/tiles.4bpp");
const u16 Tilemap_unlocked_bosses_time_attack_de[]
    = INCBIN_U16("data/tilemaps/unlocked_bosses_time_attack_de/tilemap.tilemap2");

const Tilemap unlocked_bosses_time_attack_de = {
    .xTiles = 30,
    .yTiles = 7,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_unlocked_bosses_time_attack_de,
    .tilesSize = sizeof(Tiles_unlocked_bosses_time_attack_de),
    .palette = Palette_unlocked_bosses_time_attack_de,
    .palOffset = 0,
    .palLength = sizeof(Palette_unlocked_bosses_time_attack_de) / sizeof(u16),
    .map = Tilemap_unlocked_bosses_time_attack_de,
};
