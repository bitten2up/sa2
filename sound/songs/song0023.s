	.include "MPlayDef.s"

	.section .rodata

	@********************** Track  1 **********************@

	.align 2
	.global song0023_1
song0023_1:	@ 0x08C64D50
	.byte	KEYSH	, 0
song0023_1_1:
	.byte	TEMPO	, 77
	.byte	VOICE	, 127
	.byte	VOL	, v110
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N92	, Gn2, v127
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N92	
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N92	
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N92	
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0023_1_1
	.byte	FINE

	@********************** Track  2 **********************@

	.global song0023_2
song0023_2:	@ 0x08C64D9E
	.byte	KEYSH	, 0
song0023_2_3:
	.byte	VOICE	, 126
	.byte	VOL	, v086
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W36
	.byte		N02	, Fn7, v120
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N05	
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte		N05	, As6
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N02	, Fn7
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
song0023_2_1:
	.byte		N07	, Ds6, v127
	.byte	W07
	.byte		N04	, En6
	.byte	W05
	.byte		N07	, Fn6
	.byte	W08
	.byte		N03	, Fs6
	.byte	W04
	.byte		N11	, Gn6
	.byte	W12
	.byte		N07	, Gs6
	.byte	W07
	.byte		N04	, An6
	.byte	W05
	.byte		N07	, As6
	.byte	W07
	.byte		N04	, Bn6
	.byte	W05
	.byte		N07	, Cn7
	.byte	W07
	.byte		N04	, Cs7
	.byte	W05
	.byte		N06	, Dn7
	.byte	W06
	.byte		N05	, Ds7
	.byte	W06
	.byte		N07	, En7
	.byte	W07
	.byte		N04	, Fn7
	.byte	W05
	.byte	PEND
song0023_2_2:
	.byte		N06	, Fs7, v127
	.byte	W07
	.byte		N04	, Gn7
	.byte	W05
	.byte		N07	, Gs7
	.byte	W07
	.byte		N04	, An7
	.byte	W05
	.byte		N06	, As7
	.byte	W06
	.byte		N04	, Bn7
	.byte	W06
	.byte		N06	, Cn8
	.byte	W07
	.byte		N04	, Cs8
	.byte	W05
	.byte		N07	, Dn8
	.byte	W07
	.byte		N04	, Ds8
	.byte	W05
	.byte		N07	, En8
	.byte	W07
	.byte		N04	, Fn8
	.byte	W05
	.byte		N11	, Fs8
	.byte	W12
	.byte		N06	, En7
	.byte	W06
	.byte		N05	, Fs8
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte		N06	, Fs7, v127
	.byte	W07
	.byte		N04	, Gn7
	.byte	W05
	.byte		N07	, Gs7
	.byte	W07
	.byte		N04	, An7
	.byte	W05
	.byte		N06	, As7
	.byte	W06
	.byte		N04	, Bn7
	.byte	W06
	.byte		N06	, Cn8
	.byte	W07
	.byte		N04	, Cs8
	.byte	W05
	.byte		N05	, Fn7
	.byte	W06
	.byte			Fs7
	.byte	W06
	.byte		N02	, Fn7
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N05	, Fs7
	.byte	W06
	.byte		N02	, Fn7
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N06	
	.byte	W06
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte		N06	, Fs7, v127
	.byte	W07
	.byte		N04	, Gn7
	.byte	W05
	.byte		N07	, Gs7
	.byte	W07
	.byte		N04	, An7
	.byte	W05
	.byte		N06	, As7
	.byte	W06
	.byte		N04	, Bn7
	.byte	W06
	.byte		N06	, Cn8
	.byte	W07
	.byte		N04	, Cs8
	.byte	W05
	.byte		N05	, Fn7
	.byte	W06
	.byte		N05	
	.byte	W12
	.byte			Fs7
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N02	, Fn7
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N06	, Fs7
	.byte	W06
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N05	, Fn7
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte		N05	, Fs7
	.byte	W06
	.byte			Fn7
	.byte	W06
	.byte			Fs7
	.byte	W06
	.byte		N11	, Fn7
	.byte	W12
	.byte		N05	, Fs7
	.byte	W06
	.byte		N02	, Fn7
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N02	, Fs7
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N05	, Fn7
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte		N06	, Fs7, v127
	.byte	W07
	.byte		N04	, Gn7
	.byte	W05
	.byte		N07	, Gs7
	.byte	W07
	.byte		N04	, An7
	.byte	W05
	.byte		N06	, As7
	.byte	W06
	.byte		N04	, Bn7
	.byte	W06
	.byte		N05	, Fn7
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N06	, Fs7
	.byte	W06
	.byte		N04	, Fn7
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Fs7
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N02	, Fn7
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N06	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte	PATT	
		.word	song0023_2_1
	.byte	PATT	
		.word	song0023_2_2
	.byte		N07	, Ds6, v127
	.byte	W07
	.byte		N04	, En6
	.byte	W05
	.byte		N07	, Fn6
	.byte	W08
	.byte		N03	, Fs6
	.byte	W04
	.byte		N11	, Gn6
	.byte	W12
	.byte		N07	, Gs6
	.byte	W07
	.byte		N04	, An6
	.byte	W05
	.byte		N07	, As6
	.byte	W07
	.byte		N04	, Bn6
	.byte	W05
	.byte		N05	, Fn7
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N05	
	.byte	W06
	.byte		N17	
	.byte	W06
	.byte	W12
	.byte		N05	, Fs7
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Fn7
	.byte	W06
	.byte			Fs7
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte			Fn7
	.byte	W06
	.byte			Fs7
	.byte	W06
	.byte			Fn7
	.byte	W06
	.byte			Fs7
	.byte	W06
	.byte			Fn7
	.byte	W06
	.byte		N02	, Fs7
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N02	
	.byte	W03
	.byte		N05	
	.byte	W06
	.byte		N06	
	.byte	W06
	.byte	GOTO	
		.word	song0023_2_3
	.byte	FINE

	@********************** Track  3 **********************@

	.global song0023_3
song0023_3:	@ 0x08C64FF3
	.byte	KEYSH	, 0
song0023_3_2:
	.byte	VOICE	, 125
	.byte	VOL	, v051
	.byte	PAN	, c_v-16
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0023_3_1:
	.byte		N17	, Ds3, v127
	.byte	W18
	.byte		N11	, En3
	.byte	W12
	.byte		N08	, Fn3
	.byte	W08
	.byte		N09	, Fs3
	.byte	W10
	.byte		N17	, Gn3
	.byte	W18
	.byte			Gs3
	.byte	W18
	.byte		N11	, An3
	.byte	W12
	.byte	PEND
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	PATT	
		.word	song0023_3_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0023_3_2
	.byte	FINE

	@********************** Track  4 **********************@

	.global song0023_4
song0023_4:	@ 0x08C650EC
	.byte	KEYSH	, 0
song0023_4_10:
	.byte	VOICE	, 125
	.byte	VOL	, v110
	.byte	PAN	, c_v+16
	.byte		N05	, Gs6, v092
	.byte	W05
	.byte			An6
	.byte	W06
	.byte			As6
	.byte	W07
	.byte		N06	, Bn6
	.byte	W06
	.byte		N05	, Cn7
	.byte	W06
	.byte			Cs7
	.byte	W06
	.byte		N06	, Dn7
	.byte	W06
	.byte		N05	, Ds7
	.byte	W06
	.byte			En7
	.byte	W06
	.byte		N06	, Fn7
	.byte	W06
	.byte			Fs7
	.byte	W06
	.byte		N05	, Gn7
	.byte	W06
	.byte			Gs7
	.byte	W06
	.byte			An7
	.byte	W06
	.byte			As7
	.byte	W05
	.byte		N06	, Bn7
	.byte	W07
song0023_4_1:
	.byte		N05	, Gs6, v092
	.byte	W05
	.byte			An6
	.byte	W06
	.byte			As6
	.byte	W07
	.byte		N06	, Bn6
	.byte	W06
	.byte		N05	, Cn7
	.byte	W06
	.byte			Cs7
	.byte	W06
	.byte		N06	, Dn7
	.byte	W06
	.byte		N05	, Ds7
	.byte	W06
	.byte			En7
	.byte	W06
	.byte		N06	, Fn7
	.byte	W06
	.byte			Fs7
	.byte	W06
	.byte		N05	, Gn7
	.byte	W06
	.byte			Gs7
	.byte	W06
	.byte			An7
	.byte	W06
	.byte			As7
	.byte	W05
	.byte		N06	, Bn7
	.byte	W07
	.byte	PEND
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
	.byte	PATT	
		.word	song0023_4_1
song0023_4_2:
	.byte	VOL	, v110
	.byte		N05	, Gs6, v127
	.byte	W03
	.byte	VOL	, v109
	.byte	W02
	.byte		N05	, An6
	.byte	W01
	.byte	VOL	, v107
	.byte	W03
	.byte		v105
	.byte	W02
	.byte		N05	, As6
	.byte	W01
	.byte	VOL	, v103
	.byte	W03
	.byte		v102
	.byte	W03
	.byte		v100
	.byte		N06	, Bn6
	.byte	W03
	.byte	VOL	, v098
	.byte	W03
	.byte		v097
	.byte		N05	, Cn7
	.byte	W03
	.byte	VOL	, v095
	.byte	W03
	.byte		v093
	.byte		N05	, Cs7
	.byte	W03
	.byte	VOL	, v091
	.byte	W03
	.byte		v090
	.byte		N06	, Dn7
	.byte	W03
	.byte	VOL	, v088
	.byte	W03
	.byte		v086
	.byte		N05	, Ds7
	.byte	W03
	.byte	VOL	, v084
	.byte	W03
	.byte		v083
	.byte		N05	, En7
	.byte	W03
	.byte	VOL	, v081
	.byte	W03
	.byte		v079
	.byte		N06	, Fn7
	.byte	W03
	.byte	VOL	, v077
	.byte	W03
	.byte		v076
	.byte		N06	, Fs7
	.byte	W03
	.byte	VOL	, v074
	.byte	W03
	.byte		v072
	.byte		N05	, Gn7
	.byte	W03
	.byte	VOL	, v071
	.byte	W03
	.byte		v069
	.byte		N05	, Gs7
	.byte	W03
	.byte	VOL	, v067
	.byte	W03
	.byte		v065
	.byte		N05	, An7
	.byte	W03
	.byte	VOL	, v064
	.byte	W03
	.byte		v062
	.byte		N05	, As7
	.byte	W03
	.byte	VOL	, v060
	.byte	W02
	.byte		N06	, Bn7
	.byte	W01
	.byte	VOL	, v058
	.byte	W03
	.byte		v057
	.byte	W03
	.byte	PEND
song0023_4_3:
	.byte	VOL	, v055
	.byte		N05	, Gs6, v127
	.byte	W03
	.byte	VOL	, v053
	.byte	W02
	.byte		N05	, An6
	.byte	W01
	.byte	VOL	, v051
	.byte	W03
	.byte		v050
	.byte	W02
	.byte		N05	, As6
	.byte	W01
	.byte	VOL	, v048
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v045
	.byte		N06	, Bn6
	.byte	W03
	.byte	VOL	, v043
	.byte	W03
	.byte		v041
	.byte		N05	, Cn7
	.byte	W03
	.byte	VOL	, v039
	.byte	W03
	.byte		v038
	.byte		N05	, Cs7
	.byte	W03
	.byte	VOL	, v036
	.byte	W03
	.byte		v034
	.byte		N06	, Dn7
	.byte	W03
	.byte	VOL	, v032
	.byte	W03
	.byte		v031
	.byte		N05	, Ds7
	.byte	W03
	.byte	VOL	, v029
	.byte	W03
	.byte		v027
	.byte		N05	, En7
	.byte	W03
	.byte	VOL	, v025
	.byte	W03
	.byte		v024
	.byte		N06	, Fn7
	.byte	W03
	.byte	VOL	, v022
	.byte	W03
	.byte		v020
	.byte		N06	, Fs7
	.byte	W03
	.byte	VOL	, v019
	.byte	W03
	.byte		v017
	.byte		N05	, Gn7
	.byte	W03
	.byte	VOL	, v015
	.byte	W03
	.byte		v013
	.byte		N05	, Gs7
	.byte	W03
	.byte	VOL	, v012
	.byte	W03
	.byte		v010
	.byte		N05	, An7
	.byte	W03
	.byte	VOL	, v008
	.byte	W03
	.byte		v006
	.byte		N05	, As7
	.byte	W03
	.byte	VOL	, v005
	.byte	W02
	.byte		N06	, Bn7
	.byte	W01
	.byte	VOL	, v003
	.byte	W03
	.byte		v001
	.byte	W03
	.byte	PEND
song0023_4_4:
	.byte	VOL	, v000
	.byte		N05	, As3, v127
	.byte	W03
	.byte	VOL	, v000
	.byte	W02
	.byte		N05	, Bn3
	.byte	W01
	.byte	VOL	, v002
	.byte	W03
	.byte		v004
	.byte	W02
	.byte		N06	, Cn4
	.byte	W01
	.byte	VOL	, v006
	.byte	W03
	.byte		v007
	.byte	W02
	.byte		N06	, Cs4
	.byte	W01
	.byte	VOL	, v009
	.byte	W03
	.byte		v011
	.byte	W02
	.byte		N06	, Dn4
	.byte	W01
	.byte	VOL	, v012
	.byte	W03
	.byte		v014
	.byte	W03
	.byte		v016
	.byte		N05	, Ds4
	.byte	W03
	.byte	VOL	, v019
	.byte	W02
	.byte		N06	, En4
	.byte	W01
	.byte	VOL	, v020
	.byte	W03
	.byte		v022
	.byte	W03
	.byte		v024
	.byte		N05	, Fn4
	.byte	W03
	.byte	VOL	, v025
	.byte	W03
	.byte		v027
	.byte		N05	, Fs4
	.byte	W03
	.byte	VOL	, v029
	.byte	W02
	.byte		N06	, Gn4
	.byte	W01
	.byte	VOL	, v031
	.byte	W03
	.byte		v032
	.byte	W02
	.byte		N05	, Gs4
	.byte	W01
	.byte	VOL	, v034
	.byte	W03
	.byte		v036
	.byte	W02
	.byte		N06	, An4
	.byte	W01
	.byte	VOL	, v038
	.byte	W03
	.byte		v039
	.byte	W02
	.byte		N06	, As4
	.byte	W01
	.byte	VOL	, v041
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v045
	.byte		N05	, Bn4
	.byte	W03
	.byte	VOL	, v046
	.byte	W02
	.byte		N05	, Cn5
	.byte	W01
	.byte	VOL	, v048
	.byte	W03
	.byte		v050
	.byte	W02
	.byte		N05	, Cs5
	.byte	W01
	.byte	VOL	, v051
	.byte	W03
	.byte		v052
	.byte	W01
	.byte		N01	, Dn5
	.byte	W02
	.byte	PEND
song0023_4_5:
	.byte	VOL	, v054
	.byte		N05	, As3, v127
	.byte	W03
	.byte	VOL	, v056
	.byte	W02
	.byte		N05	, Bn3
	.byte	W01
	.byte	VOL	, v058
	.byte	W03
	.byte		v059
	.byte	W02
	.byte		N06	, Cn4
	.byte	W01
	.byte	VOL	, v061
	.byte	W03
	.byte		v063
	.byte	W02
	.byte		N06	, Cs4
	.byte	W01
	.byte	VOL	, v064
	.byte	W03
	.byte		v066
	.byte	W02
	.byte		N06	, Dn4
	.byte	W01
	.byte	VOL	, v069
	.byte	W03
	.byte		v071
	.byte	W03
	.byte		v072
	.byte		N05	, Ds4
	.byte	W03
	.byte	VOL	, v074
	.byte	W02
	.byte		N06	, En4
	.byte	W01
	.byte	VOL	, v076
	.byte	W03
	.byte		v077
	.byte	W03
	.byte		v079
	.byte		N05	, Fn4
	.byte	W03
	.byte	VOL	, v081
	.byte	W03
	.byte		v083
	.byte		N05	, Fs4
	.byte	W03
	.byte	VOL	, v084
	.byte	W02
	.byte		N06	, Gn4
	.byte	W01
	.byte	VOL	, v086
	.byte	W03
	.byte		v088
	.byte	W02
	.byte		N05	, Gs4
	.byte	W01
	.byte	VOL	, v090
	.byte	W03
	.byte		v091
	.byte	W02
	.byte		N06	, An4
	.byte	W01
	.byte	VOL	, v093
	.byte	W03
	.byte		v095
	.byte	W02
	.byte		N06	, As4
	.byte	W01
	.byte	VOL	, v097
	.byte	W03
	.byte		v098
	.byte	W03
	.byte		v100
	.byte		N05	, Bn4
	.byte	W03
	.byte	VOL	, v102
	.byte	W02
	.byte		N05	, Cn5
	.byte	W01
	.byte	VOL	, v103
	.byte	W03
	.byte		v104
	.byte	W02
	.byte		N05	, Cs5
	.byte	W01
	.byte	VOL	, v106
	.byte	W03
	.byte		v108
	.byte	W01
	.byte		N01	, Dn5
	.byte	W02
	.byte	PEND
song0023_4_6:
	.byte	VOL	, v110
	.byte		N05	, As3, v127
	.byte	W03
	.byte	VOL	, v109
	.byte	W02
	.byte		N05	, Bn3
	.byte	W01
	.byte	VOL	, v107
	.byte	W03
	.byte		v105
	.byte	W02
	.byte		N06	, Cn4
	.byte	W01
	.byte	VOL	, v103
	.byte	W03
	.byte		v102
	.byte	W02
	.byte		N06	, Cs4
	.byte	W01
	.byte	VOL	, v100
	.byte	W03
	.byte		v098
	.byte	W02
	.byte		N06	, Dn4
	.byte	W01
	.byte	VOL	, v097
	.byte	W03
	.byte		v095
	.byte	W03
	.byte		v093
	.byte		N05	, Ds4
	.byte	W03
	.byte	VOL	, v091
	.byte	W02
	.byte		N06	, En4
	.byte	W01
	.byte	VOL	, v090
	.byte	W03
	.byte		v088
	.byte	W03
	.byte		v086
	.byte		N05	, Fn4
	.byte	W03
	.byte	VOL	, v084
	.byte	W03
	.byte		v083
	.byte		N05	, Fs4
	.byte	W03
	.byte	VOL	, v081
	.byte	W02
	.byte		N06	, Gn4
	.byte	W01
	.byte	VOL	, v079
	.byte	W03
	.byte		v077
	.byte	W02
	.byte		N05	, Gs4
	.byte	W01
	.byte	VOL	, v076
	.byte	W03
	.byte		v074
	.byte	W02
	.byte		N06	, An4
	.byte	W01
	.byte	VOL	, v072
	.byte	W03
	.byte		v071
	.byte	W02
	.byte		N06	, As4
	.byte	W01
	.byte	VOL	, v069
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v065
	.byte		N05	, Bn4
	.byte	W03
	.byte	VOL	, v064
	.byte	W02
	.byte		N05	, Cn5
	.byte	W01
	.byte	VOL	, v062
	.byte	W03
	.byte		v060
	.byte	W02
	.byte		N05	, Cs5
	.byte	W01
	.byte	VOL	, v058
	.byte	W03
	.byte		v057
	.byte	W01
	.byte		N01	, Dn5
	.byte	W02
	.byte	PEND
song0023_4_7:
	.byte	VOL	, v055
	.byte		N05	, As3, v127
	.byte	W03
	.byte	VOL	, v053
	.byte	W02
	.byte		N05	, Bn3
	.byte	W01
	.byte	VOL	, v051
	.byte	W03
	.byte		v050
	.byte	W02
	.byte		N06	, Cn4
	.byte	W01
	.byte	VOL	, v048
	.byte	W03
	.byte		v046
	.byte	W02
	.byte		N06	, Cs4
	.byte	W01
	.byte	VOL	, v045
	.byte	W03
	.byte		v043
	.byte	W02
	.byte		N06	, Dn4
	.byte	W01
	.byte	VOL	, v041
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v038
	.byte		N05	, Ds4
	.byte	W03
	.byte	VOL	, v036
	.byte	W02
	.byte		N06	, En4
	.byte	W01
	.byte	VOL	, v034
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v031
	.byte		N05	, Fn4
	.byte	W03
	.byte	VOL	, v029
	.byte	W03
	.byte		v027
	.byte		N05	, Fs4
	.byte	W03
	.byte	VOL	, v025
	.byte	W02
	.byte		N06	, Gn4
	.byte	W01
	.byte	VOL	, v024
	.byte	W03
	.byte		v022
	.byte	W02
	.byte		N05	, Gs4
	.byte	W01
	.byte	VOL	, v020
	.byte	W03
	.byte		v019
	.byte	W02
	.byte		N06	, An4
	.byte	W01
	.byte	VOL	, v017
	.byte	W03
	.byte		v015
	.byte	W02
	.byte		N06	, As4
	.byte	W01
	.byte	VOL	, v013
	.byte	W03
	.byte		v012
	.byte	W03
	.byte		v010
	.byte		N05	, Bn4
	.byte	W03
	.byte	VOL	, v008
	.byte	W02
	.byte		N05	, Cn5
	.byte	W01
	.byte	VOL	, v006
	.byte	W03
	.byte		v005
	.byte	W02
	.byte		N05	, Cs5
	.byte	W01
	.byte	VOL	, v003
	.byte	W03
	.byte		v001
	.byte	W01
	.byte		N01	, Dn5
	.byte	W02
	.byte	PEND
song0023_4_8:
	.byte	VOL	, v000
	.byte		N05	, Gs6, v092
	.byte	W03
	.byte	VOL	, v000
	.byte	W02
	.byte		N05	, An6
	.byte	W01
	.byte	VOL	, v002
	.byte	W03
	.byte		v004
	.byte	W02
	.byte		N05	, As6
	.byte	W01
	.byte	VOL	, v006
	.byte	W03
	.byte		v007
	.byte	W03
	.byte		v009
	.byte		N06	, Bn6
	.byte	W03
	.byte	VOL	, v011
	.byte	W03
	.byte		v012
	.byte		N05	, Cn7
	.byte	W03
	.byte	VOL	, v014
	.byte	W03
	.byte		v016
	.byte		N05	, Cs7
	.byte	W03
	.byte	VOL	, v019
	.byte	W03
	.byte		v020
	.byte		N06	, Dn7
	.byte	W03
	.byte	VOL	, v022
	.byte	W03
	.byte		v024
	.byte		N05	, Ds7
	.byte	W03
	.byte	VOL	, v025
	.byte	W03
	.byte		v027
	.byte		N05	, En7
	.byte	W03
	.byte	VOL	, v029
	.byte	W03
	.byte		v031
	.byte		N06	, Fn7
	.byte	W03
	.byte	VOL	, v032
	.byte	W03
	.byte		v034
	.byte		N06	, Fs7
	.byte	W03
	.byte	VOL	, v036
	.byte	W03
	.byte		v038
	.byte		N05	, Gn7
	.byte	W03
	.byte	VOL	, v039
	.byte	W03
	.byte		v041
	.byte		N05	, Gs7
	.byte	W03
	.byte	VOL	, v043
	.byte	W03
	.byte		v045
	.byte		N05	, An7
	.byte	W03
	.byte	VOL	, v046
	.byte	W03
	.byte		v048
	.byte		N05	, As7
	.byte	W03
	.byte	VOL	, v050
	.byte	W02
	.byte		N06	, Bn7
	.byte	W01
	.byte	VOL	, v051
	.byte	W03
	.byte		v052
	.byte	W03
	.byte	PEND
song0023_4_9:
	.byte	VOL	, v054
	.byte		N05	, Gs6, v092
	.byte	W03
	.byte	VOL	, v056
	.byte	W02
	.byte		N05	, An6
	.byte	W01
	.byte	VOL	, v058
	.byte	W03
	.byte		v059
	.byte	W02
	.byte		N05	, As6
	.byte	W01
	.byte	VOL	, v061
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v064
	.byte		N06	, Bn6
	.byte	W03
	.byte	VOL	, v066
	.byte	W03
	.byte		v069
	.byte		N05	, Cn7
	.byte	W03
	.byte	VOL	, v071
	.byte	W03
	.byte		v072
	.byte		N05	, Cs7
	.byte	W03
	.byte	VOL	, v074
	.byte	W03
	.byte		v076
	.byte		N06	, Dn7
	.byte	W03
	.byte	VOL	, v077
	.byte	W03
	.byte		v079
	.byte		N05	, Ds7
	.byte	W03
	.byte	VOL	, v081
	.byte	W03
	.byte		v083
	.byte		N05	, En7
	.byte	W03
	.byte	VOL	, v084
	.byte	W03
	.byte		v086
	.byte		N06	, Fn7
	.byte	W03
	.byte	VOL	, v088
	.byte	W03
	.byte		v090
	.byte		N06	, Fs7
	.byte	W03
	.byte	VOL	, v091
	.byte	W03
	.byte		v093
	.byte		N05	, Gn7
	.byte	W03
	.byte	VOL	, v095
	.byte	W03
	.byte		v097
	.byte		N05	, Gs7
	.byte	W03
	.byte	VOL	, v098
	.byte	W03
	.byte		v100
	.byte		N05	, An7
	.byte	W03
	.byte	VOL	, v102
	.byte	W03
	.byte		v103
	.byte		N05	, As7
	.byte	W03
	.byte	VOL	, v104
	.byte	W02
	.byte		N06	, Bn7
	.byte	W01
	.byte	VOL	, v106
	.byte	W03
	.byte		v108
	.byte	W03
	.byte	PEND
	.byte	PATT	
		.word	song0023_4_2
	.byte	PATT	
		.word	song0023_4_3
	.byte	PATT	
		.word	song0023_4_4
	.byte	PATT	
		.word	song0023_4_5
	.byte	PATT	
		.word	song0023_4_6
	.byte	PATT	
		.word	song0023_4_7
	.byte	PATT	
		.word	song0023_4_8
	.byte	PATT	
		.word	song0023_4_9
	.byte	PATT	
		.word	song0023_4_2
	.byte	PATT	
		.word	song0023_4_3
	.byte	PATT	
		.word	song0023_4_4
	.byte	PATT	
		.word	song0023_4_5
	.byte	PATT	
		.word	song0023_4_6
	.byte	PATT	
		.word	song0023_4_7
	.byte	PATT	
		.word	song0023_4_8
	.byte	PATT	
		.word	song0023_4_9
	.byte	VOL	, v110
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0023_4_10
	.byte	FINE

	@********************** Track  5 **********************@

	.global song0023_5
song0023_5:	@ 0x08C655EB
	.byte	KEYSH	, 0
song0023_5_5:
	.byte	VOICE	, 125
	.byte	VOL	, v110
	.byte	PAN	, c_v+16
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0023_5_1:
	.byte	VOL	, v000
	.byte		N05	, Ds5, v127
	.byte	W03
	.byte	VOL	, v000
	.byte	W03
	.byte		v002
	.byte		N05	, En5
	.byte	W03
	.byte	VOL	, v004
	.byte	W02
	.byte		N06	, Fn5
	.byte	W01
	.byte	VOL	, v006
	.byte	W03
	.byte		v007
	.byte	W03
	.byte		v009
	.byte		N05	, Fs5
	.byte	W03
	.byte	VOL	, v011
	.byte	W02
	.byte		N06	, Gn5
	.byte	W01
	.byte	VOL	, v012
	.byte	W03
	.byte		v014
	.byte	W03
	.byte		v016
	.byte		N05	, Gs5
	.byte	W03
	.byte	VOL	, v018
	.byte	W03
	.byte		v019
	.byte		N05	, An5
	.byte	W03
	.byte	VOL	, v021
	.byte	W03
	.byte		v023
	.byte		N06	, As5
	.byte	W03
	.byte	VOL	, v025
	.byte	W03
	.byte		v026
	.byte		N05	, Bn5
	.byte	W03
	.byte	VOL	, v028
	.byte	W03
	.byte		v030
	.byte		N05	, Cn6
	.byte	W03
	.byte	VOL	, v032
	.byte	W03
	.byte		v033
	.byte		N05	, Cs6
	.byte	W03
	.byte	VOL	, v035
	.byte	W02
	.byte		N06	, Dn6
	.byte	W01
	.byte	VOL	, v037
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v040
	.byte		N05	, Ds6
	.byte	W03
	.byte	VOL	, v042
	.byte	W03
	.byte		v044
	.byte		N05	, En6
	.byte	W03
	.byte	VOL	, v045
	.byte	W02
	.byte		N05	, Fn6
	.byte	W01
	.byte	VOL	, v047
	.byte	W03
	.byte		v049
	.byte	W02
	.byte		N05	, Fs6
	.byte	W01
	.byte	VOL	, v051
	.byte	W03
	.byte		v052
	.byte	W02
	.byte		N01	, Gn6
	.byte	W01
	.byte	PEND
song0023_5_2:
	.byte	VOL	, v054
	.byte		N05	, Ds5, v127
	.byte	W03
	.byte	VOL	, v056
	.byte	W03
	.byte		v058
	.byte		N05	, En5
	.byte	W03
	.byte	VOL	, v059
	.byte	W02
	.byte		N06	, Fn5
	.byte	W01
	.byte	VOL	, v061
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v064
	.byte		N05	, Fs5
	.byte	W03
	.byte	VOL	, v066
	.byte	W02
	.byte		N06	, Gn5
	.byte	W01
	.byte	VOL	, v068
	.byte	W03
	.byte		v070
	.byte	W03
	.byte		v071
	.byte		N05	, Gs5
	.byte	W03
	.byte	VOL	, v072
	.byte	W03
	.byte		v074
	.byte		N05	, An5
	.byte	W03
	.byte	VOL	, v076
	.byte	W03
	.byte		v077
	.byte		N06	, As5
	.byte	W03
	.byte	VOL	, v079
	.byte	W03
	.byte		v081
	.byte		N05	, Bn5
	.byte	W03
	.byte	VOL	, v083
	.byte	W03
	.byte		v084
	.byte		N05	, Cn6
	.byte	W03
	.byte	VOL	, v086
	.byte	W03
	.byte		v088
	.byte		N05	, Cs6
	.byte	W03
	.byte	VOL	, v090
	.byte	W02
	.byte		N06	, Dn6
	.byte	W01
	.byte	VOL	, v091
	.byte	W03
	.byte		v093
	.byte	W03
	.byte		v095
	.byte		N05	, Ds6
	.byte	W03
	.byte	VOL	, v097
	.byte	W03
	.byte		v098
	.byte		N05	, En6
	.byte	W03
	.byte	VOL	, v100
	.byte	W02
	.byte		N05	, Fn6
	.byte	W01
	.byte	VOL	, v102
	.byte	W03
	.byte		v103
	.byte	W02
	.byte		N05	, Fs6
	.byte	W01
	.byte	VOL	, v105
	.byte	W03
	.byte		v107
	.byte	W02
	.byte		N01	, Gn6
	.byte	W01
	.byte	PEND
song0023_5_3:
	.byte	VOL	, v110
	.byte		N05	, Ds5, v127
	.byte	W03
	.byte	VOL	, v109
	.byte	W03
	.byte		v107
	.byte		N05	, En5
	.byte	W03
	.byte	VOL	, v105
	.byte	W02
	.byte		N06	, Fn5
	.byte	W01
	.byte	VOL	, v103
	.byte	W03
	.byte		v102
	.byte	W03
	.byte		v100
	.byte		N05	, Fs5
	.byte	W03
	.byte	VOL	, v098
	.byte	W02
	.byte		N06	, Gn5
	.byte	W01
	.byte	VOL	, v097
	.byte	W03
	.byte		v095
	.byte	W03
	.byte		v093
	.byte		N05	, Gs5
	.byte	W03
	.byte	VOL	, v091
	.byte	W03
	.byte		v090
	.byte		N05	, An5
	.byte	W03
	.byte	VOL	, v088
	.byte	W03
	.byte		v086
	.byte		N06	, As5
	.byte	W03
	.byte	VOL	, v084
	.byte	W03
	.byte		v083
	.byte		N05	, Bn5
	.byte	W03
	.byte	VOL	, v081
	.byte	W03
	.byte		v079
	.byte		N05	, Cn6
	.byte	W03
	.byte	VOL	, v077
	.byte	W03
	.byte		v076
	.byte		N05	, Cs6
	.byte	W03
	.byte	VOL	, v074
	.byte	W02
	.byte		N06	, Dn6
	.byte	W01
	.byte	VOL	, v072
	.byte	W03
	.byte		v071
	.byte	W03
	.byte		v069
	.byte		N05	, Ds6
	.byte	W03
	.byte	VOL	, v067
	.byte	W03
	.byte		v065
	.byte		N05	, En6
	.byte	W03
	.byte	VOL	, v063
	.byte	W02
	.byte		N05	, Fn6
	.byte	W01
	.byte	VOL	, v061
	.byte	W03
	.byte		v059
	.byte	W02
	.byte		N05	, Fs6
	.byte	W01
	.byte	VOL	, v058
	.byte	W03
	.byte		v057
	.byte	W02
	.byte		N01	, Gn6
	.byte	W01
	.byte	PEND
song0023_5_4:
	.byte	VOL	, v055
	.byte		N05	, Ds5, v127
	.byte	W03
	.byte	VOL	, v053
	.byte	W03
	.byte		v051
	.byte		N05	, En5
	.byte	W03
	.byte	VOL	, v050
	.byte	W02
	.byte		N06	, Fn5
	.byte	W01
	.byte	VOL	, v048
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v045
	.byte		N05	, Fs5
	.byte	W03
	.byte	VOL	, v043
	.byte	W02
	.byte		N06	, Gn5
	.byte	W01
	.byte	VOL	, v041
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v038
	.byte		N05	, Gs5
	.byte	W03
	.byte	VOL	, v036
	.byte	W03
	.byte		v034
	.byte		N05	, An5
	.byte	W03
	.byte	VOL	, v032
	.byte	W03
	.byte		v031
	.byte		N06	, As5
	.byte	W03
	.byte	VOL	, v029
	.byte	W03
	.byte		v027
	.byte		N05	, Bn5
	.byte	W03
	.byte	VOL	, v025
	.byte	W03
	.byte		v024
	.byte		N05	, Cn6
	.byte	W03
	.byte	VOL	, v022
	.byte	W03
	.byte		v020
	.byte		N05	, Cs6
	.byte	W03
	.byte	VOL	, v019
	.byte	W02
	.byte		N06	, Dn6
	.byte	W01
	.byte	VOL	, v017
	.byte	W03
	.byte		v015
	.byte	W03
	.byte		v012
	.byte		N05	, Ds6
	.byte	W03
	.byte	VOL	, v011
	.byte	W03
	.byte		v009
	.byte		N05	, En6
	.byte	W03
	.byte	VOL	, v007
	.byte	W02
	.byte		N05	, Fn6
	.byte	W01
	.byte	VOL	, v006
	.byte	W03
	.byte		v005
	.byte	W02
	.byte		N05	, Fs6
	.byte	W01
	.byte	VOL	, v003
	.byte	W03
	.byte		v001
	.byte	W02
	.byte		N01	, Gn6
	.byte	W01
	.byte	PEND
	.byte	PATT	
		.word	song0023_5_1
	.byte	PATT	
		.word	song0023_5_2
	.byte	PATT	
		.word	song0023_5_3
	.byte	PATT	
		.word	song0023_5_4
	.byte	VOL	, v000
	.byte	W03
	.byte		v000
	.byte	W03
	.byte		v002
	.byte	W03
	.byte		v004
	.byte	W03
	.byte		v006
	.byte	W03
	.byte		v007
	.byte	W03
	.byte		v009
	.byte	W03
	.byte		v011
	.byte	W03
	.byte		v012
	.byte	W03
	.byte		v014
	.byte	W03
	.byte		v016
	.byte	W03
	.byte		v018
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		v021
	.byte	W03
	.byte		v023
	.byte	W03
	.byte		v025
	.byte	W03
	.byte		v026
	.byte		N05	, Bn5, v127
	.byte	W03
	.byte	VOL	, v028
	.byte	W03
	.byte		v030
	.byte		N05	, Cn6
	.byte	W03
	.byte	VOL	, v032
	.byte	W03
	.byte		v033
	.byte		N05	, Cs6
	.byte	W03
	.byte	VOL	, v035
	.byte	W02
	.byte		N06	, Dn6
	.byte	W01
	.byte	VOL	, v037
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v040
	.byte		N05	, Ds6
	.byte	W03
	.byte	VOL	, v042
	.byte	W03
	.byte		v044
	.byte		N05	, En6
	.byte	W03
	.byte	VOL	, v045
	.byte	W02
	.byte		N05	, Fn6
	.byte	W01
	.byte	VOL	, v047
	.byte	W03
	.byte		v049
	.byte	W02
	.byte		N05	, Fs6
	.byte	W01
	.byte	VOL	, v051
	.byte	W03
	.byte		v052
	.byte	W02
	.byte		N01	, Gn6
	.byte	W01
	.byte	PATT	
		.word	song0023_5_2
	.byte	PATT	
		.word	song0023_5_3
	.byte	PATT	
		.word	song0023_5_4
	.byte	PATT	
		.word	song0023_5_1
	.byte	PATT	
		.word	song0023_5_2
	.byte	PATT	
		.word	song0023_5_3
	.byte	PATT	
		.word	song0023_5_4
	.byte	PATT	
		.word	song0023_5_1
	.byte	PATT	
		.word	song0023_5_2
	.byte	PATT	
		.word	song0023_5_3
	.byte	PATT	
		.word	song0023_5_4
	.byte	PATT	
		.word	song0023_5_1
	.byte	PATT	
		.word	song0023_5_2
	.byte	PATT	
		.word	song0023_5_3
	.byte	PATT	
		.word	song0023_5_4
	.byte	VOL	, v000
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0023_5_5
	.byte	FINE

	@********************** Track  6 **********************@

	.global song0023_6
song0023_6:	@ 0x08C658C8
	.byte	KEYSH	, 0
song0023_6_6:
	.byte	VOICE	, 2
	.byte	VOL	, v110
	.byte	BENDR	, 8
	.byte	W96
song0023_6_1:
	.byte	VOL	, v110
	.byte		N03	, Ds5, v028
	.byte	W03
	.byte	VOL	, v108
	.byte	W03
	.byte		v106
	.byte		N09	
	.byte	W03
	.byte	VOL	, v103
	.byte	W03
	.byte		v102
	.byte	W03
	.byte		v099
	.byte	W03
	.byte		v097
	.byte		N03	
	.byte	W03
	.byte	VOL	, v095
	.byte	W03
	.byte		v093
	.byte		N09	
	.byte	W03
	.byte	VOL	, v090
	.byte	W03
	.byte		v089
	.byte	W03
	.byte		v086
	.byte	W03
	.byte		v084
	.byte		N03	
	.byte	W03
	.byte	VOL	, v083
	.byte	W03
	.byte		v080
	.byte		N09	
	.byte	W03
	.byte	VOL	, v078
	.byte	W03
	.byte		v076
	.byte	W03
	.byte		v074
	.byte	W03
	.byte		v071
	.byte		N03	
	.byte	W03
	.byte	VOL	, v071
	.byte	W03
	.byte		v069
	.byte		N09	
	.byte	W03
	.byte	VOL	, v067
	.byte	W03
	.byte		v064
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v061
	.byte		N03	
	.byte	W03
	.byte	VOL	, v059
	.byte	W03
	.byte		v058
	.byte		N09	
	.byte	W03
	.byte	VOL	, v056
	.byte	W03
	.byte		v054
	.byte	W03
	.byte		v051
	.byte	W03
	.byte		v050
	.byte		N03	
	.byte	W03
	.byte	VOL	, v048
	.byte	W03
	.byte	PEND
song0023_6_2:
	.byte	VOL	, v046
	.byte		N09	, Ds5, v028
	.byte	W03
	.byte	VOL	, v045
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v038
	.byte		N03	
	.byte	W03
	.byte	VOL	, v037
	.byte	W03
	.byte		v035
	.byte		N09	
	.byte	W03
	.byte	VOL	, v033
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v030
	.byte	W03
	.byte		v028
	.byte		N03	
	.byte	W03
	.byte	VOL	, v025
	.byte	W03
	.byte		v024
	.byte		N09	
	.byte	W03
	.byte	VOL	, v022
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		v017
	.byte		N03	
	.byte	W03
	.byte	VOL	, v015
	.byte	W03
	.byte		v012
	.byte		N09	
	.byte	W03
	.byte	VOL	, v011
	.byte	W03
	.byte		v009
	.byte	W03
	.byte		v007
	.byte	W03
	.byte		v006
	.byte		N03	
	.byte	W03
	.byte	VOL	, v004
	.byte	W03
	.byte		v002
	.byte		N09	
	.byte	W03
	.byte	VOL	, v000
	.byte	W21
	.byte	PEND
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		v034
	.byte	W96
	.byte	BEND	, c_v-3
	.byte		N15	, En5, v012
	.byte	W16
	.byte			Cn5, v016
	.byte	W16
	.byte			An4, v024
	.byte	W16
	.byte		N11	, En5, v036
	.byte	W08
	.byte	BEND	, c_v-2
	.byte	W04
	.byte		N11	, Cn5, v040
	.byte	W12
	.byte		N07	, An4, v048
	.byte	W08
	.byte			En5, v052
	.byte	W08
	.byte			Cn5, v060
	.byte	W08
	.byte		N05	, En5, v064
	.byte	W06
	.byte			Cn5, v068
	.byte	W06
	.byte			An4, v072
	.byte	W05
	.byte	BEND	, c_v-1
	.byte	W01
	.byte		N05	, En5, v076
	.byte	W06
	.byte		N03	, Cn5, v080
	.byte	W04
	.byte			An4
	.byte	W04
	.byte			En5, v076
	.byte	W04
	.byte			Cn5
	.byte	W04
	.byte			An4, v072
	.byte	W04
	.byte			En5, v068
	.byte	W04
	.byte		N02	, Cn5
	.byte	W03
	.byte			An4, v064
	.byte	W03
	.byte			En5
	.byte	W03
	.byte			Cn5, v060
	.byte	W03
	.byte		N01	, An4
	.byte	W02
	.byte			En5, v056
	.byte	W02
	.byte			Cn5
	.byte	W02
	.byte			An4
	.byte	W02
	.byte			En5
	.byte	W01
	.byte			Cn5, v052
	.byte	W02
	.byte			An4
	.byte	W01
	.byte			En5
	.byte	W01
	.byte			Cn5
	.byte	W01
	.byte	BEND	, c_v
	.byte		N01	, An4
	.byte	W01
	.byte			En5, v048
	.byte	W01
	.byte			Cn5
	.byte	W01
	.byte			An4
	.byte	W01
	.byte			En5
	.byte	W01
	.byte			Cn5
	.byte	W01
	.byte			An4
	.byte	W01
	.byte	BEND	, c_v+1
	.byte		N01	, En5, v044
	.byte	W01
	.byte			Cn5
	.byte	W01
	.byte			An4
	.byte	W01
	.byte			En5
	.byte	W01
	.byte	BEND	, c_v+2
	.byte		N01	, Cn5
	.byte	W01
	.byte			An4
	.byte	W01
	.byte			En5
	.byte	W01
	.byte			Cn5, v040
	.byte	W01
	.byte	BEND	, c_v+3
	.byte		N01	, An4
	.byte	W01
	.byte			En5
	.byte	W01
	.byte			Cn5
	.byte	W01
	.byte			An4
	.byte	W01
	.byte	BEND	, c_v+4
	.byte		N01	, En5
	.byte	W01
	.byte			Cn5, v036
	.byte	W01
	.byte			An4
	.byte	W01
	.byte	BEND	, c_v+5
	.byte		N01	, En5
	.byte	W01
	.byte			Cn5
	.byte	W01
	.byte			An4
	.byte	W01
	.byte			En5
	.byte	W01
	.byte	BEND	, c_v+6
	.byte		N01	, Cn5
	.byte	W01
	.byte			An4, v032
	.byte	W01
	.byte			En5
	.byte	W01
	.byte			Cn5
	.byte	W01
	.byte	BEND	, c_v+7
	.byte		N01	, An4
	.byte	W01
	.byte			En5
	.byte	W01
	.byte			Cn5
	.byte	W01
	.byte			An4, v028
	.byte	W01
	.byte	BEND	, c_v+8
	.byte		N01	, En5
	.byte	W01
	.byte			Cn5
	.byte	W01
	.byte			An4
	.byte	W02
	.byte	BEND	, c_v+10
	.byte	W80
	.byte	W96
	.byte		c_v-3
	.byte		N15	, Dn5, v012
	.byte	W16
	.byte			As4, v016
	.byte	W16
	.byte			Fn4, v024
	.byte	W16
	.byte		N11	, Dn5, v036
	.byte	W08
	.byte	BEND	, c_v-2
	.byte	W04
	.byte		N11	, As4, v040
	.byte	W12
	.byte		N07	, Fn4, v048
	.byte	W08
	.byte			Dn5, v052
	.byte	W08
	.byte			As4, v060
	.byte	W08
	.byte		N05	, Dn5, v064
	.byte	W06
	.byte			As4, v068
	.byte	W06
	.byte			Fn4, v072
	.byte	W05
	.byte	BEND	, c_v-1
	.byte	W01
	.byte		N05	, Dn5, v076
	.byte	W06
	.byte		N03	, As4, v080
	.byte	W04
	.byte			Fn4
	.byte	W04
	.byte			Dn5, v076
	.byte	W04
	.byte			As4
	.byte	W04
	.byte			Fn4, v072
	.byte	W04
	.byte			Dn5, v068
	.byte	W04
	.byte		N02	, As4
	.byte	W03
	.byte			Fn4, v064
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte			As4, v060
	.byte	W03
	.byte		N01	, Fn4
	.byte	W02
	.byte			Dn5, v056
	.byte	W02
	.byte			As4
	.byte	W02
	.byte			Fn4
	.byte	W02
	.byte			Dn5
	.byte	W01
	.byte			As4, v052
	.byte	W02
	.byte			Fn4
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte			As4
	.byte	W01
	.byte	BEND	, c_v
	.byte		N01	, Fn4
	.byte	W01
	.byte			Dn5, v048
	.byte	W01
	.byte			As4
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte			As4
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte	BEND	, c_v+1
	.byte		N01	, Dn5, v044
	.byte	W01
	.byte			As4
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte	BEND	, c_v+2
	.byte		N01	, As4
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte			As4, v040
	.byte	W01
	.byte	BEND	, c_v+3
	.byte		N01	, Fn4
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte			As4
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte	BEND	, c_v+4
	.byte		N01	, Dn5
	.byte	W01
	.byte			As4, v036
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte	BEND	, c_v+5
	.byte		N01	, Dn5
	.byte	W01
	.byte			As4
	.byte	W01
	.byte			Fn4
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte	BEND	, c_v+6
	.byte		N01	, As4
	.byte	W01
	.byte			Fn4, v032
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte			As4
	.byte	W01
	.byte	BEND	, c_v+7
	.byte		N01	, Fn4
	.byte	W01
	.byte			Dn5
	.byte	W01
	.byte			As4
	.byte	W01
	.byte			Fn4, v028
	.byte	W01
	.byte	BEND	, c_v+8
	.byte		N01	, Dn5
	.byte	W01
	.byte			As4
	.byte	W01
	.byte			Fn4
	.byte	W02
	.byte	BEND	, c_v+10
	.byte	W80
	.byte	W96
	.byte	W96
	.byte		c_v
	.byte	W96
	.byte	PATT	
		.word	song0023_6_1
	.byte	PATT	
		.word	song0023_6_2
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0023_6_1
	.byte	PATT	
		.word	song0023_6_2
	.byte	VOL	, v060
	.byte	W72
	.byte		N02	, En1, v028
	.byte	W03
	.byte			Gn1, v032
	.byte	W03
	.byte			An1
	.byte	W03
	.byte			Cn2, v036
	.byte	W03
	.byte			En2
	.byte	W03
	.byte			Gn1, v040
	.byte	W03
	.byte			An1
	.byte	W03
	.byte			Cn2, v044
	.byte	W03
song0023_6_3:
	.byte		N02	, En2, v044
	.byte	W03
	.byte			Gn2, v048
	.byte	W03
	.byte			En2
	.byte	W03
	.byte			Gn2, v052
	.byte	W03
	.byte			An2
	.byte	W03
	.byte			Cn3, v056
	.byte	W03
	.byte			En3
	.byte	W03
	.byte			Gn2
	.byte	W03
	.byte			An2, v060
	.byte	W03
	.byte			Cn3
	.byte	W03
	.byte			En3, v064
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			En3, v068
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			An3, v072
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			En4, v076
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			An3, v080
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			En4, v072
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			En4, v068
	.byte	W03
	.byte			Gn4, v064
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			Cn5, v060
	.byte	W03
	.byte			En5
	.byte	W03
	.byte			Gn4, v056
	.byte	W03
	.byte			An4
	.byte	W03
	.byte			Cn5, v052
	.byte	W03
	.byte			En5, v048
	.byte	W03
	.byte			Gn5
	.byte	W03
	.byte	PEND
song0023_6_4:
	.byte		N02	, En5, v044
	.byte	W03
	.byte			Gn5
	.byte	W03
	.byte			An5, v040
	.byte	W03
	.byte			Cn6, v036
	.byte	W03
	.byte			En6
	.byte	W03
	.byte			Gn5, v032
	.byte	W03
	.byte			An5
	.byte	W03
	.byte			Cn6, v028
	.byte	W03
	.byte			En6
	.byte	W03
	.byte			Gn6, v024
	.byte	W68
	.byte	W01
	.byte	PEND
	.byte	W96
	.byte	W48
	.byte	VOL	, v077
	.byte	W24
	.byte		N02	, Dn1, v028
	.byte	W03
	.byte			Fn1, v032
	.byte	W03
	.byte			Gn1
	.byte	W03
	.byte			As1, v036
	.byte	W03
	.byte			Dn2
	.byte	W03
	.byte			Fn1, v040
	.byte	W03
	.byte			Gn1
	.byte	W03
	.byte			As1, v044
	.byte	W03
song0023_6_5:
	.byte		N02	, Dn2, v044
	.byte	W03
	.byte			Fn2, v048
	.byte	W03
	.byte			Dn2
	.byte	W03
	.byte			Fn2, v052
	.byte	W03
	.byte			Gn2
	.byte	W03
	.byte			As2, v056
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Fn2
	.byte	W03
	.byte			Gn2, v060
	.byte	W03
	.byte			As2
	.byte	W03
	.byte			Dn3, v064
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Dn3, v068
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Gn3, v072
	.byte	W03
	.byte			As3
	.byte	W03
	.byte			Dn4, v076
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Gn3, v080
	.byte	W03
	.byte			As3
	.byte	W03
	.byte			Dn4, v072
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Dn4, v068
	.byte	W03
	.byte			Fn4, v064
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			As4, v060
	.byte	W03
	.byte			Dn5
	.byte	W03
	.byte			Fn4, v056
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			As4, v052
	.byte	W03
	.byte			Dn5, v048
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte	PEND
	.byte			Dn5, v044
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Gn5, v040
	.byte	W03
	.byte			As5, v036
	.byte	W03
	.byte			Dn6
	.byte	W03
	.byte			Fn5, v032
	.byte	W03
	.byte			Gn5
	.byte	W03
	.byte			As5, v028
	.byte	W03
	.byte			Dn6
	.byte	W03
	.byte			Fn6, v024
	.byte	W21
	.byte	VOL	, v110
	.byte		N03	, Ds5, v028
	.byte	W03
	.byte	VOL	, v108
	.byte	W03
	.byte		v106
	.byte		N09	
	.byte	W03
	.byte	VOL	, v103
	.byte	W03
	.byte		v102
	.byte	W03
	.byte		v099
	.byte	W03
	.byte		v097
	.byte		N03	
	.byte	W03
	.byte	VOL	, v095
	.byte	W03
	.byte		v093
	.byte		N09	
	.byte	W03
	.byte	VOL	, v090
	.byte	W03
	.byte		v089
	.byte	W03
	.byte		v086
	.byte	W03
	.byte		v084
	.byte		N03	
	.byte	W03
	.byte	VOL	, v083
	.byte	W03
	.byte		v080
	.byte		N09	
	.byte	W03
	.byte	VOL	, v078
	.byte	W03
	.byte		v076
	.byte	W03
	.byte		v074
	.byte	W03
	.byte		v071
	.byte		N03	
	.byte	W03
	.byte	VOL	, v071
	.byte	W03
	.byte		v069
	.byte		N09	
	.byte	W03
	.byte	VOL	, v067
	.byte	W03
	.byte		v064
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v061
	.byte		N03	
	.byte	W03
	.byte	VOL	, v059
	.byte	W03
	.byte		v058
	.byte		N09	
	.byte	W03
	.byte	VOL	, v056
	.byte	W03
	.byte		v054
	.byte	W03
	.byte		v051
	.byte	W03
	.byte		v050
	.byte		N03	
	.byte	W03
	.byte	VOL	, v048
	.byte	W03
	.byte		v046
	.byte		N09	
	.byte	W03
	.byte	VOL	, v045
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v038
	.byte		N03	
	.byte	W03
	.byte	VOL	, v037
	.byte	W03
	.byte		v035
	.byte		N09	
	.byte	W03
	.byte	VOL	, v033
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v030
	.byte	W03
	.byte		v028
	.byte		N03	
	.byte	W03
	.byte	VOL	, v025
	.byte	W03
	.byte		v024
	.byte		N09	
	.byte	W03
	.byte	VOL	, v022
	.byte	W03
	.byte		v020
	.byte	W03
	.byte		v019
	.byte	W03
	.byte		v017
	.byte		N03	
	.byte	W03
	.byte	VOL	, v015
	.byte	W03
	.byte		v012
	.byte		N09	
	.byte	W03
	.byte	VOL	, v011
	.byte	W03
	.byte		v009
	.byte	W03
	.byte		v007
	.byte	W03
	.byte		v006
	.byte		N03	
	.byte	W03
	.byte	VOL	, v004
	.byte	W03
	.byte		v002
	.byte		N09	
	.byte	W03
	.byte	VOL	, v000
	.byte	W21
	.byte		v077
	.byte	W24
	.byte		N02	, En1
	.byte	W03
	.byte			Gn1, v032
	.byte	W03
	.byte			An1
	.byte	W03
	.byte			Cn2, v036
	.byte	W03
	.byte			En2
	.byte	W03
	.byte			Gn1, v040
	.byte	W03
	.byte			An1
	.byte	W03
	.byte			Cn2, v044
	.byte	W03
	.byte	PATT	
		.word	song0023_6_3
	.byte	PATT	
		.word	song0023_6_4
	.byte	W96
	.byte	VOL	, v077
	.byte	W72
	.byte		N02	, Dn1, v028
	.byte	W03
	.byte			Fn1, v032
	.byte	W03
	.byte			Gn1
	.byte	W03
	.byte			As1, v036
	.byte	W03
	.byte			Dn2
	.byte	W03
	.byte			Fn1, v040
	.byte	W03
	.byte			Gn1
	.byte	W03
	.byte			As1, v044
	.byte	W03
	.byte	PATT	
		.word	song0023_6_5
	.byte		N02	, Dn5, v044
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Gn5, v040
	.byte	W03
	.byte			As5, v036
	.byte	W03
	.byte			Dn6
	.byte	W03
	.byte			Fn5, v032
	.byte	W03
	.byte			Gn5
	.byte	W03
	.byte			As5, v028
	.byte	W03
	.byte			Dn6
	.byte	W03
	.byte			Fn6, v024
	.byte	W68
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0023_6_6
	.byte	FINE

	@********************** Track  7 **********************@

	.global song0023_7
song0023_7:	@ 0x08C65D5C
	.byte	KEYSH	, 0
song0023_7_5:
	.byte	VOICE	, 12
	.byte	VOL	, v110
	.byte	MOD	, 123
	.byte	VOL	, v110
	.byte	LFOS	, 86
	.byte	BENDR	, 53
	.byte	VOL	, v110
	.byte	MOD	, 123
	.byte	LFOS	, 86
	.byte	BENDR	, 53
	.byte	PAN	, c_v-34
	.byte	BEND	, c_v-23
	.byte		TIE	, Cn3, v072
	.byte	W03
	.byte	BEND	, c_v-21
	.byte	W03
	.byte		c_v-18
	.byte	W03
	.byte		c_v-15
	.byte	W03
	.byte		c_v-12
	.byte	W03
	.byte		c_v-9
	.byte	W03
	.byte		c_v-6
	.byte	W03
	.byte		c_v-3
	.byte	W03
	.byte		c_v
	.byte	W03
	.byte		c_v+3
	.byte	W03
	.byte		c_v+6
	.byte	W03
	.byte		c_v+9
	.byte	W02
	.byte	VOL	, v109
	.byte	W01
	.byte		v106
	.byte	BEND	, c_v+12
	.byte	W01
	.byte	VOL	, v103
	.byte	W01
	.byte		v099
	.byte	W01
	.byte		v097
	.byte	BEND	, c_v+15
	.byte	W01
	.byte	VOL	, v092
	.byte	W01
	.byte		v089
	.byte	W01
	.byte		v086
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v083
	.byte	W01
	.byte		v079
	.byte	W01
	.byte		v077
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v072
	.byte	W01
	.byte		v069
	.byte	W01
	.byte		v066
	.byte	BEND	, c_v+23
	.byte	W01
	.byte	VOL	, v063
	.byte	W01
	.byte		v058
	.byte	W01
	.byte		v057
	.byte	BEND	, c_v+26
	.byte	W01
	.byte	VOL	, v052
	.byte	W01
	.byte		v049
	.byte	W01
	.byte		v046
	.byte	BEND	, c_v+29
	.byte	W01
	.byte	VOL	, v044
	.byte	W02
	.byte	BEND	, c_v+32
	.byte	W01
	.byte	VOL	, v043
	.byte	W01
	.byte		v042
	.byte	W01
	.byte		v041
	.byte	BEND	, c_v+35
	.byte	W01
	.byte	VOL	, v040
	.byte	W02
	.byte		v039
	.byte	BEND	, c_v+38
	.byte	W01
	.byte	VOL	, v038
	.byte	W01
	.byte		v038
	.byte	W01
	.byte	BEND	, c_v+41
	.byte	W01
	.byte	VOL	, v037
	.byte	W01
	.byte		v036
	.byte	W01
	.byte		v035
	.byte	BEND	, c_v+44
	.byte	W02
	.byte	VOL	, v034
	.byte	W01
	.byte		v033
	.byte	BEND	, c_v+47
	.byte	W01
	.byte	VOL	, v032
	.byte	W01
	.byte		v032
	.byte	W01
	.byte	BEND	, c_v+50
	.byte	W01
	.byte	VOL	, v031
	.byte	W01
	.byte		v030
	.byte	W01
	.byte		v029
	.byte	BEND	, c_v+53
	.byte	W02
	.byte	VOL	, v028
	.byte	W01
	.byte		v027
	.byte	BEND	, c_v+56
	.byte	W01
	.byte	VOL	, v026
	.byte	W02
	.byte		v025
	.byte	BEND	, c_v+59
	.byte	W01
	.byte	VOL	, v025
	.byte	W01
	.byte		v024
	.byte	W01
	.byte		v023
	.byte	BEND	, c_v+62
	.byte	W01
	.byte		c_v+63
	.byte	W01
	.byte	VOL	, v022
	.byte	W01
	.byte		v021
	.byte	W01
	.byte		v020
	.byte	W02
	.byte		v019
	.byte	W01
	.byte		v019
	.byte	W01
	.byte		v018
	.byte	W01
	.byte	W01
	.byte		v017
	.byte	W01
	.byte		v016
	.byte	W01
	.byte		v015
	.byte	W01
	.byte		v014
	.byte	W02
	.byte		v013
	.byte	W01
	.byte		v012
	.byte	W01
	.byte		v012
	.byte	W02
	.byte		v011
	.byte	W01
	.byte		v010
	.byte	W01
	.byte		v009
	.byte	W02
	.byte		v008
	.byte	W01
	.byte		v007
	.byte	W01
	.byte		v006
	.byte	W01
	.byte		v006
	.byte	W02
	.byte		v005
	.byte	W01
	.byte		v004
	.byte	W01
	.byte		v003
	.byte	W02
	.byte		v002
	.byte	W01
	.byte		v001
	.byte	W01
	.byte		v000
	.byte	W01
	.byte		v000
	.byte	W68
	.byte	W02
	.byte	W96
	.byte		EOT	
	.byte	VOL	, v000
	.byte	BEND	, c_v+63
	.byte		TIE	
	.byte	W01
	.byte	BEND	, c_v+62
	.byte	W01
	.byte	VOL	, v000
	.byte	W01
	.byte		v001
	.byte	BEND	, c_v+60
	.byte	W01
	.byte	VOL	, v002
	.byte	BEND	, c_v+59
	.byte	W01
	.byte	VOL	, v003
	.byte	W01
	.byte		v004
	.byte	BEND	, c_v+57
	.byte	W01
	.byte	VOL	, v005
	.byte	BEND	, c_v+56
	.byte	W01
	.byte	VOL	, v006
	.byte	W01
	.byte		v006
	.byte	BEND	, c_v+54
	.byte	W01
	.byte	VOL	, v007
	.byte	BEND	, c_v+53
	.byte	W02
	.byte	VOL	, v008
	.byte	BEND	, c_v+51
	.byte	W01
	.byte	VOL	, v009
	.byte	BEND	, c_v+49
	.byte	W01
	.byte	VOL	, v010
	.byte	W01
	.byte		v011
	.byte	BEND	, c_v+48
	.byte	W01
	.byte	VOL	, v012
	.byte	BEND	, c_v+46
	.byte	W01
	.byte	VOL	, v012
	.byte	W01
	.byte		v013
	.byte	BEND	, c_v+45
	.byte	W01
	.byte	VOL	, v014
	.byte	BEND	, c_v+43
	.byte	W01
	.byte	VOL	, v015
	.byte	W01
	.byte		v016
	.byte	BEND	, c_v+42
	.byte	W01
	.byte	VOL	, v017
	.byte	BEND	, c_v+40
	.byte	W01
	.byte	VOL	, v018
	.byte	W01
	.byte		v019
	.byte	BEND	, c_v+39
	.byte	W01
	.byte	VOL	, v021
	.byte	BEND	, c_v+37
	.byte	W01
	.byte	VOL	, v023
	.byte	W01
	.byte		v025
	.byte	BEND	, c_v+35
	.byte	W01
	.byte	VOL	, v027
	.byte	BEND	, c_v+34
	.byte	W01
	.byte	VOL	, v030
	.byte	W01
	.byte		v032
	.byte	BEND	, c_v+32
	.byte	W01
	.byte	VOL	, v034
	.byte	BEND	, c_v+31
	.byte	W01
	.byte	VOL	, v036
	.byte	W01
	.byte		v038
	.byte	BEND	, c_v+29
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v+28
	.byte	W01
	.byte	VOL	, v043
	.byte	W01
	.byte		v045
	.byte	BEND	, c_v+26
	.byte	W01
	.byte	VOL	, v047
	.byte	BEND	, c_v+25
	.byte	W01
	.byte	VOL	, v049
	.byte	W01
	.byte		v051
	.byte	BEND	, c_v+23
	.byte	W01
	.byte	VOL	, v053
	.byte	BEND	, c_v+21
	.byte	W01
	.byte	VOL	, v056
	.byte	W01
	.byte		v058
	.byte	BEND	, c_v+20
	.byte	W01
	.byte	VOL	, v060
	.byte	BEND	, c_v+18
	.byte	W01
	.byte	VOL	, v062
	.byte	W01
	.byte		v064
	.byte	BEND	, c_v+17
	.byte	W01
	.byte	VOL	, v066
	.byte	BEND	, c_v+15
	.byte	W01
	.byte	VOL	, v069
	.byte	W01
	.byte		v071
	.byte	BEND	, c_v+14
	.byte	W01
	.byte	VOL	, v073
	.byte	BEND	, c_v+12
	.byte	W01
	.byte	VOL	, v075
	.byte	W01
	.byte		v077
	.byte	BEND	, c_v+10
	.byte	W01
	.byte	VOL	, v079
	.byte	BEND	, c_v+9
	.byte	W01
	.byte	VOL	, v082
	.byte	W01
	.byte		v084
	.byte	BEND	, c_v+7
	.byte	W01
	.byte		c_v+6
	.byte	W01
	.byte	VOL	, v083
	.byte	W01
	.byte		v082
	.byte	BEND	, c_v+4
	.byte	W01
	.byte	VOL	, v081
	.byte	BEND	, c_v+3
	.byte	W01
	.byte	VOL	, v079
	.byte	W01
	.byte		v078
	.byte	BEND	, c_v+1
	.byte	W01
	.byte	VOL	, v077
	.byte	BEND	, c_v
	.byte	W01
	.byte	VOL	, v076
	.byte	W01
	.byte		v074
	.byte	BEND	, c_v-2
	.byte	W01
	.byte	VOL	, v073
	.byte	BEND	, c_v-4
	.byte	W01
	.byte	VOL	, v072
	.byte	W01
	.byte		v071
	.byte	BEND	, c_v-5
	.byte	W01
	.byte	VOL	, v070
	.byte	BEND	, c_v-7
	.byte	W01
	.byte	VOL	, v068
	.byte	W01
	.byte		v067
	.byte	BEND	, c_v-8
	.byte	W01
	.byte	VOL	, v065
	.byte	BEND	, c_v-10
	.byte	W01
	.byte	VOL	, v064
	.byte	W01
	.byte		v064
	.byte	BEND	, c_v-11
	.byte	W01
	.byte	VOL	, v062
	.byte	BEND	, c_v-13
	.byte	W01
	.byte	VOL	, v061
	.byte	W01
	.byte		v059
	.byte	BEND	, c_v-14
	.byte	W01
	.byte	VOL	, v058
	.byte	BEND	, c_v-16
	.byte	W01
	.byte	VOL	, v057
	.byte	W01
	.byte		v056
	.byte	BEND	, c_v-18
	.byte	W01
	.byte	VOL	, v055
	.byte	BEND	, c_v-19
	.byte	W01
	.byte	VOL	, v053
	.byte	W01
	.byte		v052
	.byte	BEND	, c_v-21
	.byte	W01
	.byte	VOL	, v051
	.byte	BEND	, c_v-22
	.byte	W01
	.byte	VOL	, v050
	.byte	W01
	.byte		v048
	.byte	BEND	, c_v-24
	.byte	W01
	.byte	VOL	, v047
	.byte	BEND	, c_v-25
	.byte	W01
	.byte	VOL	, v046
	.byte	W01
	.byte		v045
	.byte	BEND	, c_v-27
	.byte	W01
	.byte	VOL	, v044
	.byte	BEND	, c_v-28
	.byte	W01
	.byte	VOL	, v043
	.byte	W01
	.byte		v042
	.byte	BEND	, c_v-30
	.byte	W01
	.byte	VOL	, v040
	.byte	BEND	, c_v-32
	.byte	W01
	.byte	VOL	, v038
	.byte	W01
	.byte		v038
	.byte	BEND	, c_v-33
	.byte	W01
	.byte	VOL	, v036
	.byte	BEND	, c_v-35
	.byte	W01
	.byte	VOL	, v035
	.byte	W01
	.byte		v033
	.byte	BEND	, c_v-36
	.byte	W01
	.byte	VOL	, v032
	.byte	BEND	, c_v-38
	.byte	W01
	.byte	VOL	, v031
	.byte	W01
	.byte		v030
	.byte	BEND	, c_v-39
	.byte	W01
	.byte	VOL	, v028
	.byte	BEND	, c_v-41
	.byte	W01
	.byte	VOL	, v027
	.byte	W01
	.byte		v025
	.byte	BEND	, c_v-43
	.byte	W01
	.byte	VOL	, v025
	.byte	BEND	, c_v-44
	.byte	W01
	.byte	VOL	, v023
	.byte	W01
	.byte		v021
	.byte	BEND	, c_v-46
	.byte	W01
	.byte	VOL	, v020
	.byte	BEND	, c_v-47
	.byte	W01
	.byte	VOL	, v019
	.byte	W01
	.byte		v018
	.byte	BEND	, c_v-49
	.byte	W01
	.byte	VOL	, v017
	.byte	BEND	, c_v-50
	.byte	W01
	.byte	VOL	, v016
	.byte	W01
	.byte		v014
	.byte	BEND	, c_v-52
	.byte	W01
	.byte	VOL	, v013
	.byte	BEND	, c_v-53
	.byte	W01
	.byte	VOL	, v012
	.byte	W01
	.byte		v011
	.byte	BEND	, c_v-55
	.byte	W01
	.byte	VOL	, v009
	.byte	BEND	, c_v-57
	.byte	W01
	.byte	VOL	, v008
	.byte	W01
	.byte		v006
	.byte	BEND	, c_v-58
	.byte	W01
	.byte	VOL	, v005
	.byte	BEND	, c_v-60
	.byte	W01
	.byte	VOL	, v004
	.byte	W01
	.byte		v002
	.byte	BEND	, c_v-61
	.byte	W01
	.byte	VOL	, v001
	.byte	BEND	, c_v-63
	.byte	W01
	.byte	VOL	, v000
	.byte	BEND	, c_v-64
	.byte	W68
	.byte	W02
	.byte	W96
	.byte		EOT	
	.byte	VOL	, v077
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOICE	, 12
	.byte	VOL	, v110
	.byte	MOD	, 0
	.byte	LFOS	, 86
	.byte	BENDR	, 53
	.byte	W96
song0023_7_1:
	.byte	BEND	, c_v
	.byte		N05	, Fs1, v100
	.byte	W18
	.byte			Cs2
	.byte	W12
	.byte	BEND	, c_v
	.byte		N11	, Cs2, v104
	.byte	W07
	.byte	BEND	, c_v-3
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v-11
	.byte	W07
	.byte		c_v-8
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v
	.byte		N05	, Fs1, v100
	.byte	W18
	.byte		N17	, Cs2
	.byte	W18
	.byte		N11	, Fs1
	.byte	W05
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+14
	.byte	W04
	.byte	PEND
	.byte	PATT	
		.word	song0023_7_1
song0023_7_2:
	.byte	BEND	, c_v
	.byte		N05	, Fn1, v100
	.byte	W18
	.byte			Cn2
	.byte	W12
	.byte	BEND	, c_v
	.byte		N11	, Cn2, v104
	.byte	W07
	.byte	BEND	, c_v-3
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v-11
	.byte	W07
	.byte		c_v-8
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v
	.byte		N05	, Fn1, v100
	.byte	W18
	.byte		N17	, Cn2
	.byte	W18
	.byte		N11	, Fn1
	.byte	W05
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+14
	.byte	W04
	.byte	PEND
	.byte	PATT	
		.word	song0023_7_2
song0023_7_3:
	.byte	BEND	, c_v
	.byte		N05	, En1, v100
	.byte	W18
	.byte			Bn1
	.byte	W12
	.byte	BEND	, c_v
	.byte		N11	, Bn1, v104
	.byte	W07
	.byte	BEND	, c_v-3
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v-11
	.byte	W07
	.byte		c_v-8
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v
	.byte		N05	, En1, v100
	.byte	W18
	.byte		N17	, Bn1
	.byte	W18
	.byte		N11	, En1
	.byte	W05
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+14
	.byte	W04
	.byte	PEND
	.byte	PATT	
		.word	song0023_7_3
	.byte	PATT	
		.word	song0023_7_2
	.byte	BEND	, c_v
	.byte		N05	, Dn1, v100
	.byte	W18
	.byte			An1
	.byte	W12
	.byte	BEND	, c_v
	.byte		N11	, An1, v104
	.byte	W07
	.byte	BEND	, c_v-3
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v-11
	.byte	W07
	.byte		c_v-8
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v
	.byte		N05	, Dn1, v100
	.byte	W18
	.byte		N17	, An1
	.byte	W18
	.byte		N11	, Dn1
	.byte	W05
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+14
	.byte	W04
song0023_7_4:
	.byte	BEND	, c_v
	.byte		N05	, As1, v100
	.byte	W18
	.byte			Fn2
	.byte	W12
	.byte	BEND	, c_v
	.byte		N11	, Fn2, v104
	.byte	W07
	.byte	BEND	, c_v-3
	.byte	W01
	.byte		c_v-6
	.byte	W01
	.byte		c_v-11
	.byte	W07
	.byte		c_v-8
	.byte	W01
	.byte		c_v-4
	.byte	W01
	.byte		c_v
	.byte		N05	, As1, v100
	.byte	W18
	.byte		N17	, Fn2
	.byte	W18
	.byte		N11	, As1
	.byte	W05
	.byte	BEND	, c_v
	.byte	W01
	.byte		c_v+7
	.byte	W01
	.byte		c_v+10
	.byte	W01
	.byte		c_v+14
	.byte	W04
	.byte	PEND
	.byte	PATT	
		.word	song0023_7_4
	.byte	PATT	
		.word	song0023_7_4
	.byte	W96
	.byte	GOTO	
		.word	song0023_7_5
	.byte	FINE

	@********************** Track  8 **********************@

	.global song0023_8
song0023_8:	@ 0x08C6618B
	.byte	KEYSH	, 0
song0023_8_1:
	.byte	VOICE	, 96
	.byte	VOL	, v110
	.byte	MOD	, 78
	.byte	LFOS	, 21
	.byte	MODT	, 2
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		TIE	, Cn4, v127
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, Bn3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, As3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, An3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, Cn4
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, Bn3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, As3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, An3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		TIE	, Cn4
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, Bn3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, As3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, An3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, Cn4
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, Bn3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, As3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		TIE	, An3
	.byte	W96
	.byte	W92
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte		N32	, Gs3
	.byte	W36
	.byte		TIE	, En3, v120
	.byte	W60
	.byte	W64
	.byte		EOT	
	.byte	W08
	.byte		N14	, Gs3, v127
	.byte	W24
	.byte		N32	, Gn3, v124
	.byte	W36
	.byte		TIE	, Ds3
	.byte	W60
	.byte	W88
	.byte		EOT	
	.byte	W08
	.byte		N76	, Dn3
	.byte	W78
	.byte		N02	, Ds3, v112
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte			Fs3
	.byte	W03
	.byte			Gs3
	.byte	W03
	.byte			As3
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte		N66	, Dn4, v120
	.byte	W72
	.byte		N19	, Dn4, v108
	.byte	W24
	.byte		N68	, Ds4, v127
	.byte	W72
	.byte		N23	, Ds4, v100
	.byte	W24
	.byte		N76	, En4, v116
	.byte	W96
	.byte		TIE	, Fn4, v120
	.byte	W96
	.byte	W96
	.byte	W92
	.byte	W02
	.byte		EOT	
	.byte	W02
	.byte	W12
	.byte		N05	, Cn4
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W06
	.byte		N05	
	.byte	W12
	.byte			Dn4
	.byte	W12
	.byte		N05	
	.byte	W12
	.byte			As3
	.byte	W06
	.byte		N11	
	.byte	W12
	.byte		N05	, Gs3
	.byte	W12
	.byte	GOTO	
		.word	song0023_8_1
	.byte	FINE

	@********************** Track  9 **********************@

	.global song0023_9
song0023_9:	@ 0x08C66277
	.byte	KEYSH	, 0
song0023_9_5:
	.byte	VOICE	, 99
	.byte	VOL	, v110
	.byte	W06
	.byte	VOICE	, 99
	.byte		N05	, Cn3, v124
	.byte	W18
	.byte			Cn3, v060
	.byte	W12
	.byte	VOICE	, 100
	.byte	W06
	.byte		N05	, Cn3, v080
	.byte	W18
	.byte			Cn3, v052
	.byte	W06
	.byte	VOICE	, 101
	.byte	W12
	.byte		N05	, Cn3, v060
	.byte	W18
song0023_9_1:
	.byte		N05	, Cn3, v032
	.byte	W06
	.byte			Bn2, v124
	.byte	W06
	.byte			As2
	.byte	W18
	.byte		N05	
	.byte	W06
	.byte	VOICE	, 100
	.byte	W12
	.byte		N05	
	.byte	W18
	.byte		N05	
	.byte	W06
	.byte	VOICE	, 99
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte	PEND
song0023_9_2:
	.byte	W06
	.byte	VOICE	, 99
	.byte		N05	, Cn3, v124
	.byte	W18
	.byte			Cn3, v060
	.byte	W12
	.byte	VOICE	, 100
	.byte	W06
	.byte		N05	, Cn3, v080
	.byte	W18
	.byte			Cn3, v052
	.byte	W06
	.byte	VOICE	, 101
	.byte	W12
	.byte		N05	, Cn3, v060
	.byte	W18
	.byte	PEND
	.byte	PATT	
		.word	song0023_9_1
	.byte	PATT	
		.word	song0023_9_2
	.byte	PATT	
		.word	song0023_9_1
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0023_9_3:
	.byte	W06
	.byte	VOICE	, 99
	.byte		N05	, Fn2, v124
	.byte	W18
	.byte			Fn2, v060
	.byte	W12
	.byte	VOICE	, 100
	.byte	W06
	.byte		N05	, Fn2, v080
	.byte	W18
	.byte			Fn2, v052
	.byte	W06
	.byte	VOICE	, 101
	.byte	W12
	.byte		N05	, Fn2, v060
	.byte	W18
	.byte	PEND
song0023_9_4:
	.byte		N05	, Fn2, v032
	.byte	W06
	.byte			En2, v124
	.byte	W06
	.byte			Ds2
	.byte	W18
	.byte		N05	
	.byte	W06
	.byte	VOICE	, 100
	.byte	W12
	.byte		N05	
	.byte	W18
	.byte		N05	
	.byte	W06
	.byte	VOICE	, 99
	.byte	W12
	.byte		N05	
	.byte	W06
	.byte			En2
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0023_9_3
	.byte	PATT	
		.word	song0023_9_4
	.byte	PATT	
		.word	song0023_9_3
	.byte	PATT	
		.word	song0023_9_4
	.byte	PATT	
		.word	song0023_9_3
	.byte	PATT	
		.word	song0023_9_4
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0023_9_5
	.byte	FINE

	@********************** Track  10 **********************@

	.global song0023_10
song0023_10:	@ 0x08C66363
	.byte	KEYSH	, 0
song0023_10_9:
	.byte	VOICE	, 44
	.byte	VOL	, v110
	.byte	PAN	, c_v+23
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	VOL	, v051
	.byte	W96
song0023_10_1:
	.byte	W48
	.byte		N02	, En2, v028
	.byte	W03
	.byte			Gn2, v032
	.byte	W03
	.byte			An2
	.byte	W03
	.byte			Cn3, v036
	.byte	W03
	.byte			En3
	.byte	W03
	.byte			Gn2, v040
	.byte	W03
	.byte			An2
	.byte	W03
	.byte			Cn3, v044
	.byte	W03
	.byte			En3
	.byte	W03
	.byte			Gn3, v048
	.byte	W03
	.byte			En3
	.byte	W03
	.byte			Gn3, v052
	.byte	W03
	.byte			An3
	.byte	W03
	.byte			Cn4, v056
	.byte	W03
	.byte			En4
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte	PEND
song0023_10_2:
	.byte		N02	, An3, v060
	.byte	W03
	.byte			Cn4
	.byte	W03
	.byte			En4, v064
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			En4, v068
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			An4, v072
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			En5, v076
	.byte	W03
	.byte			Gn4
	.byte	W03
	.byte			An4, v080
	.byte	W03
	.byte			Cn5
	.byte	W03
	.byte			En5, v072
	.byte	W03
	.byte			Gn5
	.byte	W03
	.byte			En5, v068
	.byte	W03
	.byte			Gn5, v064
	.byte	W03
	.byte			An5
	.byte	W03
	.byte			Cn6, v060
	.byte	W03
	.byte			En6
	.byte	W03
	.byte			Gn5, v056
	.byte	W03
	.byte			An5
	.byte	W03
	.byte			Cn6, v052
	.byte	W03
	.byte			En6, v048
	.byte	W03
	.byte			Gn6
	.byte	W03
	.byte			En6, v044
	.byte	W03
	.byte			Gn6
	.byte	W03
	.byte			An6, v040
	.byte	W03
	.byte			Cn7, v036
	.byte	W03
	.byte			En7
	.byte	W03
	.byte			Gn6, v032
	.byte	W03
	.byte			An6
	.byte	W03
	.byte			Cn7, v028
	.byte	W03
	.byte	PEND
song0023_10_3:
	.byte		N02	, En7, v028
	.byte	W03
	.byte			Gn7, v024
	.byte	W92
	.byte	W01
	.byte	PEND
	.byte	W96
song0023_10_4:
	.byte	W48
	.byte		N02	, Dn2, v028
	.byte	W03
	.byte			Fn2, v032
	.byte	W03
	.byte			Gn2
	.byte	W03
	.byte			As2, v036
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Fn2, v040
	.byte	W03
	.byte			Gn2
	.byte	W03
	.byte			As2, v044
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Fn3, v048
	.byte	W03
	.byte			Dn3
	.byte	W03
	.byte			Fn3, v052
	.byte	W03
	.byte			Gn3
	.byte	W03
	.byte			As3, v056
	.byte	W03
	.byte			Dn4
	.byte	W03
	.byte			Fn3
	.byte	W03
	.byte	PEND
song0023_10_5:
	.byte		N02	, Gn3, v060
	.byte	W03
	.byte			As3
	.byte	W03
	.byte			Dn4, v064
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Dn4, v068
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Gn4, v072
	.byte	W03
	.byte			As4
	.byte	W03
	.byte			Dn5, v076
	.byte	W03
	.byte			Fn4
	.byte	W03
	.byte			Gn4, v080
	.byte	W03
	.byte			As4
	.byte	W03
	.byte			Dn5, v072
	.byte	W03
	.byte			Fn5
	.byte	W03
	.byte			Dn5, v068
	.byte	W03
	.byte			Fn5, v064
	.byte	W03
	.byte			Gn5
	.byte	W03
	.byte			As5, v060
	.byte	W03
	.byte			Dn6
	.byte	W03
	.byte			Fn5, v056
	.byte	W03
	.byte			Gn5
	.byte	W03
	.byte			As5, v052
	.byte	W03
	.byte			Dn6, v048
	.byte	W03
	.byte			Fn6
	.byte	W03
	.byte			Dn6, v044
	.byte	W03
	.byte			Fn6
	.byte	W03
	.byte			Gn6, v040
	.byte	W03
	.byte			As6, v036
	.byte	W03
	.byte			Dn7
	.byte	W03
	.byte			Fn6, v032
	.byte	W03
	.byte			Gn6
	.byte	W03
	.byte			As6, v028
	.byte	W03
	.byte	PEND
song0023_10_6:
	.byte		N02	, Dn7, v028
	.byte	W03
	.byte			Fn7, v024
	.byte	W92
	.byte	W01
	.byte	PEND
	.byte	W96
	.byte	PATT	
		.word	song0023_10_1
	.byte	PATT	
		.word	song0023_10_2
	.byte	PATT	
		.word	song0023_10_3
	.byte	W96
	.byte	PATT	
		.word	song0023_10_4
	.byte	PATT	
		.word	song0023_10_5
	.byte	PATT	
		.word	song0023_10_6
	.byte	W96
	.byte	VOL	, v060
	.byte		N04	, Fs2, v127
	.byte	W06
	.byte			Fs2, v112
	.byte	W06
	.byte			Fs3, v127
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Fs2, v112
	.byte	W06
	.byte			Fs3, v127
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Fs3
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Cs3
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
song0023_10_7:
	.byte		N04	, Fn2, v127
	.byte	W06
	.byte			Fn2, v112
	.byte	W06
	.byte			Fn3, v127
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fn3
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Gs2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0023_10_7
	.byte		N04	, En2, v127
	.byte	W06
	.byte			En2, v112
	.byte	W06
	.byte			En3, v127
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			En2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			En2, v112
	.byte	W06
	.byte			En3, v127
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			En3
	.byte	W06
	.byte			En2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Bn2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Bn1
	.byte	W06
	.byte			En1
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			En1
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte			Fn1, v112
	.byte	W06
	.byte			Fn2, v127
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Cn2
	.byte	W06
	.byte			Fn1
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Cn2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			En2
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Cn2
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte			Dn2, v112
	.byte	W06
	.byte			Dn3, v127
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte			Dn3
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			An2
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Gn2
	.byte	W06
	.byte			Fs2
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte			Cn2
	.byte	W06
	.byte			An1
	.byte	W06
song0023_10_8:
	.byte		N04	, As1, v127
	.byte	W06
	.byte			As1, v112
	.byte	W06
	.byte			As2, v127
	.byte	W06
	.byte			As1
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			As1
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			As1
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Ds2
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte			As1
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte	PEND
	.byte	PATT	
		.word	song0023_10_8
	.byte		N04	, As1, v127
	.byte	W06
	.byte			As1, v112
	.byte	W06
	.byte			As2, v127
	.byte	W06
	.byte			As1
	.byte	W06
	.byte			As2
	.byte	W06
	.byte			As1
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			As1
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Dn2
	.byte	W06
	.byte			As1
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte			Fn2
	.byte	W06
	.byte			Cn3
	.byte	W06
	.byte			As2
	.byte	W12
	.byte			Dn2
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W06
	.byte		N04	
	.byte	W12
	.byte			En2
	.byte	W12
	.byte		N04	
	.byte	W12
	.byte			Cn2
	.byte	W06
	.byte		N10	
	.byte	W12
	.byte		N04	, As1
	.byte	W12
	.byte	GOTO	
		.word	song0023_10_9
	.byte	FINE

	@********************** Track  11 **********************@

	.global song0023_11
song0023_11:	@ 0x08C66622
	.byte	KEYSH	, 0
song0023_11_3:
	.byte	VOICE	, 14
	.byte	VOL	, v047
	.byte	PAN	, c_v-24
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
song0023_11_1:
	.byte	VOL	, v110
	.byte		N23	, Ds5, v028
	.byte	W24
	.byte			Fs4
	.byte	W24
	.byte			Bn4
	.byte	W24
	.byte			Ds4
	.byte	W24
	.byte	PEND
song0023_11_2:
	.byte		TIE	, Dn4, v028
	.byte	W06
	.byte	VOL	, v109
	.byte	W03
	.byte		v107
	.byte	W03
	.byte		v105
	.byte	W03
	.byte		v103
	.byte	W03
	.byte		v102
	.byte	W03
	.byte		v100
	.byte	W03
	.byte		v097
	.byte	W03
	.byte		v096
	.byte	W03
	.byte		v094
	.byte	W03
	.byte		v092
	.byte	W03
	.byte		v090
	.byte	W03
	.byte		v088
	.byte	W03
	.byte		v086
	.byte	W03
	.byte		v084
	.byte	W03
	.byte		v083
	.byte	W03
	.byte		v080
	.byte	W03
	.byte		v078
	.byte	W03
	.byte		v077
	.byte	W03
	.byte		v075
	.byte	W03
	.byte		v072
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v062
	.byte	W03
	.byte		v056
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v032
	.byte	W03
	.byte		v027
	.byte	W03
	.byte		v021
	.byte	W03
	.byte		v015
	.byte	W03
	.byte	PEND
	.byte		v010
	.byte	W02
	.byte		EOT	
	.byte	W01
	.byte	VOL	, v004
	.byte	W03
	.byte		v000
	.byte	W90
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	PATT	
		.word	song0023_11_1
	.byte	PATT	
		.word	song0023_11_2
	.byte	VOL	, v010
	.byte	W02
	.byte		EOT	, Dn4
	.byte	W01
	.byte	VOL	, v004
	.byte	W03
	.byte		v000
	.byte	W90
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	GOTO	
		.word	song0023_11_3
	.byte	FINE

	@********************** Track  12 **********************@

	.global song0023_12
song0023_12:	@ 0x08C666D1
	.byte	KEYSH	, 0
song0023_12_1:
	.byte	VOICE	, 65
	.byte	VOL	, v069
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		N32	, Cn4, v120
	.byte	W36
	.byte		TIE	, Gs3, v127
	.byte	W60
	.byte	W48
	.byte	W01
	.byte		EOT	
	.byte	W23
	.byte		N23	, Cn4, v120
	.byte	W24
	.byte		N30	, Bn3, v124
	.byte	W36
	.byte		TIE	, Gn3, v127
	.byte	W60
	.byte	W76
	.byte		EOT	
	.byte	W20
	.byte		TIE	, Fs3, v124
	.byte	W96
	.byte	W06
	.byte		EOT	
	.byte	W90
	.byte		N48	, Gn3, v127
	.byte	W48
	.byte		N40	, Gn4, v108
	.byte	W48
	.byte		N44	, Gs3, v120
	.byte	W48
	.byte		N36	, Gs4, v124
	.byte	W48
	.byte		N44	, An3, v076
	.byte	W48
	.byte		TIE	, An4, v080
	.byte	W48
	.byte	W96
	.byte	W66
	.byte		EOT	
	.byte	W30
	.byte	W96
	.byte	GOTO	
		.word	song0023_12_1
	.byte	FINE

	@********************** Track  13 **********************@

	.global song0023_13
song0023_13:	@ 0x08C6674A
	.byte	KEYSH	, 0
song0023_13_1:
	.byte	VOICE	, 98
	.byte	VOL	, v060
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W72
	.byte		N23	, Fs2, v100
	.byte		N23	, Fs3
	.byte	W24
	.byte			Fs3, v120
	.byte		N23	, Fs4
	.byte	W24
	.byte			Gn3, v100
	.byte		N23	, Gn4
	.byte	W24
	.byte			An3, v112
	.byte		N23	, An4
	.byte	W24
	.byte			Dn3
	.byte		N23	, Dn4
	.byte	W24
	.byte		N80	, Cn3, v100
	.byte		N80	, Cn4
	.byte	W84
	.byte		N05	, Dn3
	.byte		N05	, Dn4
	.byte	W06
	.byte			Ds3
	.byte		N05	, Ds4
	.byte	W06
	.byte		N80	, En3, v112
	.byte		N80	, En4
	.byte	W84
	.byte		N05	, Ds3, v100
	.byte		N05	, Ds4
	.byte	W06
	.byte			En3
	.byte		N05	, En4
	.byte	W06
	.byte		TIE	, Fn3, v112
	.byte		TIE	, Fn4
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W04
	.byte		EOT	, Fn3
	.byte			Fn4
	.byte	W92
	.byte	GOTO	
		.word	song0023_13_1
	.byte	FINE

	@********************** Track  14 **********************@

	.global song0023_14
song0023_14:	@ 0x08C667CE
	.byte	KEYSH	, 0
song0023_14_1:
	.byte	VOICE	, 64
	.byte	VOL	, v110
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte	W96
	.byte		v110
	.byte	W84
	.byte		TIE	, Bn3, v112
	.byte	W06
	.byte	VOL	, v099
	.byte	W03
	.byte		v081
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v054
	.byte	W03
	.byte		v058
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v065
	.byte	W03
	.byte		v069
	.byte	W03
	.byte		v072
	.byte	W03
	.byte		v076
	.byte	W03
	.byte		v080
	.byte	W03
	.byte		v084
	.byte	W03
	.byte		v086
	.byte	W03
	.byte		v090
	.byte	W03
	.byte		v094
	.byte	W03
	.byte		v097
	.byte	W03
	.byte		v101
	.byte	W03
	.byte		v105
	.byte	W03
	.byte		v110
	.byte	W32
	.byte	W03
	.byte		EOT	
	.byte	W01
	.byte	VOL	, v110
	.byte	W84
	.byte		N80	, As3
	.byte	W06
	.byte	VOL	, v099
	.byte	W03
	.byte		v081
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v054
	.byte	W03
	.byte		v058
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v065
	.byte	W03
	.byte		v069
	.byte	W03
	.byte		v072
	.byte	W03
	.byte		v076
	.byte	W03
	.byte		v080
	.byte	W03
	.byte		v084
	.byte	W03
	.byte		v086
	.byte	W03
	.byte		v090
	.byte	W03
	.byte		v094
	.byte	W03
	.byte		v097
	.byte	W03
	.byte		v101
	.byte	W03
	.byte		v105
	.byte	W03
	.byte		v110
	.byte	W11
	.byte		N22	, As3, v127
	.byte	W24
	.byte	W01
	.byte		N18	, An3
	.byte	W17
	.byte		N06	, Gn3, v060
	.byte	W04
	.byte		N05	, Fn3, v052
	.byte	W04
	.byte		N03	, En3, v076
	.byte	W03
	.byte		N02	, Dn3, v084
	.byte	W03
	.byte			Cn3, v068
	.byte	W03
	.byte			Bn2
	.byte	W02
	.byte			An2, v084
	.byte	W02
	.byte			Gn2, v068
	.byte	W02
	.byte		N03	, Fn2, v060
	.byte	W02
	.byte			En2, v044
	.byte	W54
	.byte	W96
	.byte	W24
	.byte	W03
	.byte	VOL	, v046
	.byte	W03
	.byte		v049
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v055
	.byte		N56	, As3, v112
	.byte	W03
	.byte	VOL	, v058
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v064
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v071
	.byte	W03
	.byte		v073
	.byte	W03
	.byte		v077
	.byte	W03
	.byte		v080
	.byte	W03
	.byte		v083
	.byte	W03
	.byte		v086
	.byte	W03
	.byte		v089
	.byte	W03
	.byte		v092
	.byte	W03
	.byte		v095
	.byte	W03
	.byte		v098
	.byte	W03
	.byte		v101
	.byte	W03
	.byte		v104
	.byte	W03
	.byte		v107
	.byte	W03
	.byte		v099
	.byte	W03
	.byte		v081
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v041
	.byte	W21
	.byte		v042
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v053
	.byte		N56	, Bn3
	.byte	W03
	.byte	VOL	, v057
	.byte	W03
	.byte		v060
	.byte	W03
	.byte		v064
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v071
	.byte	W03
	.byte		v073
	.byte	W03
	.byte		v077
	.byte	W03
	.byte		v080
	.byte	W03
	.byte		v084
	.byte	W03
	.byte		v087
	.byte	W03
	.byte		v090
	.byte	W03
	.byte		v094
	.byte	W03
	.byte		v097
	.byte	W03
	.byte		v101
	.byte	W03
	.byte		v103
	.byte	W03
	.byte		v107
	.byte	W03
	.byte		v110
	.byte	W09
	.byte		TIE	, Cn4
	.byte	W09
	.byte	VOL	, v095
	.byte	W03
	.byte		v076
	.byte	W03
	.byte		v056
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v033
	.byte	W06
	.byte		v034
	.byte	W03
	.byte		v035
	.byte	W03
	.byte		v036
	.byte	W03
	.byte		v037
	.byte	W03
	.byte		v038
	.byte	W03
	.byte		v039
	.byte	W03
	.byte		v040
	.byte	W03
	.byte		v041
	.byte	W03
	.byte		v042
	.byte	W03
	.byte		v043
	.byte	W03
	.byte		v044
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v045
	.byte	W03
	.byte		v046
	.byte	W03
	.byte		v048
	.byte	W03
	.byte		v049
	.byte	W03
	.byte		v050
	.byte	W03
	.byte		v051
	.byte	W03
	.byte		v051
	.byte	W03
	.byte		v052
	.byte	W03
	.byte		v053
	.byte	W03
	.byte		v054
	.byte	W03
	.byte		v055
	.byte	W03
	.byte		v057
	.byte	W03
	.byte		v058
	.byte	W03
	.byte		v058
	.byte	W03
	.byte		v059
	.byte	W03
	.byte		v060
	.byte	W03
	.byte		v061
	.byte	W03
	.byte		v062
	.byte	W03
	.byte		v063
	.byte	W03
	.byte		v064
	.byte	W03
	.byte		v065
	.byte	W03
	.byte		v066
	.byte	W03
	.byte		v067
	.byte	W03
	.byte		v068
	.byte	W03
	.byte		v069
	.byte	W03
	.byte		v070
	.byte	W03
	.byte		v071
	.byte	W03
	.byte		v071
	.byte	W03
	.byte		v072
	.byte	W03
	.byte		v074
	.byte	W03
	.byte		v075
	.byte	W03
	.byte		v076
	.byte	W03
	.byte		v077
	.byte	W03
	.byte		v077
	.byte	W03
	.byte		v078
	.byte	W03
	.byte		v079
	.byte	W03
	.byte		v080
	.byte	W03
	.byte		v081
	.byte	W03
	.byte		v083
	.byte	W03
	.byte		v084
	.byte	W03
	.byte		v084
	.byte	W03
	.byte		v085
	.byte	W03
	.byte		v086
	.byte	W03
	.byte		v087
	.byte	W03
	.byte		v088
	.byte	W03
	.byte		v089
	.byte	W03
	.byte		v090
	.byte	W03
	.byte		v091
	.byte	W03
	.byte		v092
	.byte	W03
	.byte		v093
	.byte	W03
	.byte		v094
	.byte	W03
	.byte		v095
	.byte	W03
	.byte		v096
	.byte	W03
	.byte		v097
	.byte	W03
	.byte		v097
	.byte	W03
	.byte		v098
	.byte	W03
	.byte		v100
	.byte	W03
	.byte		v101
	.byte	W03
	.byte		v102
	.byte	W03
	.byte		v103
	.byte	W03
	.byte		v103
	.byte	W03
	.byte		v104
	.byte	W03
	.byte		v105
	.byte	W03
	.byte		v106
	.byte	W03
	.byte		v107
	.byte	W03
	.byte		v109
	.byte	W03
	.byte		v110
	.byte	W24
	.byte	W02
	.byte		EOT	
	.byte	W01
	.byte	W12
	.byte		N05	, Gn3, v108
	.byte	W06
	.byte			Gn3, v120
	.byte	W06
	.byte			Gn3, v112
	.byte	W06
	.byte			Gn3, v120
	.byte	W12
	.byte			An3
	.byte	W12
	.byte			An3, v124
	.byte	W12
	.byte			Fn3, v116
	.byte	W06
	.byte		N11	, Fn3, v112
	.byte	W12
	.byte		N05	, Ds3, v127
	.byte	W12
	.byte	GOTO	
		.word	song0023_14_1
	.byte	FINE

	.align 2
	.global song0023
song0023:	@ 0x08C669D8
	.byte	14		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	128		@ reverb

	.word	voicegroup014		@ voicegroup/tone

	.word	song0023_1		@ track
	.word	song0023_2		@ track
	.word	song0023_3		@ track
	.word	song0023_4		@ track
	.word	song0023_5		@ track
	.word	song0023_6		@ track
	.word	song0023_7		@ track
	.word	song0023_8		@ track
	.word	song0023_9		@ track
	.word	song0023_10		@ track
	.word	song0023_11		@ track
	.word	song0023_12		@ track
	.word	song0023_13		@ track
	.word	song0023_14		@ track
