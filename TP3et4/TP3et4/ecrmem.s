.data
DW: .word 0
DH: .hword 20  @ Modification : Utilisation de .hword pour un mot de 16 bits
DB: .byte 1   @ Modification : Utilisation de .byte pour un mot de 8 bits

.text
.global main
main:
    @ Affichage de la valeur à l'adresse DW
    LDR r0, LD_DW
    LDR r1, [r0]
    BL EcrHexa32
    BL EcrZdecimal32

    @ Modification de la valeur à l'adresse DW
    MOV r4, #-10
    STR r4, [r0]

    @ Affichage de la nouvelle valeur à l'adresse DW
    LDR r0, LD_DW
    LDR r1, [r0]
    BL EcrHexa32
    BL EcrZdecimal32

    @ Affichage de la valeur à l'adresse DH
    LDR r0, LD_DH
    LDRH r1, [r0]  @ Utilisation de LDRH pour charger un mot de 16 bits
    BL EcrHexa16
    BL EcrZdecimal32

    @ Affichage de la valeur à l'adresse DB
    LDR r0, LD_DB
    LDRB r1, [r0]  @ Utilisation de LDRB pour charger un mot de 8 bits
    BL EcrHexa8
    BL EcrZdecimal32

fin: B exit

LD_DW: .word DW
LD_DH: .word DH
LD_DB: .word DB
