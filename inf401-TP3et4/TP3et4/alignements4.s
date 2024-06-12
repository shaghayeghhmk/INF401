.data
x: .byte 0x01
y: .byte 0x02
z: .byte 0x04
.balign 2
a: .hword 0xABCD
b: .byte 0x08

.text
.global main
main:
    @ Lecture et impression de la valeur de x
    LDR r2, LD_x
    LDR r1, [r2]
    BL EcrHexa8

    @ Lecture et impression de la valeur de y
    LDR r2, LD_y
    LDR r1, [r2]
    BL EcrHexa8

    @ Lecture et impression de la valeur de z
    LDR r2, LD_z
    LDR r1, [r2]
    BL EcrHexa8

    @ Lecture et impression de la valeur de a
    LDR r2, LD_a
    LDR r1, [r2]
    BL EcrHexa16

    @ Lecture et impression de la valeur de b
    LDR r2, LD_b
    LDR r1, [r2]
    BL EcrHexa8


fin:    B exit

LD_x:	.word	x
LD_y:	.word	y
LD_z:	.word	z
LD_a:	.word	a
LD_b:	.word	b
