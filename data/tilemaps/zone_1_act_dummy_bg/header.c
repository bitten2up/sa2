#include "global.h"
#include "core.h"

const u16 Palette_zone_1_act_dummy_bg[]
    = INCBIN_U16("data/tilemaps/zone_1_act_dummy_bg/palette.gbapal");
const u8 Tiles_zone_1_act_dummy_bg[]
    = INCBIN_U8("data/tilemaps/zone_1_act_dummy_bg/tiles.4bpp");
const u16 Tilemap_zone_1_act_dummy_bg[]
    = INCBIN_U16("data/tilemaps/zone_1_act_dummy_bg/tilemap.tilemap2");

const Tilemap zone_1_act_dummy_bg = {
    .xTiles = 32,
    .yTiles = 32,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_zone_1_act_dummy_bg,
    .tilesSize = sizeof(Tiles_zone_1_act_dummy_bg),
    .palette = Palette_zone_1_act_dummy_bg,
    .palOffset = 0,
    .palLength = sizeof(Palette_zone_1_act_dummy_bg) / sizeof(u16),
    .map = Tilemap_zone_1_act_dummy_bg,
};
