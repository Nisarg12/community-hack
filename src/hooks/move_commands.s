	.align 2
	.global repointed_move_cmds
repointed_move_cmds:
        .incbin "roms/BPRE0.gba", 0x25011C, (0xf8 * 4)
        .word battlescriptcallasm+1

        @@ Jambo51's Battle Script Callasm hack
	.align 2
	.thumb
battlescriptcallasm:
	push {lr}
	push {r1-r7}
	ldr r0, scriptlocation
	ldr r0, [r0, #0x0]
	ldrb r1, [r0, #0x1]
	ldrb r2, [r0, #0x2]
	lsl r2, r2, #0x8
	orr r1, r2
	ldrb r2, [r0, #0x3]
	lsl r2, r2, #0x10
	orr r1, r2
	ldrb r2, [r0, #0x4]
	lsl r2, r2, #0x18
	orr r1, r2
	bl bx_r1
	ldr r0, scriptlocation
	ldr r1, [r0, #0x0]
	add r1, #0x5
	str r1, [r0, #0x0]
	pop {r1-r7}
	pop {r0}
	bx r0
	bx_r1: bx r1
	.align
	scriptlocation: .word 0x02023D74
