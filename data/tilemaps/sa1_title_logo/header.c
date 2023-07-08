#include "global.h"
#include "core.h"

// This uses transparency, which gbagfx doesn't (yet) support
const u16 Palette_sa1_title_logo[] = {
    0x8340, 0,      0x9000, 0x2000, 0x421,  0x8c20, 0x2800, 0x1c20, 0x3000, 0xb000,
    0xac20, 0x9c40, 0x8842, 0x3802, 0x3022, 0xac40, 0xb820, 0xb802, 0xb440, 0x65,
    0x3423, 0x3860, 0x2082, 0xb061, 0x1084, 0x3c60, 0x3844, 0xe1,   0x4460, 0x3046,
    0xaca0, 0x4860, 0xca6,  0xac83, 0x9ca3, 0xd060, 0x94a5, 0xbc81, 0xd460, 0xb865,
    0x14,   0xd860, 0x2c88, 0xc0c0, 0xc8a1, 0x98c6, 0x5c80, 0x15,   0xe060, 0x28e4,
    0xb8c4, 0x17,   0x80ac, 0x18,   0x60a0, 0x4900, 0xd4a2, 0x19,   0x48e3, 0xe0a1,
    0x182,  0x28ca, 0x1a,   0x1d08, 0x38e8, 0xdcc2, 0x2d26, 0x5140, 0x64e1, 0x3d25,
    0xa0cd, 0xe502, 0x941c, 0x4d25, 0xa529, 0x5980, 0xe502, 0x910e, 0x145a, 0x201,
    0xe104, 0x5da0, 0xb548, 0x4929, 0x1d4c, 0x2d6b, 0xcd48, 0x9130, 0xe1c0, 0xd185,
    0xe06,  0xe945, 0xc16b, 0x318c, 0x71c0, 0xe5e0, 0x155,  0x20bc, 0x5189, 0x1173,
    0x19eb, 0xa18f, 0x6a20, 0x6587, 0xfdc0, 0xd1a9, 0x35ad, 0x7e00, 0x6e40, 0xd9e6,
    0x8995, 0xeda7, 0xa1b1, 0xfe01, 0xe624, 0x39ce, 0x7260, 0x82a6, 0xad39, 0xe1c9,
    0xc9cd, 0xe227, 0x7e42, 0x5d6,  0x3179, 0xc1ef, 0xa5f2, 0xf1e9, 0xee64, 0x620b,
    0x7e64, 0xea48, 0x85f8, 0xda0e, 0x1616, 0x4231, 0xf2a4, 0x7e85, 0xf22b, 0xae34,
    0xee88, 0xd230, 0x3d9d, 0x7ae3, 0x639,  0x7ea6, 0x4a52, 0x666d, 0x7ec6, 0x7ec7,
    0x726d, 0x5271, 0xf2a9, 0xae56, 0xc1db, 0x4e73, 0xfec7, 0x9f0d, 0x728d, 0x7ee8,
    0xd672, 0x1e3d, 0x7ee8, 0xfee9, 0x3297, 0xee90, 0x1e98, 0xfee9, 0xd694, 0x76ae,
    0xfeea, 0x2bc,  0x7f0a, 0x267d, 0x56b5, 0xb2b8, 0x4e5d, 0x1ada, 0xf6d0, 0x82bf,
    0x2a9e, 0x5ed5, 0x7f2d, 0x32fa, 0x82df, 0xdad6, 0xaebe, 0x7b12, 0x82ff, 0xe2f7,
    0x7f4f, 0x31f,  0x5abe, 0xb2de, 0x7b33, 0x831f, 0x3f1b, 0xe317, 0xa73c, 0x133e,
    0xb6ff, 0x833f, 0xe718, 0xff52, 0x6339, 0x35f,  0x7f72, 0x7f72, 0x3b1f, 0x37f,
    0x433d, 0xff55, 0xe739, 0x535a, 0xff73, 0x3f3f, 0x837f, 0x39f,  0xa77d, 0xc33f,
    0xe71e, 0x7f95, 0xeb5a, 0x3bf,  0x435f, 0x13bf, 0xff96, 0x3df,  0x6f7b, 0x477f,
    0x83df, 0x7fb7, 0x579c, 0x3ff,  0x6f5f, 0x479f, 0x97df, 0x83ff, 0xffb8, 0x739c,
    0xcf9f, 0xffb9, 0x77bd, 0x7fda, 0x779f, 0x63df, 0xffdc, 0x7bde, 0xfbbf, 0x7ffd,
    0xfbde, 0x7ffd, 0xebff, 0x7fff, 0xfffe, 0xffff,
};

const u8 Tiles_sa1_title_logo[] = INCBIN_U8("data/tilemaps/sa1_title_logo/tiles.4bpp");
const u8 Tilemap_sa1_title_logo[]
    = INCBIN_U8("data/tilemaps/sa1_title_logo/tilemap.tilemap2");

const Tilemap sa1_title_logo = {
    .xTiles = 24,
    .yTiles = 10,
    .animTileSize = 0,
    .animFrameCount = 0,
    .animDelay = 0,
    .tiles = Tiles_sa1_title_logo,
    .tilesSize = sizeof(Tiles_sa1_title_logo),
    .palette = Palette_sa1_title_logo,
    .palOffset = 0,
    .palLength = sizeof(Palette_sa1_title_logo) / sizeof(u16),
    .map = (const u16 *)Tilemap_sa1_title_logo,
};
