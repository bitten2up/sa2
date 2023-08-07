.include "asm/macros.inc"
.include "constants/constants.inc"

.text
.syntax unified
.arm

	thumb_func_start StageInit_Zone7
StageInit_Zone7: @ 0x0801D95C
	push {r4, r5, r6, lr}
	ldr r4, _0801D9B0 @ =gUnknown_03005850
	ldr r1, _0801D9B4 @ =gDispCnt
	movs r2, #0xb2
	lsls r2, r2, #5
	adds r0, r2, #0
	strh r0, [r1]
	ldr r5, _0801D9B8 @ =gBgCntRegs
	movs r6, #0
	ldr r0, _0801D9BC @ =0x0000160F
	strh r0, [r5]
	ldr r1, _0801D9C0 @ =gUnknown_080D5864
	adds r1, #0xc0
	adds r0, r4, #0
	movs r2, #0x40
	bl memcpy
	movs r0, #0xd1
	strh r0, [r4, #0x1c]
	ldr r0, _0801D9C4 @ =0x0600C000
	str r0, [r4, #4]
	ldr r0, _0801D9C8 @ =0x0600B000
	str r0, [r4, #0xc]
	movs r0, #0x20
	strh r0, [r4, #0x26]
	movs r0, #0x14
	strh r0, [r4, #0x28]
	adds r0, r4, #0
	bl sub_8002A3C
	ldrh r1, [r5, #6]
	ldr r0, _0801D9CC @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r5, #6]
	ldr r0, _0801D9D0 @ =gBgScrollRegs
	strh r6, [r0]
	strh r6, [r0, #2]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D9B0: .4byte gUnknown_03005850
_0801D9B4: .4byte gDispCnt
_0801D9B8: .4byte gBgCntRegs
_0801D9BC: .4byte 0x0000160F
_0801D9C0: .4byte gUnknown_080D5864
_0801D9C4: .4byte 0x0600C000
_0801D9C8: .4byte 0x0600B000
_0801D9CC: .4byte 0x0000FFFC
_0801D9D0: .4byte gBgScrollRegs

	thumb_func_start sub_801D9D4
sub_801D9D4: @ 0x0801D9D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	adds r5, r1, #0
	ldr r2, _0801DB80 @ =gPlayer
	ldr r0, [r2, #0x20]
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0801DA1A
	ldr r0, _0801DB84 @ =gUnknown_030054F4
	ldrb r0, [r0]
	cmp r0, #6
	bls _0801DA1A
	ldr r1, _0801DB88 @ =gBgScrollRegs
	movs r3, #0xc
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bne _0801DA08
	mov r0, sl
	strh r0, [r1, #0xc]
_0801DA08:
	ldrh r0, [r2, #0x14]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	ldrh r2, [r1, #0xc]
	adds r0, r0, r2
	strh r0, [r1, #0xc]
	movs r0, #0xc
	ldrsh r3, [r1, r0]
	mov sl, r3
_0801DA1A:
	ldr r2, _0801DB8C @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801DB90 @ =0x0000FEFF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _0801DB94 @ =gFlags
	ldr r0, [r1]
	movs r2, #4
	orrs r0, r2
	str r0, [r1]
	ldr r1, _0801DB98 @ =gUnknown_03002878
	ldr r0, _0801DB9C @ =0x0400001C
	str r0, [r1]
	ldr r0, _0801DBA0 @ =gUnknown_03002A80
	strb r2, [r0]
	ldr r0, _0801DBA4 @ =gUnknown_03001884
	ldr r4, [r0]
	movs r0, #0x2a
	mov r1, sl
	muls r1, r0, r1
	adds r0, r1, #0
	movs r1, #0xc8
	lsls r1, r1, #1
	bl Div
	mov r2, sl
	lsls r0, r2, #1
	asrs r3, r5, #4
	str r3, [sp, #0xc]
	asrs r5, r5, #1
	str r5, [sp, #4]
	asrs r2, r2, #4
	str r2, [sp, #8]
	movs r2, #8
	movs r1, #0x10
	movs r3, #0x27
_0801DA6A:
	strh r2, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _0801DA6A
	add r0, sl
	lsls r0, r0, #3
	add r0, sl
	movs r1, #0xc8
	lsls r1, r1, #1
	bl Div
	mov ip, r0
	movs r0, #0xff
	mov r1, ip
	ands r1, r0
	mov ip, r1
	movs r0, #0x11
	movs r3, #0x76
_0801DA94:
	mov r2, ip
	strh r2, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _0801DA94
	movs r1, #0
_0801DAA6:
	ldr r3, _0801DBA8 @ =gUnknown_03005590
	ldr r0, [r3]
	add r0, sl
	lsrs r0, r0, #3
	mov ip, r0
	movs r0, #0xff
	mov r2, ip
	ands r2, r0
	mov ip, r2
	movs r0, #0x64
	muls r0, r1, r0
	adds r0, #0x40
	ldr r3, [sp, #0xc]
	subs r0, r0, r3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xef
	bhi _0801DBAC
	lsls r0, r5, #2
	mov sb, r0
	adds r1, #1
	str r1, [sp]
	cmp r5, #0x50
	bls _0801DB1C
	ldr r1, _0801DBA4 @ =gUnknown_03001884
	ldr r4, [r1]
	adds r0, r5, #0
	subs r0, #0x50
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	subs r0, r5, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r3, r5, #0
	movs r2, #0
	adds r7, r1, #0
	adds r7, #0xa0
	cmp r3, r7
	bge _0801DB1C
	cmp r2, r1
	bhs _0801DB1C
	movs r0, #0
	mov r8, r0
	movs r0, #0xd0
	subs r6, r0, r3
_0801DB02:
	mov r0, r8
	strh r0, [r4]
	adds r4, #2
	strh r6, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, r7
	bge _0801DB1C
	cmp r2, r1
	blo _0801DB02
_0801DB1C:
	ldr r1, _0801DBA4 @ =gUnknown_03001884
	ldr r4, [r1]
	add r4, sb
	adds r3, r5, #0
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DB48
	movs r0, #0xf0
	subs r1, r0, r3
_0801DB2E:
	mov r0, ip
	strh r0, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DB48
	cmp r2, #0xf
	bls _0801DB2E
_0801DB48:
	cmp r3, #0x4f
	bgt _0801DBEE
	movs r0, #0x50
	subs r0, r0, r3
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DBEE
	cmp r2, r1
	bhs _0801DBEE
	movs r6, #0
	movs r0, #0xb8
	subs r5, r0, r5
_0801DB66:
	strh r6, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DBEE
	cmp r2, r1
	blo _0801DB66
	b _0801DBEE
	.align 2, 0
_0801DB80: .4byte gPlayer
_0801DB84: .4byte gUnknown_030054F4
_0801DB88: .4byte gBgScrollRegs
_0801DB8C: .4byte gDispCnt
_0801DB90: .4byte 0x0000FEFF
_0801DB94: .4byte gFlags
_0801DB98: .4byte gUnknown_03002878
_0801DB9C: .4byte 0x0400001C
_0801DBA0: .4byte gUnknown_03002A80
_0801DBA4: .4byte gUnknown_03001884
_0801DBA8: .4byte gUnknown_03005590
_0801DBAC:
	ldr r2, _0801DCCC @ =gUnknown_03001884
	ldr r4, [r2]
	movs r0, #0xff
	subs r3, r0, r5
	adds r1, #1
	str r1, [sp]
	cmp r3, #0xf
	bgt _0801DBD2
	ldr r1, _0801DCD0 @ =0x000001EF
	adds r0, r1, #0
	subs r0, r0, r5
_0801DBC2:
	mov r2, ip
	strh r2, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0xf
	ble _0801DBC2
_0801DBD2:
	movs r2, #0
	movs r3, #0
	ldr r1, _0801DCD4 @ =0x000001B7
	adds r0, r1, #0
	subs r1, r0, r5
_0801DBDC:
	strh r3, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0801DBDC
_0801DBEE:
	ldr r2, [sp]
	lsls r0, r2, #0x18
	lsrs r1, r0, #0x18
	cmp r1, #1
	bhi _0801DBFA
	b _0801DAA6
_0801DBFA:
	ldr r3, _0801DCD8 @ =gUnknown_03005590
	ldr r0, [r3]
	add r0, sl
	lsrs r0, r0, #1
	mov ip, r0
	movs r0, #0xff
	mov r1, ip
	ands r1, r0
	mov ip, r1
	ldr r2, [sp, #4]
	rsbs r0, r2, #0
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0xdf
	bhi _0801DCDC
	lsls r3, r5, #2
	mov sb, r3
	cmp r5, #0x50
	bls _0801DC66
	ldr r0, _0801DCCC @ =gUnknown_03001884
	ldr r4, [r0]
	adds r0, r5, #0
	subs r0, #0x50
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	subs r0, r5, r1
	lsls r0, r0, #2
	adds r4, r4, r0
	adds r3, r5, #0
	movs r2, #0
	adds r6, r1, #0
	adds r6, #0xa0
	cmp r3, r6
	bge _0801DC66
	cmp r2, r1
	bhs _0801DC66
	movs r0, #0
	mov r8, r0
	movs r0, #0xd0
	subs r7, r0, r3
_0801DC4C:
	mov r0, r8
	strh r0, [r4]
	adds r4, #2
	strh r7, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, r6
	bge _0801DC66
	cmp r2, r1
	blo _0801DC4C
_0801DC66:
	ldr r1, _0801DCCC @ =gUnknown_03001884
	ldr r4, [r1]
	add r4, sb
	adds r3, r5, #0
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DC92
	movs r0, #0xd0
	subs r1, r0, r3
_0801DC78:
	mov r0, ip
	strh r0, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DC92
	cmp r2, #0x1f
	bls _0801DC78
_0801DC92:
	cmp r3, #0x4f
	bgt _0801DD1A
	movs r0, #0x50
	subs r0, r0, r3
	asrs r0, r0, #4
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	movs r2, #0
	cmp r3, #0x9f
	bgt _0801DD1A
	cmp r2, r1
	bhs _0801DD1A
	movs r6, #0
	movs r0, #0xa8
	subs r5, r0, r5
_0801DCB0:
	strh r6, [r4]
	adds r4, #2
	strh r5, [r4]
	adds r4, #2
	adds r3, #1
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r3, #0x9f
	bgt _0801DD1A
	cmp r2, r1
	blo _0801DCB0
	b _0801DD1A
	.align 2, 0
_0801DCCC: .4byte gUnknown_03001884
_0801DCD0: .4byte 0x000001EF
_0801DCD4: .4byte 0x000001B7
_0801DCD8: .4byte gUnknown_03005590
_0801DCDC:
	ldr r1, _0801DD64 @ =gUnknown_03001884
	ldr r4, [r1]
	movs r0, #0xff
	subs r3, r0, r5
	cmp r3, #0x1f
	bgt _0801DCFE
	ldr r2, _0801DD68 @ =0x000001CF
	adds r0, r2, #0
	subs r0, r0, r5
_0801DCEE:
	mov r1, ip
	strh r1, [r4]
	adds r4, #2
	strh r0, [r4]
	adds r4, #2
	adds r3, #1
	cmp r3, #0x1f
	ble _0801DCEE
_0801DCFE:
	movs r2, #0
	movs r3, #0
	ldr r1, _0801DD6C @ =0x000001A7
	adds r0, r1, #0
	subs r1, r0, r5
_0801DD08:
	strh r3, [r4]
	adds r4, #2
	strh r1, [r4]
	adds r4, #2
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #3
	bls _0801DD08
_0801DD1A:
	ldr r2, [sp, #8]
	lsls r1, r2, #0x10
	movs r6, #7
	ldr r5, _0801DD70 @ =gUnknown_080D5C82
	ldr r0, _0801DD74 @ =gBgPalette
	movs r3, #0xd1
	lsls r3, r3, #1
	adds r4, r0, r3
	lsrs r1, r1, #0x10
	movs r3, #7
_0801DD2E:
	adds r0, r1, #0
	ands r0, r6
	adds r2, r0, #1
	lsls r0, r2, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	subs r3, #1
	cmp r3, #0
	bge _0801DD2E
	ldr r1, _0801DD78 @ =gFlags
	ldr r0, [r1]
	movs r1, #1
	orrs r0, r1
	ldr r2, _0801DD78 @ =gFlags
	str r0, [r2]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DD64: .4byte gUnknown_03001884
_0801DD68: .4byte 0x000001CF
_0801DD6C: .4byte 0x000001A7
_0801DD70: .4byte gUnknown_080D5C82
_0801DD74: .4byte gBgPalette
_0801DD78: .4byte gFlags

	thumb_func_start sub_801DD7C
sub_801DD7C: @ 0x0801DD7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	ldr r2, _0801DED8 @ =gDispCnt
	ldrh r1, [r2]
	ldr r0, _0801DEDC @ =0x0000F7FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r2, _0801DEE0 @ =gFlags
	ldr r0, [r2]
	movs r1, #4
	orrs r0, r1
	str r0, [r2]
	ldr r1, _0801DEE4 @ =gUnknown_03002878
	ldr r0, _0801DEE8 @ =0x04000010
	str r0, [r1]
	ldr r1, _0801DEEC @ =gUnknown_03002A80
	movs r0, #2
	strb r0, [r1]
	ldr r0, _0801DEF0 @ =gUnknown_03001884
	ldr r4, [r0]
	ldr r0, _0801DEF4 @ =gUnknown_03005590
	ldr r5, [r0]
	lsrs r1, r5, #3
	movs r2, #0x1f
	ands r1, r2
	mov sb, r0
	cmp r1, #0xf
	bls _0801DDCA
	subs r0, r2, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
_0801DDCA:
	movs r3, #0
	ldr r6, _0801DEF8 @ =gUnknown_080D5C62
	adds r7, r6, #2
	mov r8, r7
	movs r0, #7
	mov ip, r0
	movs r1, #0xff
	mov sl, r1
_0801DDDA:
	lsls r0, r3, #1
	mov r7, sp
	adds r2, r7, r0
	adds r1, r3, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #2
	adds r0, r1, r6
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	add r1, r8
	lsrs r0, r0, #8
	ldrh r1, [r1]
	adds r0, r0, r1
	mov r1, sl
	ands r0, r1
	strh r0, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x1f
	bls _0801DDDA
	ldr r6, _0801DEFC @ =0x0000507F
	movs r3, #0
	ldr r5, _0801DF00 @ =gSineTable
	ldr r2, _0801DF04 @ =0x000003FF
_0801DE10:
	mov r7, sb
	ldr r0, [r7]
	lsls r0, r0, #2
	lsls r1, r3, #1
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r3, #0
	muls r0, r6, r0
	lsrs r0, r0, #5
	ands r0, r2
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	adds r0, r1, r0
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ands r1, r3
	lsls r1, r1, #1
	add r1, sp
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x4f
	bls _0801DE10
	cmp r3, #0x9e
	bhi _0801DEC6
	ldr r5, _0801DF00 @ =gSineTable
	ldr r2, _0801DF04 @ =0x000003FF
_0801DE6E:
	mov r1, sb
	ldr r0, [r1]
	lsls r0, r0, #2
	lsls r1, r3, #1
	adds r0, r0, r1
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x19
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0xa0
	subs r0, r0, r3
	muls r0, r6, r0
	lsrs r0, r0, #5
	ands r0, r2
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x1a
	adds r0, r1, r0
	lsls r0, r0, #0x10
	movs r1, #0x1f
	ands r1, r3
	lsls r1, r1, #1
	add r1, sp
	lsrs r0, r0, #0x10
	ldrh r1, [r1]
	adds r0, r0, r1
	movs r1, #0xff
	ands r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #0x9e
	bls _0801DE6E
_0801DEC6:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DED8: .4byte gDispCnt
_0801DEDC: .4byte 0x0000F7FF
_0801DEE0: .4byte gFlags
_0801DEE4: .4byte gUnknown_03002878
_0801DEE8: .4byte 0x04000010
_0801DEEC: .4byte gUnknown_03002A80
_0801DEF0: .4byte gUnknown_03001884
_0801DEF4: .4byte gUnknown_03005590
_0801DEF8: .4byte gUnknown_080D5C62
_0801DEFC: .4byte 0x0000507F
_0801DF00: .4byte gSineTable
_0801DF04: .4byte 0x000003FF
