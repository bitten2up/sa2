

anim_data__1026_0:
	mGetPalette 0x2B2, 16, 0x50
	mGetTiles 0x270C9, 28
	.4byte	1, 0

	mAnimCmd4 

anim_data__1026_1:
	mGetPalette 0x2B3, 16, 0x0
	mGetTiles 0x270E5, 26
	.4byte	1, 1

	mAnimCmd4 


anim_1026:
	.4byte anim_data__1026_0
	.4byte anim_data__1026_1
