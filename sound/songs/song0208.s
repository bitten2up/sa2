	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0208_1
song0208_1:	@ 0x08C81FE8
	.byte	KEYSH	, 0
	.byte	TEMPO	, 37
	.byte	VOICE	, 8
	.byte	VOL	, v127
	.byte		N84	, Cn3, v127
	.byte	W84
	.byte	FINE

	.align 2
	.global song0208
song0208:	@ 0x08C81FF8
	.byte	1		@ trackCount
	.byte	0		@ blockCount
	.byte	20		@ priority
	.byte	128		@ reverb

	.word	voicegroup005		@ voicegroup/tone

	.word	song0208_1		@ track
