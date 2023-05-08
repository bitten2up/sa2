.include "asm/macros.inc"
.include "constants/constants.inc"

.section .rodata

.text
.syntax unified
.arm

@; Seems to create the given animation on the screen in a fixed position
@; and despawns once it leaves player range?
	thumb_func_start sub_800A544
sub_800A544: @ 0x0800A544
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	adds r4, r0, #0
	mov sl, r1
	adds r6, r2, #0
	mov r8, r3
	ldr r1, [sp, #0x20]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	mov r0, r8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, _0800A5E4 @ =sub_800A5F8
	str r1, [sp]
	movs r1, #0x44
	adds r2, r4, #0
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r5, r1
	movs r3, #0
	str r3, [r1, #0x30]
	str r3, [r1, #0x34]
	movs r2, #0
	mov sb, r2
	strh r3, [r1, #0x38]
	strh r3, [r1, #0x3a]
	strh r3, [r1, #0x3c]
	strh r3, [r1, #0x3e]
	ldr r4, _0800A5E8 @ =IWRAM_START + 0x40
	adds r2, r5, r4
	strh r3, [r2]
	strh r3, [r1, #0x16]
	strh r3, [r1, #0x18]
	mov r2, sl
	str r2, [r1, #4]
	strh r3, [r1, #0x1a]
	strh r3, [r1, #8]
	strh r6, [r1, #0xa]
	subs r4, #0x20
	adds r2, r5, r4
	mov r4, r8
	strb r4, [r2]
	strh r3, [r1, #0x14]
	strh r3, [r1, #0x1c]
	ldr r2, _0800A5EC @ =IWRAM_START + 0x21
	adds r4, r5, r2
	movs r2, #0xff
	strb r2, [r4]
	ldr r2, _0800A5F0 @ =IWRAM_START + 0x22
	adds r4, r5, r2
	movs r2, #0x10
	strb r2, [r4]
	ldr r4, _0800A5F4 @ =IWRAM_START + 0x25
	adds r5, r5, r4
	mov r2, sb
	strb r2, [r5]
	movs r2, #1
	rsbs r2, r2, #0
	str r2, [r1, #0x28]
	str r3, [r1, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800A5E4: .4byte sub_800A5F8
_0800A5E8: .4byte IWRAM_START + 0x40
_0800A5EC: .4byte IWRAM_START + 0x21
_0800A5F0: .4byte IWRAM_START + 0x22
_0800A5F4: .4byte IWRAM_START + 0x25

	thumb_func_start sub_800A5F8
sub_800A5F8: @ 0x0800A5F8
	push {r4, r5, r6, lr}
	ldr r6, _0800A67C @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldrh r0, [r5, #0x3c]
	ldrh r1, [r5, #0x38]
	adds r0, r0, r1
	strh r0, [r5, #0x38]
	ldrh r0, [r5, #0x3e]
	ldrh r1, [r5, #0x3a]
	adds r0, r0, r1
	strh r0, [r5, #0x3a]
	movs r0, #0x38
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x30]
	adds r0, r0, r1
	str r0, [r5, #0x30]
	movs r1, #0x3a
	ldrsh r2, [r5, r1]
	ldr r1, [r5, #0x34]
	adds r1, r1, r2
	str r1, [r5, #0x34]
	asrs r0, r0, #8
	ldr r3, _0800A680 @ =gCamera
	ldr r2, [r3]
	subs r0, r0, r2
	strh r0, [r5, #0x16]
	asrs r1, r1, #8
	ldr r0, [r3, #4]
	subs r1, r1, r0
	strh r1, [r5, #0x18]
	ldr r0, _0800A684 @ =IWRAM_START + 0x40
	adds r4, r4, r0
	ldrh r0, [r4]
	cmp r0, #0
	beq _0800A64A
	subs r0, #1
	strh r0, [r4]
_0800A64A:
	ldrh r0, [r5, #0x16]
	adds r0, #0x20
	lsls r0, r0, #0x10
	movs r1, #0x98
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _0800A672
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	subs r0, #0x20
	cmp r0, #0xa0
	bgt _0800A672
	adds r0, r5, #0
	bl sub_8004558
	cmp r0, #0
	bne _0800A688
	ldrh r0, [r4]
	cmp r0, #0
	bne _0800A688
_0800A672:
	ldr r0, [r6]
	bl TaskDestroy
	b _0800A68E
	.align 2, 0
_0800A67C: .4byte gCurTask
_0800A680: .4byte gCamera
_0800A684: .4byte IWRAM_START + 0x40
_0800A688:
	adds r0, r5, #0
	bl sub_80051E8
_0800A68E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_800A694
sub_800A694: @ 0x0800A694
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0, #4]
	bl VramFree
	pop {r0}
	bx r0
