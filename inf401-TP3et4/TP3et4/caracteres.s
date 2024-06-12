
.data
cc: @ ne pas modifier cette partie
    .byte 0x42
    .byte 0x4f
    .byte 0x4e
    .byte 0x4a
    .byte 0x4f
    .byte 0x55
    .byte 0x52
    .byte 0x00     @ code de fin de chaine
    @ la suite pourra être modifiée
    .word 12
    .word 0x11223344
    

cd: .asciz "au revoir..."

.text
.global main
main:
    @ impression de la chaine de caractere d'adresse cc
    ldr r1, LD_cc
    bl EcrChaine

    @ modification de la chaine d'adresse cc
    ldr r1, LD_cc
    ldrb r2, [r1]   @ Charger le premier caractère 'B'
    add r2, r2, #32  @ Convertir en minuscule
    strb r2, [r1]   @ Sauvegarder le premier caractère modifié

    ldr r1, LD_cc
    ldrb r2, [r1, #1]   @ Charger le deuxième caractère 'O'
    add r2, r2, #32      @ Convertir en minuscule
    strb r2, [r1, #1]   @ Sauvegarder le deuxième caractère modifié

    ldr r1, LD_cc
    ldrb r2, [r1, #2]   @ Charger le troisième caractère 'N'
    add r2, r2, #32      @ Convertir en minuscule
    strb r2, [r1, #2]   @ Sauvegarder le troisième caractère modifié

    ldr r1, LD_cc
    ldrb r2, [r1, #3]   @ Charger le quatrième caractère 'J'
    add r2, r2, #32      @ Convertir en minuscule
    strb r2, [r1, #3]   @ Sauvegarder le quatrième caractère modifié

    ldr r1, LD_cc
    ldrb r2, [r1, #4]   @ Charger le cinquième caractère 'O'
    add r2, r2, #32      @ Convertir en minuscule
    strb r2, [r1, #4]   @ Sauvegarder le cinquième caractère modifié

    ldr r1, LD_cc
    ldrb r2, [r1, #5]   @ Charger le sixième caractère 'U'
    add r2, r2, #32      @ Convertir en minuscule
    strb r2, [r1, #5]   @ Sauvegarder le sixième caractère modifié

    ldr r1, LD_cc
    ldrb r2, [r1, #6]   @ Charger le septième caractère 'R'
    add r2, r2, #32      @ Convertir en minuscule
    strb r2, [r1, #6]   @ Sauvegarder le septième caractère modifié
    
    @impression de la chaine cc modifiee
    ldr r1 , LD_cc
    bl EcrChaine 
    @ impression de la chaine au revoir
    ldr r1, LD_cd
    bl EcrChaine
    


    fin: B exit  @ terminaison immédiate du processus (plus tard on saura faire mieux)

LD_cc: .word cc
LD_cd: .word cd



