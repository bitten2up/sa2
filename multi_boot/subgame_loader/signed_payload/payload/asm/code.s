.include "../../../../asm/macros/function.inc"
.include "../../../../constants/gba_constants.inc"

.syntax unified
.arm

	thumb_func_start sub_0203b26c
sub_0203b26c: @ 0x0203B26C
	push {lr}
	sub sp, #0x18
	mov r0, sp
	bl sub_0203b530
_0203B276:
	bl VBlankIntrWait
	mov r0, sp
	ldrh r0, [r0, #0xa]
	cmp r0, #5
	bhi _0203B2E8
	lsls r0, r0, #2
	ldr r1, _0203B28C @ =_0203B290
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0203B28C: .4byte _0203B290
_0203B290: @ jump table
	.4byte _0203B2A8 @ case 0
	.4byte _0203B2A8 @ case 1
	.4byte _0203B2B4 @ case 2
	.4byte _0203B2C2 @ case 3
	.4byte _0203B2CE @ case 4
	.4byte _0203B2DA @ case 5
_0203B2A8:
	mov r0, sp
	ldrh r0, [r0, #0xa]
	mov r1, sp
	bl sub_0203b2f0
	b _0203B2E4
_0203B2B4:
	mov r0, sp
	ldrh r0, [r0, #0xa]
	mov r1, sp
	bl sub_0203b79c
	mov r1, sp
	strh r0, [r1, #0xa]
_0203B2C2:
	mov r0, sp
	ldrh r0, [r0, #0xa]
	mov r1, sp
	bl sub_0203b7d0
	b _0203B2E4
_0203B2CE:
	mov r0, sp
	ldrh r0, [r0, #0xa]
	mov r1, sp
	bl sub_0203b3d8
	b _0203B2E4
_0203B2DA:
	mov r0, sp
	ldrh r0, [r0, #0xa]
	mov r1, sp
	bl sub_0203b818
_0203B2E4:
	mov r1, sp
	strh r0, [r1, #0xa]
_0203B2E8:
	mov r0, sp
	bl sub_0203b898
	b _0203B276

	thumb_func_start sub_0203b2f0
sub_0203b2f0: @ 0x0203B2F0
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r3, _0203B330 @ =0x04000208
	movs r5, #0
	strh r5, [r3]
	ldr r2, _0203B334 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203B338 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _0203B33C @ =gUnknown_03000000
	ldr r0, _0203B340 @ =gUnknown_030004C0
	str r0, [r1]
	ldr r4, _0203B344 @ =gUnknown_03000090
	ldr r0, [r4]
	movs r1, #0xf0
	lsls r1, r1, #4
	ands r0, r1
	lsrs r0, r0, #8
	bl sub_0203b8c4
	movs r0, #0
	strb r5, [r6, #0x15]
	str r0, [r4]
	cmp r7, #0
	bne _0203B348
	movs r7, #3
	b _0203B3C8
	.align 2, 0
_0203B330: .4byte 0x04000208
_0203B334: .4byte 0x04000200
_0203B338: .4byte 0x0000FF3F
_0203B33C: .4byte gUnknown_03000000
_0203B340: .4byte gUnknown_030004C0
_0203B344: .4byte gUnknown_03000090
_0203B348:
	movs r7, #2
	ldrh r0, [r6, #0x10]
	subs r1, r0, #2
	adds r2, r0, #0
	cmp r1, #5
	bhi _0203B3C8
	lsls r0, r1, #2
	ldr r1, _0203B360 @ =_0203B364
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0203B360: .4byte _0203B364
_0203B364: @ jump table
	.4byte _0203B37C @ case 0
	.4byte _0203B38C @ case 1
	.4byte _0203B3A0 @ case 2
	.4byte _0203B3A0 @ case 3
	.4byte _0203B3A0 @ case 4
	.4byte _0203B3BC @ case 5
_0203B37C:
	ldr r0, _0203B388 @ =gUnknown_02020000
	movs r1, #0x80
	lsls r1, r1, #0x12
	bl LZ77UnCompWram
	b _0203B3C8
	.align 2, 0
_0203B388: .4byte gUnknown_02020000
_0203B38C:
	ldr r0, _0203B39C @ =gUnknown_02020000
	movs r1, #0xc0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #7
	bl CpuSet
	b _0203B3C8
	.align 2, 0
_0203B39C: .4byte gUnknown_02020000
_0203B3A0:
	ldrb r1, [r6, #0x14]
	subs r0, r2, #3
	cmp r1, r0
	bne _0203B3C8
	ldr r0, _0203B3B4 @ =0x02033000
	ldr r1, _0203B3B8 @ =gUnknown_02020000
	bl LZ77UnCompWram
	b _0203B3C8
	.align 2, 0
_0203B3B4: .4byte 0x02033000
_0203B3B8: .4byte gUnknown_02020000
_0203B3BC:
	ldr r0, _0203B3D0 @ =0x02033000
	ldr r1, _0203B3D4 @ =0x06010000
	movs r2, #0xa0
	lsls r2, r2, #6
	bl CpuSet
_0203B3C8:
	adds r0, r7, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0203B3D0: .4byte 0x02033000
_0203B3D4: .4byte 0x06010000

	thumb_func_start sub_0203b3d8
sub_0203b3d8: @ 0x0203B3D8
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r1, #0
	ldr r4, _0203B424 @ =0x080000A0
	ldr r1, _0203B428 @ =gUnknown_0203C23C
	mov r0, sp
	movs r2, #0xd
	bl memcpy
	ldr r0, _0203B42C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	strb r0, [r5, #0x14]
	movs r0, #1
	strb r0, [r5, #0x12]
	bl sub_0203bd28
	ldrh r0, [r5, #0x10]
	cmp r0, #9
	bne _0203B4CA
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r0, _0203B430 @ =0x080000B2
	ldrb r0, [r0]
	cmp r0, #0x96
	bne _0203B45E
	ldr r0, _0203B434 @ =0x080000AC
	ldr r1, [r0]
	ldr r0, _0203B438 @ =0x454E3241
	cmp r1, r0
	bne _0203B45E
	movs r2, #0
	mov r1, sp
	ldrb r0, [r4]
	b _0203B44E
	.align 2, 0
_0203B424: .4byte 0x080000A0
_0203B428: .4byte gUnknown_0203C23C
_0203B42C: .4byte 0x04000128
_0203B430: .4byte 0x080000B2
_0203B434: .4byte 0x080000AC
_0203B438: .4byte 0x454E3241
_0203B43C:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xb
	bhi _0203B454
	adds r0, r4, r2
	mov r3, sp
	adds r1, r3, r2
	ldrb r0, [r0]
_0203B44E:
	ldrb r1, [r1]
	cmp r0, r1
	beq _0203B43C
_0203B454:
	cmp r2, #0xc
	bne _0203B45E
	movs r0, #0xc0
	bl SoftResetRom
_0203B45E:
	movs r0, #0xf6
	bl RegisterRamReset
	ldr r1, _0203B504 @ =0x040000B0
	ldrh r2, [r1, #0xa]
	ldr r4, _0203B508 @ =0x0000C5FF
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	ldr r3, _0203B50C @ =0x00007FFF
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	adds r1, #0xc
	ldrh r2, [r1, #0xa]
	adds r0, r4, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r2, [r1, #0xa]
	adds r0, r3, #0
	ands r0, r2
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #0xa]
	ldr r0, _0203B510 @ =0x040000D4
	ldrh r1, [r0, #0xa]
	ands r4, r1
	strh r4, [r0, #0xa]
	ldrh r1, [r0, #0xa]
	ands r3, r1
	strh r3, [r0, #0xa]
	ldrh r0, [r0, #0xa]
	ldr r0, _0203B514 @ =0x04000208
	movs r1, #0
	strh r1, [r0]
	subs r0, #8
	strh r1, [r0]
	ldr r0, _0203B518 @ =0x04000004
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x12
	bl _call_via_r0
_0203B4CA:
	ldr r3, _0203B514 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0203B51C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203B520 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _0203B524 @ =gUnknown_03000000
	ldr r0, _0203B528 @ =sub_0203bf5c
	str r0, [r1]
	ldr r1, _0203B52C @ =gUnknown_0203C280
	ldrh r0, [r5, #0x10]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0
	bl sub_0203c024
	adds r0, r5, #0
	bl sub_0203b610
	movs r0, #5
	add sp, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0203B504: .4byte 0x040000B0
_0203B508: .4byte 0x0000C5FF
_0203B50C: .4byte 0x00007FFF
_0203B510: .4byte 0x040000D4
_0203B514: .4byte 0x04000208
_0203B518: .4byte 0x04000004
_0203B51C: .4byte 0x04000200
_0203B520: .4byte 0x0000FF3F
_0203B524: .4byte gUnknown_03000000
_0203B528: .4byte sub_0203bf5c
_0203B52C: .4byte gUnknown_0203C280

	thumb_func_start sub_0203b530
sub_0203b530: @ 0x0203B530
	push {lr}
	sub sp, #4
	movs r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	movs r3, #0
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	ldr r1, _0203B5C8 @ =gUnknown_030004A2
	str r1, [r0, #0xc]
	strh r2, [r0, #0x10]
	strb r3, [r0, #0x12]
	strb r3, [r0, #0x13]
	strb r3, [r0, #0x14]
	strb r3, [r0, #0x15]
	strb r3, [r0, #0x16]
	movs r0, #2
	bl RegisterRamReset
	ldr r1, _0203B5CC @ =0x040000D4
	ldr r0, _0203B5D0 @ =gUnknown_0203C208
	str r0, [r1]
	ldr r0, _0203B5D4 @ =gUnknown_03000000
	str r0, [r1, #4]
	ldr r0, _0203B5D8 @ =0x8400000D
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0203B5DC @ =sub_0203b03c
	str r0, [r1]
	ldr r2, _0203B5E0 @ =gUnknown_030000A0
	str r2, [r1, #4]
	ldr r0, _0203B5E4 @ =0x84000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r0, _0203B5E8 @ =gUnknown_03007FFC
	str r2, [r0]
	movs r0, #0xa0
	str r0, [sp]
	mov r0, sp
	str r0, [r1]
	movs r0, #0xe0
	lsls r0, r0, #0x13
	str r0, [r1, #4]
	ldr r0, _0203B5EC @ =0x85000100
	str r0, [r1, #8]
	ldr r0, [r1, #8]
	ldr r2, _0203B5F0 @ =0x04000200
	movs r0, #1
	strh r0, [r2]
	ldr r0, _0203B5F4 @ =0x080000B2
	ldrb r0, [r0]
	cmp r0, #0x96
	bne _0203B5B0
	ldr r0, _0203B5F8 @ =0x080000AC
	ldr r1, [r0]
	ldr r0, _0203B5FC @ =0x454E3241
	cmp r1, r0
	bne _0203B5B0
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_0203B5B0:
	ldr r1, _0203B600 @ =0x04000004
	movs r0, #8
	strh r0, [r1]
	ldr r1, _0203B604 @ =0x04000208
	movs r0, #1
	strh r0, [r1]
	ldr r1, _0203B608 @ =gUnknown_030004A0
	ldr r0, _0203B60C @ =0x0000F001
	strh r0, [r1]
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0203B5C8: .4byte gUnknown_030004A2
_0203B5CC: .4byte 0x040000D4
_0203B5D0: .4byte gUnknown_0203C208
_0203B5D4: .4byte gUnknown_03000000
_0203B5D8: .4byte 0x8400000D
_0203B5DC: .4byte sub_0203b03c
_0203B5E0: .4byte gUnknown_030000A0
_0203B5E4: .4byte 0x84000100
_0203B5E8: .4byte gUnknown_03007FFC
_0203B5EC: .4byte 0x85000100
_0203B5F0: .4byte 0x04000200
_0203B5F4: .4byte 0x080000B2
_0203B5F8: .4byte 0x080000AC
_0203B5FC: .4byte 0x454E3241
_0203B600: .4byte 0x04000004
_0203B604: .4byte 0x04000208
_0203B608: .4byte gUnknown_030004A0
_0203B60C: .4byte 0x0000F001

	thumb_func_start sub_0203b610
sub_0203b610: @ 0x0203B610
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrb r2, [r5, #0x16]
	cmp r2, #0
	beq _0203B61E
	b _0203B73E
_0203B61E:
	ldr r1, _0203B694 @ =0x04000008
	ldr r3, _0203B698 @ =0x0000170B
	adds r0, r3, #0
	strh r0, [r1]
	ldr r0, _0203B69C @ =0x04000010
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	ldr r0, _0203B6A0 @ =gUnknown_0203EBC0
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuSet
	ldr r0, _0203B6A4 @ =gUnknown_0203EDC0
	ldr r1, _0203B6A8 @ =0x06008000
	movs r2, #0x94
	lsls r2, r2, #2
	bl CpuSet
	movs r4, #0
_0203B64A:
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _0203B6AC @ =gUnknown_0203F260
	adds r0, r0, r1
	lsls r1, r4, #6
	ldr r2, _0203B6B0 @ =0x0600B800
	adds r1, r1, r2
	movs r2, #0x1e
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x13
	bls _0203B64A
	ldr r0, _0203B6B4 @ =0x0400000A
	ldr r3, _0203B6B8 @ =0x00001F0E
	adds r1, r3, #0
	strh r1, [r0]
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _0203B6C8
	ldr r1, _0203B6BC @ =0x04000014
	ldr r2, _0203B6C0 @ =0x0000FFE8
	adds r0, r2, #0
	strh r0, [r1]
	ldr r2, _0203B6C4 @ =0x04000016
	ldrb r1, [r5, #0x13]
	subs r1, #1
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	subs r0, #0x30
	strh r0, [r2]
	b _0203B6D4
	.align 2, 0
_0203B694: .4byte 0x04000008
_0203B698: .4byte 0x0000170B
_0203B69C: .4byte 0x04000010
_0203B6A0: .4byte gUnknown_0203EBC0
_0203B6A4: .4byte gUnknown_0203EDC0
_0203B6A8: .4byte 0x06008000
_0203B6AC: .4byte gUnknown_0203F260
_0203B6B0: .4byte 0x0600B800
_0203B6B4: .4byte 0x0400000A
_0203B6B8: .4byte 0x00001F0E
_0203B6BC: .4byte 0x04000014
_0203B6C0: .4byte 0x0000FFE8
_0203B6C4: .4byte 0x04000016
_0203B6C8:
	ldr r0, _0203B748 @ =0x04000014
	ldr r3, _0203B74C @ =0x0000FFE8
	adds r1, r3, #0
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
_0203B6D4:
	ldr r0, _0203B750 @ =gUnknown_0203C4A4
	ldr r1, _0203B754 @ =0x0600C000
	ldr r2, _0203B758 @ =0x000011D0
	bl CpuSet
	movs r4, #0
_0203B6E0:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	ldr r1, _0203B75C @ =gUnknown_0203E844
	adds r0, r0, r1
	lsls r1, r4, #6
	ldr r2, _0203B760 @ =0x0600F800
	adds r1, r1, r2
	movs r2, #0x18
	bl CpuSet
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0x11
	bls _0203B6E0
	ldr r1, _0203B764 @ =0x04000040
	ldr r3, _0203B768 @ =0x000018D8
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _0203B76C @ =0x00003048
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #4
	movs r0, #2
	strh r0, [r1]
	ldr r0, _0203B770 @ =0x0400004A
	movs r4, #1
	strh r4, [r0]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r1, _0203B774 @ =0x05000022
	ldr r2, _0203B778 @ =0x0100000F
	mov r0, sp
	bl CpuSet
	ldr r1, _0203B77C @ =0x04000042
	ldr r3, _0203B780 @ =0x00002828
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #4
	ldr r2, _0203B784 @ =0x00005058
	adds r0, r2, #0
	strh r0, [r1]
	strb r4, [r5, #0x16]
_0203B73E:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0203B748: .4byte 0x04000014
_0203B74C: .4byte 0x0000FFE8
_0203B750: .4byte gUnknown_0203C4A4
_0203B754: .4byte 0x0600C000
_0203B758: .4byte 0x000011D0
_0203B75C: .4byte gUnknown_0203E844
_0203B760: .4byte 0x0600F800
_0203B764: .4byte 0x04000040
_0203B768: .4byte 0x000018D8
_0203B76C: .4byte 0x00003048
_0203B770: .4byte 0x0400004A
_0203B774: .4byte 0x05000022
_0203B778: .4byte 0x0100000F
_0203B77C: .4byte 0x04000042
_0203B780: .4byte 0x00002828
_0203B784: .4byte 0x00005058
	thumb_func_start sub_0203b788
sub_0203b788: @ 0x0203B788
	ldr r0, _0203B794 @ =0x03007FF8
	ldrh r1, [r0]
	movs r2, #1
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_0203B794: .4byte 0x03007FF8
_0203B798:
	.byte 0x70, 0x47, 0x00, 0x00

	thumb_func_start sub_0203b79c
sub_0203b79c: @ 0x0203B79C
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0203B7CC @ =gUnknown_03000090
	ldr r2, [r0]
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _0203B7C0
	movs r0, #0x40
	ands r2, r0
	cmp r2, #0
	beq _0203B7BE
	ldr r1, [r1, #0xc]
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0203B7BE:
	movs r4, #3
_0203B7C0:
	bl sub_0203bd0c
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0203B7CC: .4byte gUnknown_03000090

	thumb_func_start sub_0203b7d0
sub_0203b7d0: @ 0x0203B7D0
	push {r4, r5, r6, r7, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r7, _0203B80C @ =gUnknown_03000090
	ldr r0, [r7]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0203B7E6
	movs r6, #4
_0203B7E6:
	ldr r0, _0203B810 @ =gUnknown_030004A0
	ldr r4, _0203B814 @ =gUnknown_03000040
	ldrb r2, [r5, #0x15]
	adds r1, r4, #0
	bl sub_0203b9b8
	str r0, [r7]
	ldrh r0, [r4]
	strb r0, [r5, #0x13]
	ldrb r1, [r4, #2]
	ldrh r0, [r5, #0x10]
	cmp r0, r1
	beq _0203B802
	strh r1, [r5, #0x10]
_0203B802:
	adds r0, r6, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0203B80C: .4byte gUnknown_03000090
_0203B810: .4byte gUnknown_030004A0
_0203B814: .4byte gUnknown_03000040

	thumb_func_start sub_0203b818
sub_0203b818: @ 0x0203B818
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r0, #0
	str r0, [sp]
	mov r0, sp
	bl sub_0203bd78
	cmp r0, #0
	beq _0203B832
	movs r5, #1
_0203B832:
	ldr r3, [sp]
	ldr r1, [r4, #4]
	adds r2, r3, #0
	cmp r2, r1
	bls _0203B848
	subs r1, r2, r1
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	str r2, [r4, #4]
	b _0203B85C
_0203B848:
	cmp r3, r1
	bhs _0203B85C
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r0, r2
	subs r0, r0, r1
	adds r0, r0, r3
	str r0, [r4]
	str r3, [r4, #4]
_0203B85C:
	adds r0, r4, #0
	bl sub_0203b86c
	adds r0, r5, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0203b86c
sub_0203b86c: @ 0x0203B86C
	push {lr}
	ldr r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #5
	movs r1, #0x90
	lsls r1, r1, #9
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r2, _0203B894 @ =0x04000042
	adds r0, #0x28
	movs r3, #0xa0
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0203B894: .4byte 0x04000042

	thumb_func_start sub_0203b898
sub_0203b898: @ 0x0203B898
	push {lr}
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _0203B8B8
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r2, #0xc6
	lsls r2, r2, #7
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0x48
	movs r0, #2
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	b _0203B8BE
_0203B8B8:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0x80
_0203B8BE:
	strh r0, [r1]
	pop {r0}
	bx r0

	thumb_func_start sub_0203b8c4
sub_0203b8c4: @ 0x0203B8C4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r3, _0203B984 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _0203B988 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203B98C @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r0, _0203B990 @ =0x04000134
	strh r4, [r0]
	subs r2, #0xd8
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r2]
	ldrh r0, [r2]
	ldr r3, _0203B994 @ =0x00004003
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0
	str r0, [sp]
	ldr r4, _0203B998 @ =gMultiSioArea
	ldr r2, _0203B99C @ =0x0500007A
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r0, _0203B9A0 @ =MultiSioRecvBufChange
	ldr r1, _0203B9A4 @ =gUnknown_030007D0
	ldr r2, _0203B9A8 @ =0x04000010
	bl CpuSet
	ldr r0, _0203B9AC @ =MultiSioIntr
	ldr r1, _0203B9B0 @ =gUnknown_030004C0
	ldr r2, _0203B9B4 @ =0x04000048
	bl CpuSet
	strb r5, [r4, #2]
	movs r0, #0xd
	str r0, [r4, #0x14]
	adds r0, r4, #0
	adds r0, #0x60
	str r0, [r4, #0x28]
	adds r0, #0x1c
	str r0, [r4, #0x2c]
	movs r3, #0
	adds r2, r4, #0
	movs r0, #0x30
	adds r0, r0, r2
	mov ip, r0
	adds r6, r2, #0
	adds r6, #0xd0
	adds r7, r2, #0
	adds r7, #0x40
	adds r5, r2, #0
	adds r5, #0x98
	movs r4, #0
_0203B940:
	lsls r0, r3, #2
	mov r1, ip
	adds r1, #4
	mov ip, r1
	subs r1, #4
	stm r1!, {r5}
	adds r1, r2, #0
	adds r1, #0xb4
	adds r1, r4, r1
	stm r7!, {r1}
	adds r1, r2, #0
	adds r1, #0x50
	adds r0, r0, r1
	str r6, [r0]
	adds r6, #0x54
	adds r5, #0x54
	adds r4, #0x54
	adds r3, #1
	cmp r3, #3
	ble _0203B940
	ldr r3, _0203B984 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0203B988 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0203B984: .4byte 0x04000208
_0203B988: .4byte 0x04000200
_0203B98C: .4byte 0x0000FF3F
_0203B990: .4byte 0x04000134
_0203B994: .4byte 0x00004003
_0203B998: .4byte gMultiSioArea
_0203B99C: .4byte 0x0500007A
_0203B9A0: .4byte MultiSioRecvBufChange
_0203B9A4: .4byte gUnknown_030007D0
_0203B9A8: .4byte 0x04000010
_0203B9AC: .4byte MultiSioIntr
_0203B9B0: .4byte gUnknown_030004C0
_0203B9B4: .4byte 0x04000048

	thumb_func_start sub_0203b9b8
sub_0203b9b8: @ 0x0203B9B8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	mov ip, r1
	mov r8, r2
	ldr r5, _0203B9D8 @ =0x04000128
	ldr r6, [r5]
	ldr r7, _0203B9DC @ =gMultiSioArea
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0203B9E0
	cmp r0, #1
	beq _0203BA48
	b _0203BA56
	.align 2, 0
_0203B9D8: .4byte 0x04000128
_0203B9DC: .4byte gMultiSioArea
_0203B9E0:
	movs r1, #0x30
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _0203BA42
	movs r0, #0x88
	adds r4, r6, #0
	ands r4, r0
	cmp r4, #8
	bne _0203BA56
	movs r1, #4
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #0
	bne _0203BA42
	ldr r0, [r7, #0x14]
	cmp r0, #0xd
	bne _0203BA42
	ldr r3, _0203BA88 @ =0x04000208
	strh r1, [r3]
	ldr r2, _0203BA8C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203BA90 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldrb r1, [r5, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5, #1]
	ldr r1, _0203BA94 @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #0xf6
	ldr r0, _0203BA98 @ =0x0000BBBC
	str r0, [r1]
	strb r4, [r7]
	ldrb r0, [r5]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r5]
_0203BA42:
	ldr r1, _0203BA9C @ =gMultiSioArea
	movs r0, #1
	strb r0, [r1, #1]
_0203BA48:
	mov r0, ip
	bl sub_0203bba0
	mov r0, sb
	mov r1, r8
	bl sub_0203bad0
_0203BA56:
	ldr r1, _0203BA9C @ =gMultiSioArea
	ldrb r0, [r1, #0xb]
	adds r0, #1
	strb r0, [r1, #0xb]
	ldrb r3, [r1, #3]
	ldrb r2, [r1, #8]
	movs r0, #0x10
	ands r0, r2
	orrs r3, r0
	movs r0, #0x20
	ands r0, r2
	orrs r3, r0
	movs r0, #0x40
	ands r0, r2
	orrs r3, r0
	ldrb r0, [r1, #2]
	lsls r2, r0, #8
	ldrb r0, [r1]
	cmp r0, #8
	bne _0203BAA0
	movs r0, #0x80
	orrs r0, r2
	orrs r0, r3
	b _0203BAA4
	.align 2, 0
_0203BA88: .4byte 0x04000208
_0203BA8C: .4byte 0x04000200
_0203BA90: .4byte 0x0000FF7F
_0203BA94: .4byte 0x04000202
_0203BA98: .4byte 0x0000BBBC
_0203BA9C: .4byte gMultiSioArea
_0203BAA0:
	adds r0, r3, #0
	orrs r0, r2
_0203BAA4:
	adds r2, r0, #0
	ldrb r0, [r1, #9]
	cmp r0, #0
	beq _0203BAB2
	movs r0, #0x80
	lsls r0, r0, #5
	orrs r2, r0
_0203BAB2:
	adds r1, r2, #0
	lsls r0, r6, #0x1a
	lsrs r0, r0, #0x1e
	cmp r0, #3
	bls _0203BAC2
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
_0203BAC2:
	adds r0, r1, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0203bad0
sub_0203bad0: @ 0x0203BAD0
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	ldr r5, _0203BB90 @ =gMultiSioArea
	ldr r4, [r5, #0x28]
	movs r2, #1
	ands r1, r2
	lsls r1, r1, #4
	ldrb r3, [r4, #1]
	movs r2, #0x11
	rsbs r2, r2, #0
	ands r2, r3
	orrs r2, r1
	strb r2, [r4, #1]
	ldr r6, [r5, #0x28]
	ldr r1, _0203BB94 @ =gUnknown_03000810
	ldrb r1, [r1, #3]
	movs r3, #1
	adds r2, r3, #0
	ands r2, r1
	lsls r2, r2, #5
	ldrb r4, [r6, #1]
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r4
	orrs r1, r2
	strb r1, [r6, #1]
	ldr r4, [r5, #0x28]
	ldrb r1, [r5, #8]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1f
	ands r3, r1
	lsls r3, r3, #6
	ldrb r2, [r4, #1]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r3
	strb r1, [r4, #1]
	ldr r2, [r5, #0x28]
	ldrb r1, [r5, #0xb]
	strb r1, [r2]
	ldr r4, [r5, #0x28]
	ldrb r2, [r5, #2]
	ldrb r1, [r5, #3]
	eors r2, r1
	movs r1, #0xf
	ands r2, r1
	ldrb r3, [r4, #1]
	movs r1, #0x10
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r2
	strb r1, [r4, #1]
	ldr r1, [r5, #0x28]
	strh r7, [r1, #2]
	ldr r1, [r5, #0x28]
	adds r1, #4
	ldr r2, _0203BB98 @ =0x04000005
	bl CpuSet
	movs r2, #0
	ldr r1, [r5, #0x28]
_0203BB4C:
	ldrh r0, [r1]
	adds r7, r7, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #0xb
	bls _0203BB4C
	adds r2, r5, #0
	ldr r1, [r2, #0x28]
	mvns r0, r7
	strh r0, [r1, #2]
	ldrb r0, [r2]
	cmp r0, #0
	beq _0203BB6C
	ldr r1, _0203BB9C @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
_0203BB6C:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x14]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0203BB88
	ldrb r1, [r5, #8]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0203BB88
	ldr r1, _0203BB9C @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_0203BB88:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0203BB90: .4byte gMultiSioArea
_0203BB94: .4byte gUnknown_03000810
_0203BB98: .4byte 0x04000005
_0203BB9C: .4byte 0x0400010E

	thumb_func_start sub_0203bba0
sub_0203bba0: @ 0x0203BBA0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, _0203BCAC @ =gUnknown_030007D0
	movs r4, #0
	str r4, [sp]
	bl _call_via_r0
	str r0, [sp, #4]
	ldr r0, _0203BCB0 @ =gMultiSioArea
	strb r4, [r0, #3]
	add r1, sp, #4
	mov sl, r1
	add r2, sp, #8
	mov sb, r2
	adds r5, r0, #0
	adds r6, r5, #0
	movs r7, #0x50
	adds r7, r7, r6
	mov r8, r7
_0203BBD0:
	movs r3, #0
	movs r2, #0
	lsls r5, r4, #2
	adds r0, r4, #1
	str r0, [sp, #0x10]
	mov r1, r8
	adds r0, r5, r1
	ldr r1, [r0]
_0203BBE0:
	ldrh r0, [r1]
	adds r3, r3, r0
	adds r1, #2
	adds r2, #1
	cmp r2, #0xb
	bls _0203BBE0
	mov r2, sl
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0203BC42
	lsls r0, r3, #0x10
	asrs r0, r0, #0x10
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, r7
	bne _0203BC42
	movs r0, #1
	lsls r0, r4
	ldrb r1, [r6, #3]
	orrs r0, r1
	strb r0, [r6, #3]
	ldrb r2, [r6, #8]
	lsls r1, r2, #0x1c
	lsrs r1, r1, #0x1c
	mov r0, r8
	adds r3, r5, r0
	ldr r0, [r3]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	lsls r0, r4
	orrs r0, r1
	movs r1, #0xf
	ands r0, r1
	subs r7, #0xf
	adds r1, r7, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r6, #8]
	ldr r0, [r3]
	adds r0, #4
	adds r1, r5, r4
	lsls r1, r1, #2
	ldr r2, [sp, #0xc]
	adds r1, r2, r1
	ldr r2, _0203BCB4 @ =0x04000005
	bl CpuSet
_0203BC42:
	movs r0, #0
	str r0, [sp, #8]
	mov r7, r8
	adds r0, r5, r7
	ldr r1, [r0]
	adds r1, #4
	mov r0, sb
	ldr r2, _0203BCB8 @ =0x05000005
	bl CpuSet
	ldr r4, [sp, #0x10]
	cmp r4, #3
	ble _0203BBD0
	ldr r0, _0203BCB0 @ =gMultiSioArea
	ldrb r1, [r0, #2]
	ldrb r2, [r0, #3]
	adds r3, r1, #0
	orrs r3, r2
	strb r3, [r0, #2]
	movs r1, #1
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _0203BCF8
	ldrb r0, [r5]
	cmp r0, #8
	bne _0203BCBC
	movs r0, #3
	ands r0, r2
	cmp r0, #0
	beq _0203BC90
	lsls r0, r2, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r3
	bne _0203BC90
	ldrb r0, [r5, #8]
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5, #8]
_0203BC90:
	ldrb r4, [r5, #8]
	lsls r2, r4, #0x1c
	lsrs r2, r2, #0x1c
	movs r0, #0xe
	ldrb r3, [r5, #2]
	adds r1, r0, #0
	ands r1, r2
	ands r0, r3
	cmp r1, r0
	bne _0203BCDC
	movs r0, #0x40
	orrs r0, r4
	b _0203BCDA
	.align 2, 0
_0203BCAC: .4byte gUnknown_030007D0
_0203BCB0: .4byte gMultiSioArea
_0203BCB4: .4byte 0x04000005
_0203BCB8: .4byte 0x05000005
_0203BCBC:
	ldrb r2, [r5, #8]
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x1f
	ldr r0, [r5, #0x50]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1f
	orrs r1, r0
	movs r0, #1
	ands r1, r0
	lsls r1, r1, #6
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
_0203BCDA:
	strb r0, [r5, #8]
_0203BCDC:
	ldrb r2, [r5, #8]
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1f
	ldr r0, [r5, #0x50]
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1f
	orrs r0, r1
	lsls r0, r0, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r5, #8]
_0203BCF8:
	ldrb r0, [r5, #3]
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0203bd0c
sub_0203bd0c: @ 0x0203BD0C
	push {lr}
	ldr r2, _0203BD24 @ =gMultiSioArea
	ldrb r0, [r2]
	cmp r0, #0
	beq _0203BD1E
	ldrb r0, [r2, #8]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #8]
_0203BD1E:
	pop {r0}
	bx r0
	.align 2, 0
_0203BD24: .4byte gMultiSioArea

	thumb_func_start sub_0203bd28
sub_0203bd28: @ 0x0203BD28
	ldr r3, _0203BD5C @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _0203BD60 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203BD64 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _0203BD68 @ =0x04000128
	ldr r2, _0203BD6C @ =0x00002003
	adds r0, r2, #0
	strh r0, [r1]
	subs r1, #0x1c
	ldr r0, _0203BD70 @ =0x0000BBBC
	str r0, [r1]
	adds r1, #0xf6
	movs r0, #0xc0
	strh r0, [r1]
	ldr r2, _0203BD74 @ =gMultiSioArea
	ldrb r1, [r2, #8]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r2, #8]
	bx lr
	.align 2, 0
_0203BD5C: .4byte 0x04000208
_0203BD60: .4byte 0x04000200
_0203BD64: .4byte 0x0000FF3F
_0203BD68: .4byte 0x04000128
_0203BD6C: .4byte 0x00002003
_0203BD70: .4byte 0x0000BBBC
_0203BD74: .4byte gMultiSioArea

	thumb_func_start sub_0203bd78
sub_0203bd78: @ 0x0203BD78
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	ldr r0, _0203BD94 @ =gUnknown_03000810
	ldrb r1, [r0, #1]
	adds r5, r0, #0
	cmp r1, #4
	bls _0203BD88
	b _0203BF4E
_0203BD88:
	lsls r0, r1, #2
	ldr r1, _0203BD98 @ =_0203BD9C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0203BD94: .4byte gUnknown_03000810
_0203BD98: .4byte _0203BD9C
_0203BD9C: @ jump table
	.4byte _0203BDB0 @ case 0
	.4byte _0203BDC8 @ case 1
	.4byte _0203BE64 @ case 2
	.4byte _0203BED6 @ case 3
	.4byte _0203BF44 @ case 4
_0203BDB0:
	ldr r0, [r5]
	ldr r1, _0203BDC4 @ =0x00FF00FF
	ands r0, r1
	cmp r0, #0
	bne _0203BDBC
	b _0203BF4E
_0203BDBC:
	movs r0, #1
	strb r0, [r5, #1]
	b _0203BF4E
	.align 2, 0
_0203BDC4: .4byte 0x00FF00FF
_0203BDC8:
	ldrb r0, [r5]
	cmp r0, #1
	bne _0203BDD8
	ldrb r0, [r5, #2]
	cmp r0, #5
	bhi _0203BDD6
	b _0203BF4E
_0203BDD6:
	b _0203BDE2
_0203BDD8:
	ldr r1, _0203BE18 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
_0203BDE2:
	ldr r0, _0203BE1C @ =0x04000120
	movs r6, #0
	str r6, [r0]
	ldr r1, _0203BE20 @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	ldrb r4, [r5]
	cmp r4, #1
	bne _0203BE30
	ldr r2, _0203BE18 @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0203BE24 @ =0x0400010C
	ldr r0, _0203BE28 @ =0x00C0F318
	str r0, [r1]
	ldr r3, _0203BE2C @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	strh r4, [r3]
	b _0203BE50
	.align 2, 0
_0203BE18: .4byte 0x04000128
_0203BE1C: .4byte 0x04000120
_0203BE20: .4byte 0x04000202
_0203BE24: .4byte 0x0400010C
_0203BE28: .4byte 0x00C0F318
_0203BE2C: .4byte 0x04000208
_0203BE30:
	ldr r2, _0203BE5C @ =0x04000128
	ldrh r0, [r2]
	movs r3, #0x81
	lsls r3, r3, #7
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r3, _0203BE60 @ =0x04000208
	strh r6, [r3]
	adds r2, #0xd8
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
_0203BE50:
	movs r0, #0
	strb r0, [r5, #2]
	movs r0, #2
	strb r0, [r5, #1]
	b _0203BF4E
	.align 2, 0
_0203BE5C: .4byte 0x04000128
_0203BE60: .4byte 0x04000208
_0203BE64:
	ldr r6, [r5, #8]
	adds r4, r6, #0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _0203BE74
	adds r4, r0, #0
	b _0203BE7A
_0203BE74:
	cmp r6, #0
	bge _0203BE7A
	movs r4, #0
_0203BE7A:
	cmp r2, #0
	beq _0203BE80
	str r4, [r2]
_0203BE80:
	ldrb r0, [r5]
	cmp r0, #1
	beq _0203BEC2
	ldr r0, [r5, #0x14]
	cmp r0, r4
	bge _0203BEA6
	adds r3, r5, #0
	ldr r7, [r5, #4]
_0203BE90:
	ldr r2, [r3, #0x14]
	lsls r0, r2, #2
	adds r0, r0, r7
	ldr r1, [r3, #0x10]
	ldr r0, [r0]
	adds r1, r1, r0
	str r1, [r3, #0x10]
	adds r2, #1
	str r2, [r3, #0x14]
	cmp r2, r4
	blt _0203BE90
_0203BEA6:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	ble _0203BECA
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	adds r0, r0, r1
	str r0, [r5, #0xc]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _0203BEC2
	movs r0, #1
	strb r0, [r5, #3]
_0203BEC2:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r6, r0
	bgt _0203BED0
_0203BECA:
	ldrb r0, [r5, #2]
	cmp r0, #0x8c
	bne _0203BF4E
_0203BED0:
	movs r0, #3
	strb r0, [r5, #1]
	b _0203BF4E
_0203BED6:
	ldr r3, _0203BF28 @ =0x04000208
	movs r4, #0
	strh r4, [r3]
	ldr r2, _0203BF2C @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203BF30 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _0203BF34 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1]
	adds r0, #3
	str r0, [r1]
	ldr r2, _0203BF38 @ =0x04000120
	movs r0, #0
	movs r1, #0
	str r0, [r2]
	str r1, [r2, #4]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0203BF14
	ldr r1, _0203BF3C @ =0x0400010C
	movs r0, #0
	str r0, [r1]
_0203BF14:
	ldr r0, _0203BF40 @ =0x04000202
	movs r1, #0xc0
	strh r1, [r0]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0203BF4A
	strb r4, [r5, #2]
	movs r0, #4
	strb r0, [r5, #1]
	b _0203BF4E
	.align 2, 0
_0203BF28: .4byte 0x04000208
_0203BF2C: .4byte 0x04000200
_0203BF30: .4byte 0x0000FF3F
_0203BF34: .4byte 0x04000128
_0203BF38: .4byte 0x04000120
_0203BF3C: .4byte 0x0400010C
_0203BF40: .4byte 0x04000202
_0203BF44:
	ldrb r0, [r5, #2]
	cmp r0, #2
	bls _0203BF4E
_0203BF4A:
	movs r0, #1
	b _0203BF56
_0203BF4E:
	ldrb r0, [r5, #2]
	adds r0, #1
	strb r0, [r5, #2]
	movs r0, #0
_0203BF56:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_0203bf5c
sub_0203bf5c: @ 0x0203BF5C
	push {r4, r5, lr}
	ldr r2, _0203BF80 @ =0x04000120
	ldr r3, [r2]
	ldr r5, _0203BF84 @ =gUnknown_03000810
	ldrb r0, [r5]
	adds r4, r5, #0
	cmp r0, #1
	beq _0203BF8C
	ldr r0, _0203BF88 @ =0x04000128
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
	ldr r2, [r4, #8]
	cmp r2, #0
	bge _0203BFD8
	b _0203BFC6
	.align 2, 0
_0203BF80: .4byte 0x04000120
_0203BF84: .4byte gUnknown_03000810
_0203BF88: .4byte 0x04000128
_0203BF8C:
	ldr r1, _0203BFA0 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r1, [r4, #8]
	cmp r1, #0
	bge _0203BFA8
	ldr r0, _0203BFA4 @ =0xFEFEFEFE
	str r0, [r2]
	b _0203BFEE
	.align 2, 0
_0203BFA0: .4byte 0x0400010E
_0203BFA4: .4byte 0xFEFEFEFE
_0203BFA8:
	ldr r0, _0203BFBC @ =0x00001FFF
	cmp r1, r0
	bgt _0203BFC0
	ldr r0, [r4, #4]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [r2]
	b _0203BFEE
	.align 2, 0
_0203BFBC: .4byte 0x00001FFF
_0203BFC0:
	ldr r0, [r4, #0xc]
	str r0, [r2]
	b _0203BFEE
_0203BFC6:
	ldr r0, _0203BFD4 @ =0xFEFEFEFE
	cmp r3, r0
	beq _0203BFEE
	subs r0, r2, #1
	str r0, [r5, #8]
	b _0203BFEE
	.align 2, 0
_0203BFD4: .4byte 0xFEFEFEFE
_0203BFD8:
	ldr r0, _0203BFE8 @ =0x00001FFF
	cmp r2, r0
	bgt _0203BFEC
	ldr r1, [r4, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	str r3, [r0]
	b _0203BFEE
	.align 2, 0
_0203BFE8: .4byte 0x00001FFF
_0203BFEC:
	str r3, [r4, #0xc]
_0203BFEE:
	ldr r1, [r4, #8]
	ldr r0, _0203C018 @ =0x00002002
	cmp r1, r0
	bgt _0203C010
	adds r0, r1, #1
	str r0, [r4, #8]
	ldrb r0, [r4]
	cmp r0, #1
	bne _0203C010
	ldr r2, _0203C01C @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0203C020 @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_0203C010:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0203C018: .4byte 0x00002002
_0203C01C: .4byte 0x04000128
_0203C020: .4byte 0x0400010E

	thumb_func_start sub_0203c024
sub_0203c024: @ 0x0203C024
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r5, r0, #0
	adds r7, r1, #0
	movs r6, #0
	ldr r3, _0203C0A0 @ =0x04000208
	strh r6, [r3]
	ldr r2, _0203C0A4 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _0203C0A8 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	mov r8, r0
	strh r0, [r3]
	str r6, [sp]
	ldr r4, _0203C0AC @ =gUnknown_03000810
	ldr r2, _0203C0B0 @ =0x05000006
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	ldr r1, _0203C0B4 @ =0x04000128
	ldr r0, _0203C0B8 @ =0x00002003
	str r0, [r1]
	str r7, [r4, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #8]
	cmp r5, #0
	beq _0203C092
	ldr r0, _0203C0BC @ =0x0400010C
	str r6, [r0]
	mov r2, r8
	strb r2, [r4]
	adds r1, r7, #0
	movs r2, #0x80
	lsls r2, r2, #6
_0203C074:
	ldm r1!, {r0}
	adds r6, r6, r0
	subs r2, #1
	cmp r2, #0
	bne _0203C074
	mvns r0, r6
	str r0, [r4, #0xc]
	ldr r1, _0203C0B4 @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	adds r2, #1
	adds r0, r2, #0
	strh r0, [r1]
_0203C092:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0203C0A0: .4byte 0x04000208
_0203C0A4: .4byte 0x04000200
_0203C0A8: .4byte 0x0000FF3F
_0203C0AC: .4byte gUnknown_03000810
_0203C0B0: .4byte 0x05000006
_0203C0B4: .4byte 0x04000128
_0203C0B8: .4byte 0x00002003
_0203C0BC: .4byte 0x0400010C
