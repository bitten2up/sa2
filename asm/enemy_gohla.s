.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8051AF0
sub_8051AF0: @ 0x08051AF0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	ldr r1, _08051BB0 @ =gCurTask
	ldr r0, [r1]
	ldrh r3, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r3, r0
	ldr r2, _08051BB4 @ =IWRAM_START + 0xC
	adds r4, r3, r2
	ldr r0, [r5]
	str r0, [sp, #4]
	ldr r1, _08051BB8 @ =IWRAM_START + 0x80
	adds r1, r1, r3
	mov r8, r1
	ldr r0, [r5, #0x78]
	ldr r1, [r1]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x74]
	ldr r2, [r5, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	ldr r2, _08051BBC @ =IWRAM_START + 0x8C
	adds r2, r2, r3
	mov sb, r2
	ldrb r2, [r2]
	ldr r3, _08051BC0 @ =sub_801EC3C
	mov sl, r3
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
	cmp r0, #0
	bge _08051B64
	lsls r0, r0, #8
	mov r2, r8
	ldr r1, [r2]
	adds r1, r1, r0
	str r1, [r2]
	ldr r0, [r5, #0x78]
	adds r0, r0, r1
	asrs r0, r0, #8
	ldr r1, [r5, #0x74]
	ldr r2, [r5, #0x7c]
	adds r1, r1, r2
	asrs r1, r1, #8
	mov r3, sb
	ldrb r2, [r3]
	mov r3, sl
	str r3, [sp]
	movs r3, #8
	bl sub_801F100
_08051B64:
	cmp r0, #0
	ble _08051B72
	lsls r1, r0, #8
	mov r2, r8
	ldr r0, [r2]
	adds r0, r0, r1
	str r0, [r2]
_08051B72:
	ldr r1, [r5, #0x74]
	ldr r0, [r5, #0x7c]
	adds r1, r1, r0
	asrs r1, r1, #8
	adds r6, r1, #0
	ldr r2, [r5, #0x78]
	mov r3, r8
	ldr r0, [r3]
	adds r2, r2, r0
	asrs r2, r2, #8
	adds r7, r2, #0
	ldr r3, _08051BC4 @ =gCamera
	ldr r0, [r3]
	subs r0, r6, r0
	strh r0, [r4, #0x16]
	ldr r0, [r3, #4]
	subs r0, r7, r0
	strh r0, [r4, #0x18]
	adds r0, r5, #0
	str r3, [sp, #8]
	bl sub_8051DC8
	lsls r0, r0, #0x18
	ldr r3, [sp, #8]
	cmp r0, #0
	beq _08051BC8
	ldr r1, _08051BB0 @ =gCurTask
	ldr r0, [r1]
	bl TaskDestroy
	b _08051C9A
	.align 2, 0
_08051BB0: .4byte gCurTask
_08051BB4: .4byte IWRAM_START + 0xC
_08051BB8: .4byte IWRAM_START + 0x80
_08051BBC: .4byte IWRAM_START + 0x8C
_08051BC0: .4byte sub_801EC3C
_08051BC4: .4byte gCamera
_08051BC8:
	ldr r0, [r5, #0x74]
	asrs r2, r0, #8
	ldr r1, [r3]
	movs r0, #0xb8
	lsls r0, r0, #1
	adds r0, r0, r1
	mov r8, r0
	cmp r2, r8
	bgt _08051BFA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	blt _08051BFA
	ldr r0, [r5, #0x78]
	asrs r2, r0, #8
	ldr r1, [r3, #4]
	movs r3, #0x90
	lsls r3, r3, #1
	adds r0, r1, r3
	cmp r2, r0
	bgt _08051BFA
	adds r0, r1, #0
	subs r0, #0x80
	cmp r2, r0
	bge _08051C34
_08051BFA:
	ldrh r0, [r4, #0x16]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _08051C1E
	movs r1, #0x18
	ldrsh r0, [r4, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _08051C1E
	movs r2, #0x18
	ldrsh r1, [r4, r2]
	movs r0, #0x90
	lsls r0, r0, #1
	cmp r1, r0
	ble _08051C34
_08051C1E:
	ldrb r0, [r5, #8]
	ldr r3, [sp, #4]
	strb r0, [r3]
	ldr r0, _08051C30 @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08051C9A
	.align 2, 0
_08051C30: .4byte gCurTask
_08051C34:
	lsls r0, r6, #8
	lsls r1, r7, #8
	bl sub_80122DC
	adds r0, r4, #0
	bl UpdateSpriteAnimation
	cmp r0, #0
	bne _08051C80
	ldr r1, [r4, #0x10]
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _08051C60
	ldr r0, _08051C5C @ =0xFFFFFBFF
	ands r1, r0
	b _08051C62
	.align 2, 0
_08051C5C: .4byte 0xFFFFFBFF
_08051C60:
	orrs r1, r2
_08051C62:
	str r1, [r4, #0x10]
	movs r1, #0
	ldr r0, _08051CAC @ =0x000001E3
	strh r0, [r4, #0xa]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r1, r4, #0
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _08051CB0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08051CB4 @ =sub_8051928
	str r0, [r1, #8]
_08051C80:
	adds r0, r4, #0
	bl DisplaySprite
	movs r0, #0x16
	ldrsh r1, [r4, r0]
	ldrh r2, [r4, #0x18]
	subs r2, #4
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	ldr r3, [r4, #0x10]
	adds r0, r5, #0
	bl sub_8051CB8
_08051C9A:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08051CAC: .4byte 0x000001E3
_08051CB0: .4byte gCurTask
_08051CB4: .4byte sub_8051928

	thumb_func_start sub_8051CB8
sub_8051CB8: @ 0x08051CB8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r3, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	adds r5, r7, #0
	adds r5, #0x44
	adds r0, r5, #0
	bl UpdateSpriteAnimation
	adds r1, r7, #0
	adds r1, #0x88
	ldrh r0, [r1]
	adds r0, #0x18
	ldr r3, _08051D08 @ =0x000003FF
	adds r2, r3, #0
	ands r0, r2
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r1]
	adds r0, #0x20
	ands r0, r2
	strh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #3
	ands r4, r1
	cmp r4, #0
	beq _08051D0C
	ldr r0, [r5, #0x10]
	orrs r0, r1
	b _08051D12
	.align 2, 0
_08051D08: .4byte 0x000003FF
_08051D0C:
	ldr r0, [r5, #0x10]
	ldr r1, _08051D8C @ =0xFFFFFBFF
	ands r0, r1
_08051D12:
	str r0, [r5, #0x10]
	movs r6, #0
	adds r0, r7, #0
	adds r0, #0x88
	str r0, [sp, #4]
	adds r7, #0x8a
	mov sl, r7
	mov r1, sb
	lsls r1, r1, #0x10
	mov sb, r1
	mov r3, r8
	lsls r3, r3, #0x10
	mov r8, r3
	mov r4, sp
	ldr r7, _08051D90 @ =0x000003FF
	adds r3, r7, #0
_08051D32:
	lsls r2, r6, #8
	ldr r0, [sp, #4]
	ldrh r0, [r0]
	adds r2, r2, r0
	ands r2, r3
	strh r2, [r4]
	lsls r0, r6, #1
	adds r0, r0, r6
	lsls r0, r0, #7
	mov r1, sl
	ldrh r1, [r1]
	adds r0, r0, r1
	ands r0, r3
	strh r0, [r4, #2]
	ldrh r0, [r4]
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _08051D94 @ =gSineTable
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1a
	mov r7, sb
	asrs r0, r7, #0x10
	adds r0, r0, r1
	strh r0, [r5, #0x16]
	ldrh r0, [r4, #2]
	lsls r0, r0, #1
	ldr r1, _08051D94 @ =gSineTable
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x1d
	mov r7, r8
	asrs r0, r7, #0x10
	adds r0, r0, r1
	strh r0, [r5, #0x18]
	ldr r0, _08051D98 @ =0x000001FF
	cmp r2, r0
	bls _08051D9C
	movs r0, #0x88
	lsls r0, r0, #3
	b _08051DA0
	.align 2, 0
_08051D8C: .4byte 0xFFFFFBFF
_08051D90: .4byte 0x000003FF
_08051D94: .4byte gSineTable
_08051D98: .4byte 0x000001FF
_08051D9C:
	movs r0, #0x98
	lsls r0, r0, #3
_08051DA0:
	strh r0, [r5, #0x1a]
	adds r0, r5, #0
	str r3, [sp, #8]
	bl DisplaySprite
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #8]
	cmp r6, #3
	bls _08051D32
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8051DC8
sub_8051DC8: @ 0x08051DC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r1, #0
	adds r7, r2, #0
	adds r5, r0, #0
	adds r5, #0xc
	movs r0, #0
	mov r8, r0
	adds r0, r5, #0
	movs r3, #0
	bl sub_800C4FC
	cmp r0, #0
	beq _08051DEE
	movs r0, #1
	mov r8, r0
	b _08051E0C
_08051DEE:
	ldr r4, _08051E1C @ =gPlayer
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #0
	bl sub_800CA20
	str r4, [sp]
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r7, #0
	movs r3, #1
	bl sub_800CA20
_08051E0C:
	mov r0, r8
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08051E1C: .4byte gPlayer

	thumb_func_start sub_8051E20
sub_8051E20: @ 0x08051E20
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x10]
	bl VramFree
	ldr r0, [r4, #0x48]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
