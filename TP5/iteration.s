.data
debutTAB: .skip 5         @ Chaque élément du tableau est maintenant un octet

.text
.global main
main:
    ldr r0, ptr_debutTAB

    mov r3, #11            @ val <- 11
    mov r2, #0             @ i <- 0
tq: cmp r2, #4            @ i-4 ??
    bgt fintq              @ Si i est supérieur à 4, sortie de la boucle
        @ i <= 4 ou i < 5
        ldr r0, ptr_debutTAB        @ r0 <- debutTAB
        add r0, r0, r2          @ r0 <- r0 + r2 = debutTAB + i (pas de décalage pour les octets)
        strb r3, [r0]           @ MEM[debutTAB+i] <- val (utilisation de strb pour stocker un octet)
        add r2, r2, #1          @ i <- i + 1
        add r3, r3, #11         @ val <- val + 11
    b tq
fintq:  @ i > 4 ou i >= 5

fin:  BX LR

ptr_debutTAB : .word debutTAB
