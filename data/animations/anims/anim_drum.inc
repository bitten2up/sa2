

anim_drum_variant_0:
	mGetPalette 0x67, 16, 0x70
	mGetTiles 0x1ACDD, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	1, 0

	mAnimCmd4 

anim_drum_variant_1:
	mGetPalette 0x67, 16, 0x70
	mGetTiles 0x1ACDD, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	1, 0

	mGetTiles 0x1ACE9, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	2, 1

	mGetTiles 0x1ACF5, 16
	mAnimCmd6 0x0, 0x5E2FB
	.4byte	1, 2

	mGetTiles 0x1AD05, 12
	mAnimCmd6 0x0, 0x5E8FB
	.4byte	5, 3

	mGetTiles 0x1AD11, 16
	mAnimCmd6 0x0, 0x5E6FB
	.4byte	3, 4

	mAnimCmd4 

anim_drum_variant_2:
	mGetPalette 0x67, 16, 0x70
	mGetTiles 0x1ACDD, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	1, 0

	mGetTiles 0x1ACE9, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	2, 1

	mGetTiles 0x1ACF5, 16
	mAnimCmd6 0x0, 0x5E2FB
	.4byte	1, 2

	mGetTiles 0x1AD05, 12
	mAnimCmd6 0x0, 0x5E8FB
	.4byte	5, 3

	mGetTiles 0x1AD11, 16
	mAnimCmd6 0x0, 0x5E6FB
	.4byte	3, 4

	mAnimCmd4 

anim_drum_variant_3:
	mGetPalette 0x67, 16, 0x70
	mGetTiles 0x1ACDD, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	1, 0

	mGetTiles 0x1ACE9, 12
	mAnimCmd6 0x0, 0x5EBFB
	.4byte	2, 1

	mGetTiles 0x1ACF5, 16
	mAnimCmd6 0x0, 0x5E2FB
	.4byte	1, 2

	mGetTiles 0x1AD05, 12
	mAnimCmd6 0x0, 0x5E8FB
	.4byte	5, 3

	mGetTiles 0x1AD11, 16
	mAnimCmd6 0x0, 0x5E6FB
	.4byte	3, 4

	mAnimCmd4 


anim_drum:
	.4byte anim_drum_variant_0
	.4byte anim_drum_variant_1
	.4byte anim_drum_variant_2
	.4byte anim_drum_variant_3
