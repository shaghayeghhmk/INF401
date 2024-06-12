@ accesmem2.s
.data
D1: .word 266
D2: .hword 42
D3: .byte 12

.text
.global main
main:
    @ Chargement de l'adresse D1 en r3
    LDR r3, LD_D1
    @ Chargement de la valeur en mémoire à l'adresse D1 dans r4
    LDR r4, [r3]
    @ Affichage de l'adresse de D1
    MOV r1, r3
    BL EcrHexa32
    @ Affichage de la valeur lue à l'adresse D1
    MOV r1, r4
    BL EcrNdecimal32

    @ Chargement de l'adresse D2 en r5
    LDR r5, LD_D2
    @ Chargement de la valeur en mémoire à l'adresse D2 dans r6
    LDRH r6, [r5]
    @ Affichage de l'adresse de D2
    MOV r1, r5
    BL EcrHexa32
    @ Affichage de la valeur lue à l'adresse D2
    MOV r1, r6
    BL EcrNdecimal16

    @ Chargement de l'adresse D3 en r7
    LDR r7, LD_D3
    @ Chargement de la valeur en mémoire à l'adresse D3 dans r8
    LDRB r8, [r7]
    @ Affichage de l'adresse de D3
    MOV r1, r7
    BL EcrHexa32
    @ Affichage de la valeur lue à l'adresse D3
    MOV r1, r8
    BL EcrNdecimal8

    @ Fin du programme
    B fin

fin: B exit
LD_D1: .word D1
LD_D2: .word D2
LD_D3: .word D3

