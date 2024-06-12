.text
.global main
main:
    mov r1, #15             @ Initialiser x avec U0 = 15

tq: cmp r1, #1             @ Tant que x <> 1
    beq fintq              @ Si x == 1, sortir de la boucle

si: tst r1, #1             @ Tester si x est pair
    bne sinon              @ Si x n'est pas pair, aller à sinon

    lsr r1, r1, #1         @ decaler a droite d'une valeur
    b finsi                @ Aller à la fin de la condition

sinon:
    add r1, r1, r1, LSL #1 @ Si x n'est pas pair, multiplier x par 2 et ajouter 1
    add r1, #1             @ Ajouter 1 à x

finsi:
    b tq                   @ Retourner à la boucle

fintq:
    @ Fin de la boucle lorsque x == 1

fin:
    BX LR                  @ Fin du programme

