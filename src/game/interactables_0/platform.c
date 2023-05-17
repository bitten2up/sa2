#include "sprite.h"

#include "constants/zones.h"
#include "constants/animations.h"

const AnimId sPlatformLevelAnims[38] = {
    [LEVEL_INDEX(ZONE_1, ACT_1)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_1, ACT_2)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_1, ACT_BOSS)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_1, ACT_UNUSED)] = SA2_ANIM_PLATFORM_LEA_FOR,

    [LEVEL_INDEX(ZONE_2, ACT_1)] = SA2_ANIM_PLATFORM_HOT_CRA,
    [LEVEL_INDEX(ZONE_2, ACT_2)] = SA2_ANIM_PLATFORM_HOT_CRA,
    [LEVEL_INDEX(ZONE_2, ACT_BOSS)] = SA2_ANIM_PLATFORM_HOT_CRA,
    [LEVEL_INDEX(ZONE_2, ACT_UNUSED)] = SA2_ANIM_PLATFORM_HOT_CRA,

    [LEVEL_INDEX(ZONE_3, ACT_1)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,
    [LEVEL_INDEX(ZONE_3, ACT_2)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,
    [LEVEL_INDEX(ZONE_3, ACT_BOSS)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,
    [LEVEL_INDEX(ZONE_3, ACT_UNUSED)] = SA2_ANIM_PLATFORM_SQUARE_MUS_PLA,

    [LEVEL_INDEX(ZONE_4, ACT_1)] = SA2_ANIM_PLATFORM_ICE_PAR,
    [LEVEL_INDEX(ZONE_4, ACT_2)] = SA2_ANIM_PLATFORM_ICE_PAR,
    [LEVEL_INDEX(ZONE_4, ACT_BOSS)] = SA2_ANIM_PLATFORM_ICE_PAR,
    [LEVEL_INDEX(ZONE_4, ACT_UNUSED)] = SA2_ANIM_PLATFORM_ICE_PAR,

    [LEVEL_INDEX(ZONE_5, ACT_1)] = SA2_ANIM_PLATFORM_SKY_CAN_2,
    [LEVEL_INDEX(ZONE_5, ACT_2)] = SA2_ANIM_PLATFORM_SKY_CAN_2,
    [LEVEL_INDEX(ZONE_5, ACT_BOSS)] = SA2_ANIM_PLATFORM_SKY_CAN_2,
    [LEVEL_INDEX(ZONE_5, ACT_UNUSED)] = SA2_ANIM_PLATFORM_SKY_CAN_2,

    [LEVEL_INDEX(ZONE_6, ACT_1)] = SA2_ANIM_PLATFORM_TEC_BAS,
    [LEVEL_INDEX(ZONE_6, ACT_2)] = SA2_ANIM_PLATFORM_TEC_BAS,
    [LEVEL_INDEX(ZONE_6, ACT_BOSS)] = SA2_ANIM_PLATFORM_TEC_BAS,
    [LEVEL_INDEX(ZONE_6, ACT_UNUSED)] = SA2_ANIM_PLATFORM_TEC_BAS,

    [LEVEL_INDEX(ZONE_7, ACT_1)] = SA2_ANIM_PLATFORM_EGG_UTO,
    [LEVEL_INDEX(ZONE_7, ACT_2)] = SA2_ANIM_PLATFORM_EGG_UTO,
    [LEVEL_INDEX(ZONE_7, ACT_BOSS)] = SA2_ANIM_PLATFORM_EGG_UTO,
    [LEVEL_INDEX(ZONE_7, ACT_UNUSED)] = SA2_ANIM_PLATFORM_EGG_UTO,

    [LEVEL_INDEX(ZONE_FINAL, ACT_XX_FINAL_ZONE)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_FINAL, ACT_TRUE_AREA_53)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_FINAL, 2)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(ZONE_FINAL, 3)] = SA2_ANIM_PLATFORM_LEA_FOR,

    [LEVEL_INDEX(8, ACT_1)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(8, ACT_2)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(8, ACT_BOSS)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(8, ACT_UNUSED)] = SA2_ANIM_PLATFORM_LEA_FOR,

    [LEVEL_INDEX(9, ACT_1)] = SA2_ANIM_PLATFORM_LEA_FOR,
    [LEVEL_INDEX(9, ACT_2)] = SA2_ANIM_PLATFORM_LEA_FOR,
};
