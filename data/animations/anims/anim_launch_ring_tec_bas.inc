

anim_launch_ring_tec_bas_variant_0:
	mGetPalette 0x79, 16, 0xB0
	mGetTiles 0x1B872, 12
	.4byte	1, 0

	mAnimCmd4 

anim_launch_ring_tec_bas_variant_1:
	mGetPalette 0x79, 16, 0xB0
	mGetTiles 0x1B87E, 6
	.4byte	1, 1

	mAnimCmd4 

anim_launch_ring_tec_bas_variant_2:
	mGetPalette 0x7A, 16, 0xB0
	mGetTiles 0x1B884, 12
	.4byte	1, 2

	mAnimCmd4 

anim_launch_ring_tec_bas_variant_3:
	mGetPalette 0x7A, 16, 0xB0
	mGetTiles 0x1B890, 6
	.4byte	1, 3

	mAnimCmd4 

anim_launch_ring_tec_bas_variant_4:
	mGetPalette 0x7B, 16, 0xB0
	mGetTiles 0x1B896, 36
	.4byte	1, 4

	mAnimCmd4 

anim_launch_ring_tec_bas_variant_5:
	mGetPalette 0x7B, 16, 0xB0
	mGetTiles 0x1B8BA, 25
	.4byte	1, 5

	mAnimCmd4 


anim_launch_ring_tec_bas:
	.4byte anim_launch_ring_tec_bas_variant_0
	.4byte anim_launch_ring_tec_bas_variant_1
	.4byte anim_launch_ring_tec_bas_variant_2
	.4byte anim_launch_ring_tec_bas_variant_3
	.4byte anim_launch_ring_tec_bas_variant_4
	.4byte anim_launch_ring_tec_bas_variant_5
