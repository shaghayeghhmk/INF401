@  Importation des,constantes symboliques WIDTH, HEIGHT, BYTES, BYTES_PER_LINE          
#include "image_bits_include.h"                                                         
                                                                                        
                 .global symetrie_octet                                                 
                 .global permuter_cols                                                  
                 .global symetrie_axe_v                                                 
                 .global permuter_ligne                                                 
                 .global symetrie_axe_h                                                 
                 .global symetrie_axe_h                                                 
                 .global permuter_lignes                                                
                 .global symetrie_axe_v                                                 
                                                                                        
                 .text                                                                  
                                                                                        
@ r0 : parametre reçu adresse                                                           
@ r1 : variable locale octet                                                            
                                                                                        
#ifndef C_SYMETRIE_OCTET                                                                
#ifndef SYMTAB                                                                          
                                                                                        
@  Version avec opérations bit à bit                                                    
                                                                                        
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
	.file	"test.c"
	.text
	.align	2
	.global	symetrie_octet
	.type	symetrie_octet, %function
symetrie_octet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r3, lsr #4
	and	r3, r3, #255
	and	r2, r3, #255
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	and	r3, r3, #255
	orr	r3, r2, r3
	and	r3, r3, #255
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r3, r3, #204
	mov	r3, r3, asr #2
	and	r2, r3, #255
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r3, r3, #51
	mov	r3, r3, asl #2
	and	r3, r3, #255
	orr	r3, r2, r3
	and	r3, r3, #255
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r3, r3, #170
	mov	r3, r3, asr #1
	and	r2, r3, #255
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r3, r3, #85
	mov	r3, r3, asl #1
	and	r3, r3, #255
	orr	r3, r2, r3
	and	r3, r3, #255
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-16]
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	symetrie_octet, .-symetrie_octet
	.align	2
	.global	permuter_cols
	.type	permuter_cols, %function

                                                                                        
#else  // SYMTAB                                                                        
                                                                                        
@ @ Version tabulée                                                                       
@ symetrie_octet:                                                                         
#endif  // SYMTAB                                                                       
#endif  // C_SYMETRIE_OCTET                                                             
@ r0 : parametre tab                                                                    
@ r1 : parametre col                                                                    
                                                                                        
#ifndef C_PERMUTER_COLS                                                                 
                                                                                        
permuter_cols:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #20
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #20
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r1, [fp, #-16]
	ldr	r2, [fp, #-20]
	add	r2, r1, r2
	ldrb	r2, [r2, #0]	@ zero_extendqisi2
	strb	r2, [r3, #0]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	permuter_cols, .-permuter_cols
	.align	2
	.global	symetrie_axe_v
	.type	symetrie_axe_v, %function


#endif // C_PERMUTER_COLS                                                               
                                                                                        
@ r0 : paramètre image                                                                  
                                                                                        
#ifndef C_SYMETRIE_AXE_V    


symetrie_axe_v:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L4
.L5:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r0, r3
	bl	symetrie_octet
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	ldr	r2, [fp, #-8]
	mov	r3, #3040
	add	r3, r3, #4
	cmp	r2, r3
	bls	.L5
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L6
.L9:
	ldr	r2, [fp, #-12]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r3, r3, r2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L7
.L8:
	ldr	r0, [fp, #-20]
	ldr	r1, [fp, #-16]
	bl	permuter_cols
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L7:
	ldr	r3, [fp, #-16]
	cmp	r3, #9
	bls	.L8
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L6:
	ldr	r3, [fp, #-12]
	cmp	r3, #144
	bls	.L9
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	symetrie_axe_v, .-symetrie_axe_v
	.align	2
	.global	permuter_lignes
	.type	permuter_lignes, %function


                                                                                        
#endif // C_SYMETRIE_AXE_V                                                              
@ r0 : tab                                                                              
@ r1 : li                                                                               
                                                                                        
#ifndef C_PERMUTER_LIGNES                                                               
permuter_lignes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-5]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #1
	add	r3, r3, r2
	mov	r2, r3, asl #3
	rsb	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r1, r2, r3
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #28
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #3024
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	strb	r3, [r1, #0]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	mov	r3, r3, asl #28
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r2, r3
	mov	r3, r3, asl #2
	rsb	r3, r2, r3
	add	r3, r3, #3024
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r2, [fp, #-5]
	strb	r2, [r3, #0]
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	permuter_lignes, .-permuter_lignes
	.align	2
	.global	symetrie_axe_h
	.type	symetrie_axe_h, %function



#endif // C_PERMUTER_LIGNES                                                             
                                                                                        
@ r0 : paramètre image                                                                  
                                                                                        
#ifndef  C_SYMETRIE_AXE_H                                                               
symetrie_axe_h:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L12
.L15:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L13
.L14:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	mov	r0, r3
	ldr	r1, [fp, #-8]
	bl	permuter_lignes
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L13:
	ldr	r3, [fp, #-12]
	cmp	r3, #20
	bls	.L14
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L12:
	ldr	r3, [fp, #-8]
	cmp	r3, #71
	bls	.L15
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
	.size	symetrie_axe_h, .-symetrie_axe_h
	.ident	"GCC: (GNU) 4.5.3"

#endif   // C_SYMETRIE_AXE_H 
