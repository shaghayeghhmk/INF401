	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"afficher_contenu.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\012#define width %d\012\000"
	.align	2
.LC1:
	.ascii	"#define height %d\012\012\000"
	.align	2
.LC2:
	.ascii	"static unsigned char bits[] = {\012\000"
	.align	2
.LC3:
	.ascii	"\000"
	.align	2
.LC4:
	.ascii	"0x%02x\000"
	.align	2
.LC5:
	.ascii	", \000"
	.align	2
.LC6:
	.ascii	"\012\000"
	.align	2
.LC7:
	.ascii	"};\012\000"
	.text
	.align	2
	.global	afficher_contenu
	.type	afficher_contenu, %function
afficher_contenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r0, .L6
	mov	r1, #168
	bl	afficher_entier
	ldr	r0, .L6+4
	mov	r1, #145
	bl	afficher_entier
	ldr	r0, .L6+8
	ldr	r1, .L6+12
	bl	afficher_chaine
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #12
	str	r3, [fp, #-12]
	b	.L2
.L5:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r0, .L6+16
	mov	r1, r3
	bl	afficher_entier
	ldr	r2, [fp, #-8]
	mov	r3, #3040
	add	r3, r3, #4
	cmp	r2, r3
	beq	.L3
	ldr	r0, .L6+20
	ldr	r1, .L6+12
	bl	afficher_chaine
.L3:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L4
	ldr	r0, .L6+24
	ldr	r1, .L6+12
	bl	afficher_chaine
	mov	r3, #12
	str	r3, [fp, #-12]
.L4:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	mov	r3, #3040
	add	r3, r3, #4
	cmp	r2, r3
	ble	.L5
	ldr	r0, .L6+28
	ldr	r1, .L6+12
	bl	afficher_chaine
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.size	afficher_contenu, .-afficher_contenu
	.ident	"GCC: (GNU) 4.5.3"
