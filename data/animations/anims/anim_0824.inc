

anim_data__0824_0:
	mGetPalette 0xD5, 16, 0xD0
	mGetTiles 0x21DFC, 10
	.4byte	1, 0

	mAnimCmd4 

anim_data__0824_1:
	mGetPalette 0xD5, 16, 0xD0
	mGetTiles 0x21E06, 21
	.4byte	1, 1

	mAnimCmd4 

anim_data__0824_2:
	mGetPalette 0xD5, 16, 0xD0
	mGetTiles 0x21E1B, 30
	.4byte	1, 2

	mAnimCmd4 

anim_data__0824_3:
	mGetPalette 0xD5, 16, 0xD0
	mGetTiles 0x21E39, 80
	.4byte	1, 3

	mAnimCmd4 


anim_0824:
	.4byte anim_data__0824_0
	.4byte anim_data__0824_1
	.4byte anim_data__0824_2
	.4byte anim_data__0824_3
