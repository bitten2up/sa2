.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_8035554
sub_8035554: @ 0x08035554
	push {r4, r5, r6, r7, lr}
	ldr r0, _080355C0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080355C4 @ =IWRAM_START + 0x2CC
	adds r7, r1, r0
	ldr r0, _080355C8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08035608
	movs r3, #0
	ldr r0, _080355CC @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _08035608
	movs r5, #1
	ldr r2, _080355D0 @ =gUnknown_030054D4
_08035582:
	ldr r1, _080355D4 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080355F0
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080355F4
	movs r0, #0
	ldr r1, _080355D8 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080355DC @ =gUnknown_03002AE4
	ldr r0, _080355E0 @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080355E4 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080355E8 @ =gUnknown_03004D5C
	ldr r0, _080355EC @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl MultiPakCommunicationError
	b _0803572C
	.align 2, 0
_080355C0: .4byte gCurTask
_080355C4: .4byte IWRAM_START + 0x2CC
_080355C8: .4byte gGameMode
_080355CC: .4byte gUnknown_030055B8
_080355D0: .4byte gUnknown_030054D4
_080355D4: .4byte gMultiSioStatusFlags
_080355D8: .4byte 0x0000FFFF
_080355DC: .4byte gUnknown_03002AE4
_080355E0: .4byte gUnknown_0300287C
_080355E4: .4byte gUnknown_03005390
_080355E8: .4byte gUnknown_03004D5C
_080355EC: .4byte gUnknown_03002A84
_080355F0:
	movs r0, #0
	strb r0, [r2]
_080355F4:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08035608
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _08035582
_08035608:
	ldrh r0, [r7, #0x16]
	subs r0, #0x10
	strh r0, [r7, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _0803561A
	movs r0, #0x50
	strh r0, [r7, #0x16]
_0803561A:
	movs r2, #0x96
	lsls r2, r2, #3
	adds r7, r6, r2
	ldr r3, _080356AC @ =gSineTable
	ldr r2, _080356B0 @ =gUnknown_080D74C8
	ldr r0, _080356B4 @ =0x000004BB
	adds r5, r6, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	ldr r0, _080356B8 @ =0x000004B4
	adds r4, r6, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _080356BC @ =gUnknown_080D7358
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r0, #8
	ldr r0, [r7]
	cmp r0, r2
	bge _08035696
	str r2, [r7]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r4]
	movs r0, #0xd7
	bl m4aSongNumStart
	ldr r0, _080356C0 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080356C4 @ =sub_803594C
	str r0, [r1, #8]
_08035696:
	ldr r2, _080356C8 @ =0x000004AC
	adds r1, r6, r2
	ldr r0, [r7]
	ldr r2, _080356CC @ =0xFFFF8800
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _080356D0
	movs r0, #0
	str r0, [r1]
	b _080356DA
	.align 2, 0
_080356AC: .4byte gSineTable
_080356B0: .4byte gUnknown_080D74C8
_080356B4: .4byte 0x000004BB
_080356B8: .4byte 0x000004B4
_080356BC: .4byte gUnknown_080D7358
_080356C0: .4byte gCurTask
_080356C4: .4byte sub_803594C
_080356C8: .4byte 0x000004AC
_080356CC: .4byte 0xFFFF8800
_080356D0:
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, r2
	ble _080356DA
	str r2, [r1]
_080356DA:
	ldr r0, _08035734 @ =gInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080356F0
	movs r0, #0x98
	lsls r0, r0, #3
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
_080356F0:
	ldr r0, _08035738 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _0803571A
	ldr r1, _0803573C @ =gMultiSioSend
	ldr r0, _08035740 @ =0x00004050
	strh r0, [r1]
	ldr r2, _08035744 @ =0x000004BB
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
	subs r2, #0xb
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1, #4]
	adds r2, #4
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strb r0, [r1, #3]
_0803571A:
	ldr r1, _08035748 @ =gBgScrollRegs
	ldr r2, _0803574C @ =0x000004AC
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_8035FCC
_0803572C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035734: .4byte gInput
_08035738: .4byte gGameMode
_0803573C: .4byte gMultiSioSend
_08035740: .4byte 0x00004050
_08035744: .4byte 0x000004BB
_08035748: .4byte gBgScrollRegs
_0803574C: .4byte 0x000004AC

	thumb_func_start sub_8035750
sub_8035750: @ 0x08035750
	push {r4, r5, r6, r7, lr}
	ldr r0, _080357BC @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080357C0 @ =IWRAM_START + 0x2CC
	adds r7, r1, r0
	ldr r0, _080357C4 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08035804
	movs r3, #0
	ldr r0, _080357C8 @ =gUnknown_030055B8
	ldrb r1, [r0]
	movs r2, #1
	ands r1, r2
	mov ip, r0
	cmp r1, #0
	beq _08035804
	movs r5, #1
	ldr r2, _080357CC @ =gUnknown_030054D4
_0803577E:
	ldr r1, _080357D0 @ =gMultiSioStatusFlags
	adds r0, r5, #0
	lsls r0, r3
	ldr r4, [r1]
	ands r4, r0
	cmp r4, #0
	bne _080357EC
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xb4
	bls _080357F0
	movs r0, #0
	ldr r1, _080357D4 @ =0x0000FFFF
	bl TasksDestroyInPriorityRange
	ldr r1, _080357D8 @ =gUnknown_03002AE4
	ldr r0, _080357DC @ =gUnknown_0300287C
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, _080357E0 @ =gUnknown_03005390
	strb r4, [r0]
	ldr r1, _080357E4 @ =gUnknown_03004D5C
	ldr r0, _080357E8 @ =gUnknown_03002A84
	ldrb r0, [r0]
	strb r0, [r1]
	bl MultiPakCommunicationError
	b _08035928
	.align 2, 0
_080357BC: .4byte gCurTask
_080357C0: .4byte IWRAM_START + 0x2CC
_080357C4: .4byte gGameMode
_080357C8: .4byte gUnknown_030055B8
_080357CC: .4byte gUnknown_030054D4
_080357D0: .4byte gMultiSioStatusFlags
_080357D4: .4byte 0x0000FFFF
_080357D8: .4byte gUnknown_03002AE4
_080357DC: .4byte gUnknown_0300287C
_080357E0: .4byte gUnknown_03005390
_080357E4: .4byte gUnknown_03004D5C
_080357E8: .4byte gUnknown_03002A84
_080357EC:
	movs r0, #0
	strb r0, [r2]
_080357F0:
	adds r2, #1
	adds r3, #1
	cmp r3, #3
	bhi _08035804
	mov r1, ip
	ldrb r0, [r1]
	asrs r0, r3
	ands r0, r5
	cmp r0, #0
	bne _0803577E
_08035804:
	ldrh r0, [r7, #0x16]
	subs r0, #0x10
	strh r0, [r7, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _08035816
	movs r0, #0x50
	strh r0, [r7, #0x16]
_08035816:
	movs r2, #0x96
	lsls r2, r2, #3
	adds r7, r6, r2
	ldr r3, _080358A8 @ =gSineTable
	ldr r2, _080358AC @ =gUnknown_080D74E8
	ldr r0, _080358B0 @ =0x000004BB
	adds r5, r6, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r7]
	adds r0, r0, r1
	str r0, [r7]
	ldr r0, _080358B4 @ =0x000004B4
	adds r4, r6, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x15
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _080358B8 @ =gUnknown_080D7358
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r0, #8
	ldr r0, [r7]
	cmp r0, r2
	ble _08035892
	str r2, [r7]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r4]
	movs r0, #0xd7
	bl m4aSongNumStart
	ldr r0, _080358BC @ =gCurTask
	ldr r1, [r0]
	ldr r0, _080358C0 @ =sub_803594C
	str r0, [r1, #8]
_08035892:
	ldr r2, _080358C4 @ =0x000004AC
	adds r1, r6, r2
	ldr r0, [r7]
	ldr r2, _080358C8 @ =0xFFFF8800
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _080358CC
	movs r0, #0
	str r0, [r1]
	b _080358D6
	.align 2, 0
_080358A8: .4byte gSineTable
_080358AC: .4byte gUnknown_080D74E8
_080358B0: .4byte 0x000004BB
_080358B4: .4byte 0x000004B4
_080358B8: .4byte gUnknown_080D7358
_080358BC: .4byte gCurTask
_080358C0: .4byte sub_803594C
_080358C4: .4byte 0x000004AC
_080358C8: .4byte 0xFFFF8800
_080358CC:
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, r2
	ble _080358D6
	str r2, [r1]
_080358D6:
	ldr r0, _08035930 @ =gInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080358EC
	movs r0, #0x98
	lsls r0, r0, #3
	adds r1, r6, r0
	movs r0, #1
	strb r0, [r1]
_080358EC:
	ldr r0, _08035934 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08035916
	ldr r1, _08035938 @ =gMultiSioSend
	ldr r0, _0803593C @ =0x00004050
	strh r0, [r1]
	ldr r2, _08035940 @ =0x000004BB
	adds r0, r6, r2
	ldrb r0, [r0]
	strb r0, [r1, #2]
	subs r2, #0xb
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1, #4]
	adds r2, #4
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strb r0, [r1, #3]
_08035916:
	ldr r1, _08035944 @ =gBgScrollRegs
	ldr r2, _08035948 @ =0x000004AC
	adds r0, r6, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_8035FCC
_08035928:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035930: .4byte gInput
_08035934: .4byte gGameMode
_08035938: .4byte gMultiSioSend
_0803593C: .4byte 0x00004050
_08035940: .4byte 0x000004BB
_08035944: .4byte gBgScrollRegs
_08035948: .4byte 0x000004AC

	thumb_func_start sub_803594C
sub_803594C: @ 0x0803594C
	push {r4, lr}
	ldr r3, _080359B4 @ =gCurTask
	ldr r0, [r3]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r2, r0
	ldr r0, _080359B8 @ =IWRAM_START + 0x2CC
	adds r1, r2, r0
	ldrh r0, [r1, #0x16]
	subs r0, #0x10
	strh r0, [r1, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _08035970
	movs r0, #0x50
	strh r0, [r1, #0x16]
_08035970:
	ldr r0, _080359BC @ =IWRAM_START + 0x4BE
	adds r1, r2, r0
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #5
	bls _08035988
	ldr r1, [r3]
	ldr r0, _080359C0 @ =sub_8035124
	str r0, [r1, #8]
_08035988:
	ldr r0, _080359C4 @ =gInput
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803599C
	ldr r3, _080359C8 @ =IWRAM_START + 0x4C0
	adds r1, r2, r3
	movs r0, #1
	strb r0, [r1]
_0803599C:
	ldr r1, _080359CC @ =gBgScrollRegs
	ldr r3, _080359D0 @ =IWRAM_START + 0x4AC
	adds r0, r2, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080359B4: .4byte gCurTask
_080359B8: .4byte IWRAM_START + 0x2CC
_080359BC: .4byte IWRAM_START + 0x4BE
_080359C0: .4byte sub_8035124
_080359C4: .4byte gInput
_080359C8: .4byte IWRAM_START + 0x4C0
_080359CC: .4byte gBgScrollRegs
_080359D0: .4byte IWRAM_START + 0x4AC

	thumb_func_start sub_80359D4
sub_80359D4: @ 0x080359D4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _08035A94 @ =gCurTask
	mov sb, r0
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov r8, r0
	ldr r2, _08035A98 @ =IWRAM_START + 0x2CC
	adds r1, r7, r2
	ldrh r0, [r1, #0x16]
	subs r0, #0x10
	strh r0, [r1, #0x16]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x4f
	bgt _08035A02
	movs r0, #0x50
	strh r0, [r1, #0x16]
_08035A02:
	ldr r0, _08035A9C @ =IWRAM_START + 0x4B0
	adds r6, r7, r0
	ldr r3, _08035AA0 @ =gSineTable
	ldr r2, _08035AA4 @ =gUnknown_080D74E8
	ldr r1, _08035AA8 @ =IWRAM_START + 0x4BB
	adds r5, r7, r1
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	ldr r0, _08035AAC @ =IWRAM_START + 0x4B4
	adds r4, r7, r0
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x16
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r1, _08035AB0 @ =gUnknown_080D7358
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r0, #8
	ldr r0, [r6]
	cmp r0, r2
	ble _08035A7C
	str r2, [r6]
	ldrb r0, [r5]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #8
	str r0, [r4]
	movs r0, #0xd7
	bl m4aSongNumStart
	mov r2, sb
	ldr r1, [r2]
	ldr r0, _08035AB4 @ =sub_8035AF0
	str r0, [r1, #8]
_08035A7C:
	ldr r0, _08035AB8 @ =IWRAM_START + 0x4AC
	adds r1, r7, r0
	ldr r0, [r6]
	ldr r2, _08035ABC @ =0xFFFF8800
	adds r0, r0, r2
	str r0, [r1]
	cmp r0, #0
	bge _08035AC0
	movs r0, #0
	str r0, [r1]
	b _08035ACA
	.align 2, 0
_08035A94: .4byte gCurTask
_08035A98: .4byte IWRAM_START + 0x2CC
_08035A9C: .4byte IWRAM_START + 0x4B0
_08035AA0: .4byte gSineTable
_08035AA4: .4byte gUnknown_080D74E8
_08035AA8: .4byte IWRAM_START + 0x4BB
_08035AAC: .4byte IWRAM_START + 0x4B4
_08035AB0: .4byte gUnknown_080D7358
_08035AB4: .4byte sub_8035AF0
_08035AB8: .4byte IWRAM_START + 0x4AC
_08035ABC: .4byte 0xFFFF8800
_08035AC0:
	movs r2, #0xf0
	lsls r2, r2, #8
	cmp r0, r2
	ble _08035ACA
	str r2, [r1]
_08035ACA:
	ldr r1, _08035AE8 @ =gBgScrollRegs
	ldr r0, _08035AEC @ =0x000004AC
	add r0, r8
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	mov r0, r8
	bl sub_8035FCC
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035AE8: .4byte gBgScrollRegs
_08035AEC: .4byte 0x000004AC

	thumb_func_start sub_8035AF0
sub_8035AF0: @ 0x08035AF0
	push {r4, lr}
	ldr r4, _08035B38 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	ldr r0, _08035B3C @ =IWRAM_START + 0x4BE
	adds r1, r1, r0
	ldrb r0, [r1]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r3, #0
	strb r0, [r1]
	cmp r0, #0x3c
	bls _08035B2C
	strh r3, [r2]
	strh r3, [r2, #4]
	movs r0, #1
	strh r0, [r2, #2]
	movs r0, #0xc0
	lsls r0, r0, #1
	strh r0, [r2, #6]
	movs r0, #0xff
	strh r0, [r2, #8]
	strh r3, [r2, #0xa]
	ldr r1, [r4]
	ldr r0, _08035B40 @ =sub_8035E70
	str r0, [r1, #8]
_08035B2C:
	adds r0, r2, #0
	bl sub_8035FCC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035B38: .4byte gCurTask
_08035B3C: .4byte IWRAM_START + 0x4BE
_08035B40: .4byte sub_8035E70

	thumb_func_start sub_8035B44
sub_8035B44: @ 0x08035B44
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r4, #0
	ldr r1, _08035BF4 @ =0x000004BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r4, r0
	bhs _08035B9C
	ldr r7, _08035BF8 @ =gUnknown_080D74A8
	adds r0, r7, #2
	mov r8, r0
_08035B5E:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	adds r0, #0xbc
	adds r5, r6, r0
	lsls r2, r4, #2
	adds r3, r2, r7
	ldr r1, _08035BFC @ =0x000004AC
	adds r0, r6, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	add r2, r8
	ldrh r0, [r2]
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	ldr r1, _08035BF4 @ =0x000004BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r4, r0
	blo _08035B5E
_08035B9C:
	ldr r0, _08035BF4 @ =0x000004BA
	adds r4, r6, r0
	ldrb r2, [r4]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0xbc
	adds r5, r6, r0
	ldr r3, _08035BF8 @ =gUnknown_080D74A8
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r1, _08035BFC @ =0x000004AC
	adds r0, r6, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	ldrh r0, [r2]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r3, #2
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_8004558
	movs r4, #0
	cmp r0, #0
	bne _08035BDA
	movs r4, #1
_08035BDA:
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r6, #0
	bl sub_8035C00
	adds r0, r4, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08035BF4: .4byte 0x000004BA
_08035BF8: .4byte gUnknown_080D74A8
_08035BFC: .4byte 0x000004AC

	thumb_func_start sub_8035C00
sub_8035C00: @ 0x08035C00
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r0, _08035D68 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	mov r8, r1
	cmp r0, #1
	bgt _08035C1E
	movs r2, #0
	mov r8, r2
_08035C1E:
	adds r5, r6, #0
	adds r5, #0x8c
	movs r3, #0x96
	lsls r3, r3, #3
	adds r0, r6, r3
	ldr r2, _08035D6C @ =0x000004AC
	adds r1, r6, r2
	ldr r0, [r0]
	ldr r1, [r1]
	subs r0, r0, r1
	asrs r0, r0, #8
	adds r0, #5
	strh r0, [r5, #0x16]
	adds r3, #4
	adds r0, r6, r3
	ldr r0, [r0]
	asrs r0, r0, #8
	adds r0, #6
	strh r0, [r5, #0x18]
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, _08035D70 @ =0x000004BB
	adds r7, r6, r0
	ldrb r0, [r7]
	cmp r0, #0xd
	bhi _08035CAA
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r5, r6, r1
	ldr r4, _08035D74 @ =0x000002F6
	strh r4, [r5, #0xa]
	ldrb r0, [r7]
	lsrs r0, r0, #1
	movs r2, #0x97
	lsls r2, r2, #2
	adds r1, r6, r2
	strb r0, [r1]
	ldr r3, _08035D78 @ =0x0000025D
	adds r1, r6, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0x9b
	lsls r0, r0, #2
	adds r5, r6, r0
	strh r4, [r5, #0xa]
	ldrb r1, [r7]
	movs r0, #1
	ands r0, r1
	movs r2, #0xa3
	lsls r2, r2, #2
	adds r1, r6, r2
	strb r0, [r1]
	ldr r3, _08035D7C @ =0x0000028D
	adds r1, r6, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
_08035CAA:
	movs r0, #0xa7
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r1, _08035D80 @ =gUnknown_080D7418
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r1, #2
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r2, #0xaf
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	ldr r3, _08035D84 @ =0x000002BD
	adds r1, r6, r3
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xb3
	lsls r0, r0, #2
	adds r5, r6, r0
	ldr r2, _08035D88 @ =gUnknown_080D7398
	ldrb r0, [r7]
	mov r3, r8
	lsls r1, r3, #0x18
	asrs r1, r1, #0x14
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r5, #0xa]
	ldrb r0, [r7]
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r2, #2
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r2, #0xbb
	lsls r2, r2, #2
	adds r0, r6, r2
	strb r1, [r0]
	ldr r3, _08035D8C @ =0x000002ED
	adds r1, r6, r3
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	movs r0, #0xbf
	lsls r0, r0, #2
	adds r5, r6, r0
	adds r0, r5, #0
	bl sub_80051E8
	ldr r0, _08035D90 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _08035DBE
	movs r4, #0
_08035D3C:
	ldr r0, _08035D68 @ =gLoadedSaveGame
	ldr r1, [r0]
	ldr r0, _08035D94 @ =gSelectedCharacter
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, #0xc
	adds r1, r1, r0
	ldrb r0, [r1]
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08035D98
	lsls r1, r4, #1
	adds r0, r1, r4
	lsls r0, r0, #4
	movs r2, #0xd7
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r5, r6, r0
	b _08035DA0
	.align 2, 0
_08035D68: .4byte gLoadedSaveGame
_08035D6C: .4byte 0x000004AC
_08035D70: .4byte 0x000004BB
_08035D74: .4byte 0x000002F6
_08035D78: .4byte 0x0000025D
_08035D7C: .4byte 0x0000028D
_08035D80: .4byte gUnknown_080D7418
_08035D84: .4byte 0x000002BD
_08035D88: .4byte gUnknown_080D7398
_08035D8C: .4byte 0x000002ED
_08035D90: .4byte gGameMode
_08035D94: .4byte gSelectedCharacter
_08035D98:
	movs r3, #0xcb
	lsls r3, r3, #2
	adds r5, r6, r3
	lsls r1, r4, #1
_08035DA0:
	adds r0, r1, r4
	lsls r0, r0, #3
	adds r0, #0x24
	strh r0, [r5, #0x16]
	adds r0, r5, #0
	bl sub_8004558
	adds r0, r5, #0
	bl sub_80051E8
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #6
	bls _08035D3C
_08035DBE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8035DC8
sub_8035DC8: @ 0x08035DC8
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x90
	ldr r0, [r4]
	cmp r0, #0
	beq _08035DDE
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035DDE:
	movs r5, #0
	adds r7, r6, #0
	adds r7, #0xc0
_08035DE4:
	lsls r0, r5, #1
	adds r0, r0, r5
	lsls r0, r0, #4
	adds r4, r7, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035DFA
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035DFA:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #7
	bls _08035DE4
	movs r0, #0x90
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E18
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E18:
	movs r0, #0x9c
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E2C
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E2C:
	movs r0, #0xa8
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E40
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E40:
	movs r0, #0xb4
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E54
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E54:
	movs r0, #0xc0
	lsls r0, r0, #2
	adds r4, r6, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _08035E68
	bl VramFree
	movs r0, #0
	str r0, [r4]
_08035E68:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8035E70
sub_8035E70: @ 0x08035E70
	push {r4, r5, lr}
	ldr r0, _08035EAC @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08035ED0
	adds r0, r4, #0
	bl sub_8035DC8
	ldr r2, _08035EB0 @ =gCurrentLevel
	ldr r1, _08035EB4 @ =gUnknown_080D7508
	ldr r3, _08035EB8 @ =IWRAM_START + 0x4BB
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	cmp r0, #0x1d
	beq _08035EBC
	bl sub_801A770
	b _08035EC0
	.align 2, 0
_08035EAC: .4byte gCurTask
_08035EB0: .4byte gCurrentLevel
_08035EB4: .4byte gUnknown_080D7508
_08035EB8: .4byte IWRAM_START + 0x4BB
_08035EBC:
	bl sub_8036C54
_08035EC0:
	ldr r0, _08035ECC @ =gCurTask
	ldr r0, [r0]
	bl TaskDestroy
	b _08035EE2
	.align 2, 0
_08035ECC: .4byte gCurTask
_08035ED0:
	ldr r1, _08035EE8 @ =gBgScrollRegs
	ldr r2, _08035EEC @ =IWRAM_START + 0x4AC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
_08035EE2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035EE8: .4byte gBgScrollRegs
_08035EEC: .4byte IWRAM_START + 0x4AC

	thumb_func_start sub_8035EF0
sub_8035EF0: @ 0x08035EF0
	push {r4, r5, r6, lr}
	ldr r6, _08035F30 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08035F40
	adds r0, r4, #0
	bl sub_8035DC8
	ldr r2, _08035F34 @ =gCurrentLevel
	ldr r1, _08035F38 @ =gUnknown_080D7508
	ldr r3, _08035F3C @ =IWRAM_START + 0x4BB
	adds r0, r5, r3
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	bl sub_801A770
	ldr r0, [r6]
	bl TaskDestroy
	b _08035F52
	.align 2, 0
_08035F30: .4byte gCurTask
_08035F34: .4byte gCurrentLevel
_08035F38: .4byte gUnknown_080D7508
_08035F3C: .4byte IWRAM_START + 0x4BB
_08035F40:
	ldr r1, _08035F58 @ =gBgScrollRegs
	ldr r2, _08035F5C @ =IWRAM_START + 0x4AC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
_08035F52:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035F58: .4byte gBgScrollRegs
_08035F5C: .4byte IWRAM_START + 0x4AC

	thumb_func_start sub_8035F60
sub_8035F60: @ 0x08035F60
	push {r4, r5, r6, lr}
	ldr r6, _08035FA0 @ =gCurTask
	ldr r0, [r6]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r5, r0
	adds r0, r4, #0
	bl sub_802D4CC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bne _08035FAC
	adds r0, r4, #0
	bl sub_8035DC8
	ldr r0, _08035FA4 @ =gSelectedCharacter
	ldrb r0, [r0]
	ldr r1, _08035FA8 @ =gLoadedSaveGame
	ldr r1, [r1]
	ldrb r2, [r1, #0x13]
	movs r1, #0x10
	ands r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl CreateCharacterSelectionScreen
	ldr r0, [r6]
	bl TaskDestroy
	b _08035FBE
	.align 2, 0
_08035FA0: .4byte gCurTask
_08035FA4: .4byte gSelectedCharacter
_08035FA8: .4byte gLoadedSaveGame
_08035FAC:
	ldr r1, _08035FC4 @ =gBgScrollRegs
	ldr r2, _08035FC8 @ =IWRAM_START + 0x4AC
	adds r0, r5, r2
	ldr r0, [r0]
	asrs r0, r0, #8
	strh r0, [r1]
	adds r0, r4, #0
	bl sub_8035FCC
_08035FBE:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035FC4: .4byte gBgScrollRegs
_08035FC8: .4byte IWRAM_START + 0x4AC

	thumb_func_start sub_8035FCC
sub_8035FCC: @ 0x08035FCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r6, #0
	ldr r1, _08036034 @ =0x000004BA
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r6, r0
	bhs _08036024
	ldr r7, _08036038 @ =gUnknown_080D74A8
	adds r0, r7, #2
	mov r8, r0
_08035FE6:
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #4
	adds r4, #0xbc
	adds r4, r5, r4
	lsls r2, r6, #2
	adds r3, r2, r7
	ldr r1, _0803603C @ =0x000004AC
	adds r0, r5, r1
	ldr r1, [r0]
	asrs r1, r1, #8
	ldrh r0, [r3]
	subs r0, r0, r1
	strh r0, [r4, #0x16]
	add r2, r8
	ldrh r0, [r2]
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08036034 @ =0x000004BA
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r6, r0
	blo _08035FE6
_08036024:
	adds r0, r5, #0
	bl sub_8035C00
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08036034: .4byte 0x000004BA
_08036038: .4byte gUnknown_080D74A8
_0803603C: .4byte 0x000004AC

	thumb_func_start sub_8036040
sub_8036040: @ 0x08036040
	push {lr}
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	bl sub_8035DC8
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036054
sub_8036054: @ 0x08036054
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r2, _080360A8 @ =gUnknown_03005424
	ldrh r0, [r2]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080360AC @ =sub_8036168
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _080360B0 @ =sub_8036638
	str r1, [sp]
	movs r1, #0x6c
	movs r3, #0
	bl TaskCreate
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r2, r0
	ldr r1, _080360B4 @ =IWRAM_START + 0x6A
	adds r0, r2, r1
	movs r1, #0
	strb r1, [r0]
	ldr r3, _080360B8 @ =IWRAM_START + 0x6B
	adds r0, r2, r3
	strb r1, [r0]
	cmp r4, #0
	bne _080360C0
	ldr r0, _080360BC @ =IWRAM_START + 0x68
	adds r1, r2, r0
	movs r0, #0x9b
	lsls r0, r0, #1
	b _080360C6
	.align 2, 0
_080360A8: .4byte gUnknown_03005424
_080360AC: .4byte sub_8036168
_080360B0: .4byte sub_8036638
_080360B4: .4byte IWRAM_START + 0x6A
_080360B8: .4byte IWRAM_START + 0x6B
_080360BC: .4byte IWRAM_START + 0x68
_080360C0:
	ldr r3, _0803615C @ =IWRAM_START + 0x68
	adds r1, r2, r3
	movs r0, #0xb4
_080360C6:
	strh r0, [r1]
	adds r4, r7, #0
	adds r4, #0x30
	movs r0, #4
	bl VramMalloc
	str r0, [r4, #4]
	movs r6, #0
	movs r5, #0
	ldr r0, _08036160 @ =0x00000469
	strh r0, [r4, #0xa]
	adds r0, r7, #0
	adds r0, #0x50
	strb r6, [r0]
	adds r1, r7, #0
	adds r1, #0x51
	movs r0, #0xff
	strb r0, [r1]
	adds r0, #1
	strh r0, [r4, #0x1a]
	strh r5, [r4, #8]
	strh r5, [r4, #0x14]
	strh r5, [r4, #0x1c]
	adds r0, r7, #0
	adds r0, #0x52
	movs r1, #0x10
	mov sb, r1
	mov r3, sb
	strb r3, [r0]
	adds r0, #3
	strb r6, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	str r0, [r4, #0x28]
	str r5, [r4, #0x10]
	movs r0, #0xe
	bl VramMalloc
	str r0, [r7, #4]
	ldr r0, _08036164 @ =0x00000212
	strh r0, [r7, #0xa]
	adds r0, r7, #0
	adds r0, #0x20
	strb r6, [r0]
	movs r0, #0x90
	lsls r0, r0, #3
	strh r0, [r7, #0x1a]
	strh r5, [r7, #8]
	strh r5, [r7, #0x14]
	strh r5, [r7, #0x1c]
	adds r1, r7, #0
	adds r1, #0x21
	movs r0, #1
	rsbs r0, r0, #0
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x22
	mov r1, sb
	strb r1, [r0]
	adds r0, #3
	strb r6, [r0]
	mov r3, r8
	str r3, [r7, #0x28]
	movs r0, #0x90
	lsls r0, r0, #6
	str r0, [r7, #0x10]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803615C: .4byte IWRAM_START + 0x68
_08036160: .4byte 0x00000469
_08036164: .4byte 0x00000212

	thumb_func_start sub_8036168
sub_8036168: @ 0x08036168
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _080361B4 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r1, r0
	ldr r0, _080361B8 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bhi _0803619E
	ldr r0, _080361BC @ =IWRAM_START + 0x68
	adds r2, r1, r0
	movs r1, #0
	ldrsh r0, [r2, r1]
	cmp r0, #0xb4
	ble _0803619E
	ldr r0, _080361C0 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _0803619E
	movs r0, #0xb4
	strh r0, [r2]
_0803619E:
	adds r0, r6, #0
	adds r0, #0x68
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #0xb4
	bne _080361C4
	movs r0, #0xd0
	bl m4aSongNumStart
	b _080361DA
	.align 2, 0
_080361B4: .4byte gCurTask
_080361B8: .4byte gGameMode
_080361BC: .4byte IWRAM_START + 0x68
_080361C0: .4byte gPressedKeys
_080361C4:
	cmp r1, #0x78
	bne _080361D0
	movs r0, #0xd1
	bl m4aSongNumStart
	b _080361DA
_080361D0:
	cmp r1, #0x3c
	bne _080361DA
	movs r0, #0xd2
	bl m4aSongNumStart
_080361DA:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	bne _08036268
	ldr r3, _0803621C @ =gUnknown_030059E0
	ldr r0, [r3, #0x20]
	ldr r1, _08036220 @ =0xFFDFFFFF
	ands r0, r1
	str r0, [r3, #0x20]
	ldr r2, _08036224 @ =gUnknown_03005424
	ldrh r1, [r2]
	ldr r0, _08036228 @ =0x0000FFFE
	ands r0, r1
	ldr r1, _0803622C @ =0x0000FEFF
	ands r0, r1
	strh r0, [r2]
	adds r1, r3, #0
	adds r1, #0x64
	movs r0, #9
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x6a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08036230
	movs r0, #0x90
	lsls r0, r0, #4
	b _08036234
	.align 2, 0
_0803621C: .4byte gUnknown_030059E0
_08036220: .4byte 0xFFDFFFFF
_08036224: .4byte gUnknown_03005424
_08036228: .4byte 0x0000FFFE
_0803622C: .4byte 0x0000FEFF
_08036230:
	movs r0, #0x80
	lsls r0, r0, #3
_08036234:
	strh r0, [r3, #0x14]
	bl sub_8018818
	bl sub_8036400
	ldr r1, _0803625C @ =gUnknown_030059E0
	ldr r0, [r1, #8]
	asrs r0, r0, #8
	str r0, [r6, #0x60]
	ldr r0, [r1, #0xc]
	asrs r0, r0, #8
	str r0, [r6, #0x64]
	movs r0, #0xd3
	bl m4aSongNumStart
	ldr r0, _08036260 @ =gCurTask
	ldr r1, [r0]
	ldr r0, _08036264 @ =sub_8036398
	str r0, [r1, #8]
	b _080362A0
	.align 2, 0
_0803625C: .4byte gUnknown_030059E0
_08036260: .4byte gCurTask
_08036264: .4byte sub_8036398
_08036268:
	cmp r0, #4
	bgt _0803628C
	ldr r0, _08036288 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080362A0
	adds r0, r6, #0
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	bne _080362A0
	adds r1, r6, #0
	adds r1, #0x6a
	b _0803629C
	.align 2, 0
_08036288: .4byte gPressedKeys
_0803628C:
	ldr r0, _08036364 @ =gPressedKeys
	ldrh r1, [r0]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080362A0
	adds r1, r6, #0
	adds r1, #0x6b
_0803629C:
	movs r0, #1
	strb r0, [r1]
_080362A0:
	ldr r5, _08036368 @ =gUnknown_030059E0
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r7, _0803636C @ =gUnknown_03005960
	ldr r1, [r7]
	subs r0, r0, r1
	strh r0, [r6, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	strh r0, [r6, #0x18]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
	mov r1, r8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0xb3
	bgt _0803630E
	adds r4, r6, #0
	adds r4, #0x30
	movs r1, #0x3c
	bl Div
	movs r1, #2
	subs r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x50
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x51
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, [r5, #8]
	asrs r0, r0, #8
	ldr r1, [r7]
	subs r0, r0, r1
	adds r0, #0x18
	strh r0, [r4, #0x16]
	ldr r0, [r5, #0xc]
	asrs r0, r0, #8
	ldr r1, [r7, #4]
	subs r0, r0, r1
	subs r0, #0x18
	strh r0, [r4, #0x18]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_0803630E:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #0x46
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi _0803638C
	ldr r3, _08036370 @ =gUnknown_080D7518
	ldr r2, _08036374 @ =gSelectedCharacter
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrh r1, [r0, #4]
	adds r0, r5, #0
	adds r0, #0x68
	strh r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r0, r0, #3
	adds r0, r0, r3
	ldrb r0, [r0, #6]
	adds r1, r5, #0
	adds r1, #0x6a
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08036378 @ =gGameMode
	ldrb r0, [r0]
	cmp r0, #2
	bls _08036380
	adds r0, r5, #0
	adds r0, #0x90
	ldr r1, [r0]
	ldr r0, _0803637C @ =0x04000128
	ldr r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	adds r1, #0x31
	strb r0, [r1]
	b _0803638C
	.align 2, 0
_08036364: .4byte gPressedKeys
_08036368: .4byte gUnknown_030059E0
_0803636C: .4byte gUnknown_03005960
_08036370: .4byte gUnknown_080D7518
_08036374: .4byte gSelectedCharacter
_08036378: .4byte gGameMode
_0803637C: .4byte 0x04000128
_08036380:
	adds r0, r5, #0
	adds r0, #0x90
	ldr r0, [r0]
	adds r0, #0x31
	movs r1, #0
	strb r1, [r0]
_0803638C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036398
sub_8036398: @ 0x08036398
	push {r4, r5, r6, lr}
	ldr r4, _080363E4 @ =gCurTask
	ldr r0, [r4]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r1, r0
	adds r6, r5, #0
	ldr r0, [r5, #0x60]
	ldr r3, _080363E8 @ =gUnknown_03005960
	ldr r1, [r3]
	subs r0, r0, r1
	strh r0, [r5, #0x16]
	ldr r2, [r5, #0x64]
	ldr r1, [r3, #4]
	subs r2, r2, r1
	strh r2, [r5, #0x18]
	adds r0, #0x80
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0x11
	cmp r0, r1
	bhi _080363DA
	movs r1, #0x18
	ldrsh r0, [r5, r1]
	adds r0, #0x80
	cmp r0, #0
	blt _080363DA
	lsls r1, r2, #0x10
	movs r0, #0x90
	lsls r0, r0, #0x11
	cmp r1, r0
	ble _080363EC
_080363DA:
	ldr r0, [r4]
	bl TaskDestroy
	b _080363F8
	.align 2, 0
_080363E4: .4byte gCurTask
_080363E8: .4byte gUnknown_03005960
_080363EC:
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	bl sub_80051E8
_080363F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036400
sub_8036400: @ 0x08036400
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _080364EC @ =sub_8036524
	movs r2, #0xc0
	lsls r2, r2, #6
	ldr r1, _080364F0 @ =sub_8036654
	str r1, [sp]
	movs r1, #0x7c
	movs r3, #0
	bl TaskCreate
	ldrh r5, [r0, #6]
	movs r4, #0xc0
	lsls r4, r4, #0x12
	adds r4, r5, r4
	ldr r0, _080364F4 @ =IWRAM_START + 0x78
	adds r1, r5, r0
	movs r0, #0
	mov r8, r0
	movs r0, #0x3c
	strh r0, [r1]
	movs r0, #0x40
	bl VramMalloc
	str r0, [r4, #4]
	ldr r1, _080364F8 @ =0x0000046A
	strh r1, [r4, #0xa]
	ldr r1, _080364FC @ =IWRAM_START + 0x20
	adds r0, r5, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08036500 @ =IWRAM_START + 0x21
	adds r1, r5, r0
	movs r0, #0xff
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r4, #0x1a]
	mov r0, r8
	strh r0, [r4, #8]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x1c]
	ldr r1, _08036504 @ =IWRAM_START + 0x22
	adds r0, r5, r1
	movs r1, #0x10
	mov sb, r1
	mov r1, sb
	strb r1, [r0]
	ldr r1, _08036508 @ =IWRAM_START + 0x25
	adds r0, r5, r1
	movs r1, #0
	strb r1, [r0]
	movs r7, #1
	rsbs r7, r7, #0
	str r7, [r4, #0x28]
	ldr r6, _0803650C @ =gUnknown_030054B8
	ldrb r0, [r6]
	adds r1, r0, #1
	strb r1, [r6]
	movs r1, #0x60
	mov sl, r1
	mov r1, sl
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x10]
	ldr r0, _08036510 @ =IWRAM_START + 0x3C
	adds r4, r5, r0
	movs r0, #0x40
	bl VramMalloc
	str r0, [r4, #4]
	ldr r1, _080364F8 @ =0x0000046A
	strh r1, [r4, #0xa]
	ldr r0, _08036514 @ =IWRAM_START + 0x5C
	adds r1, r5, r0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08036518 @ =IWRAM_START + 0x5D
	adds r1, r5, r0
	adds r0, r7, #0
	strb r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r4, #0x1a]
	mov r0, r8
	strh r0, [r4, #8]
	strh r0, [r4, #0x14]
	strh r0, [r4, #0x1c]
	ldr r1, _0803651C @ =IWRAM_START + 0x5E
	adds r0, r5, r1
	mov r1, sb
	strb r1, [r0]
	ldr r0, _08036520 @ =IWRAM_START + 0x61
	adds r5, r5, r0
	movs r1, #0
	strb r1, [r5]
	str r7, [r4, #0x28]
	ldrb r0, [r6]
	adds r1, r0, #1
	strb r1, [r6]
	mov r1, sl
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x10]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080364EC: .4byte sub_8036524
_080364F0: .4byte sub_8036654
_080364F4: .4byte IWRAM_START + 0x78
_080364F8: .4byte 0x0000046A
_080364FC: .4byte IWRAM_START + 0x20
_08036500: .4byte IWRAM_START + 0x21
_08036504: .4byte IWRAM_START + 0x22
_08036508: .4byte IWRAM_START + 0x25
_0803650C: .4byte gUnknown_030054B8
_08036510: .4byte IWRAM_START + 0x3C
_08036514: .4byte IWRAM_START + 0x5C
_08036518: .4byte IWRAM_START + 0x5D
_0803651C: .4byte IWRAM_START + 0x5E
_08036520: .4byte IWRAM_START + 0x61

	thumb_func_start sub_8036524
sub_8036524: @ 0x08036524
	push {r4, r5, r6, r7, lr}
	ldr r0, _0803654C @ =gCurTask
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r7, r1, r0
	adds r0, #0x78
	adds r3, r1, r0
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08036550
	adds r0, r2, #0
	bl TaskDestroy
	b _08036630
	.align 2, 0
_0803654C: .4byte gCurTask
_08036550:
	adds r6, r7, #0
	ldr r2, _08036594 @ =IWRAM_START + 0x30
	adds r5, r1, r2
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x28
	strh r0, [r6, #0x18]
	ldr r2, _08036598 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x60
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r6, #0x10]
	movs r0, #0
	strh r0, [r5]
	ldrh r1, [r3]
	movs r2, #0
	ldrsh r0, [r3, r2]
	cmp r0, #0xf
	bgt _0803659C
	lsls r0, r1, #4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r5, #2]
	ldrh r0, [r3]
	adds r0, #1
	lsls r0, r0, #4
	b _080365A2
	.align 2, 0
_08036594: .4byte IWRAM_START + 0x30
_08036598: .4byte gUnknown_030054B8
_0803659C:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #2]
_080365A2:
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x16]
	movs r4, #0
	strh r0, [r5, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r5, #8]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
	adds r6, r7, #0
	adds r6, #0x3c
	adds r5, r7, #0
	adds r5, #0x6c
	movs r0, #0x78
	strh r0, [r6, #0x16]
	movs r0, #0x28
	strh r0, [r6, #0x18]
	ldr r2, _08036608 @ =gUnknown_030054B8
	ldrb r0, [r2]
	adds r1, r0, #1
	strb r1, [r2]
	movs r1, #0x60
	orrs r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r6, #0x10]
	strh r4, [r5]
	adds r2, r7, #0
	adds r2, #0x78
	ldrh r1, [r2]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0xf
	bgt _0803660C
	lsls r0, r1, #4
	movs r3, #0x80
	lsls r3, r3, #2
	adds r1, r3, #0
	subs r1, r1, r0
	strh r1, [r5, #2]
	ldrh r0, [r2]
	adds r0, #1
	lsls r0, r0, #4
	b _08036612
	.align 2, 0
_08036608: .4byte gUnknown_030054B8
_0803660C:
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r5, #2]
_08036612:
	strh r0, [r5, #4]
	ldrh r0, [r6, #0x16]
	strh r0, [r5, #6]
	ldrh r0, [r6, #0x18]
	strh r0, [r5, #8]
	adds r0, r6, #0
	bl sub_8004558
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8004860
	adds r0, r6, #0
	bl sub_80051E8
_08036630:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8036638
sub_8036638: @ 0x08036638
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #4]
	bl VramFree
	ldr r0, [r4, #0x34]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_8036654
sub_8036654: @ 0x08036654
	push {r4, lr}
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r4, r0
	ldr r0, [r4, #0x40]
	bl VramFree
	ldr r0, [r4, #4]
	bl VramFree
	pop {r4}
	pop {r0}
	bx r0
