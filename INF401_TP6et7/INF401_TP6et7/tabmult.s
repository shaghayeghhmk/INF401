N_MAX = 10

# Section des données
.data
barre:    .byte '|'
          .byte 0
espace:   .byte ' '
          .byte 0
tirets:   .asciz "---"

debutTab: .skip N_MAX*N_MAX*4   @addresse du début du tableau

.text
.global main


main:
    push {lr}


@ Remplissage du tableau avec l'algorithme de multiplication à une seule boucle
mov     r0, #1                  @ Initialiser n_lig (indice de ligne) à 1
mov     r1, #1                  @ Initialiser n_col (indice de colonne) à 1

multiple_loop:
        cmp r0, #N_MAX + 1       @ Comparer n_lig avec N_MAX + 1
        bge end_loop             @ Si n_lig dépasse N_MAX, sortir de la boucle

        cmp r1, #N_MAX + 1       @ Comparer n_col avec N_MAX + 1
        bge next_row             @ Si n_col dépasse N_MAX, passer à la ligne suivante

        mul r2, r0, r1           @ Calculer mult = n_lig * n_col

        @ Calculer le décalage mémoire pour stocker le résultat de la multiplication
        mov r3, #N_MAX           @ Charger N_MAX dans r3
        mul r3, r0, r3           @ Calculer n_lig * N_MAX
        sub r3, r3, #N_MAX       @ Soustraire N_MAX
        add r3, r3, r1           @ Ajouter n_col
        sub r3, r3, #1           @ Soustraire 1 (pour ajuster l'indexation à partir de 0)
        ldr r4, LD_debutTab     @ Charger l'adresse de ptr_debutTab dans r4
        add r4, r4, r3, LSL #2   @ Ajouter le décalage à l'adresse de ptr_debutTab

        str r2, [r4]             @ Stocker le résultat de la multiplication (mult) à l'adresse mémoire calculée

        add r1, r1, #1           @ Incrémenter n_col
        b multiple_loop          @ Répéter la boucle

next_row:
        add r0, r0, #1           @ Incrémenter n_lig pour la ligne suivante
        mov r1, #1               @ Réinitialiser n_col à 1 pour la ligne suivante
        b multiple_loop          @ Répéter la boucle

end_loop:


@ Affichage du tableau - traduction de l'agorithme donné en TP
mov     r0, #0                  @ Initialisation de l'indice de ligne à 0
affichage_loop:
    cmp     r0, #N_MAX           @ Comparaison de l'indice de ligne avec N_MAX
    bge     finboucle1           @ Si l'indice de ligne dépasse N_MAX, terminer la boucle
    mov     r2, #0               @ Initialisation de l'indice de colonne à 0

boucle1:
    cmp     r2, #N_MAX           @ Comparaison de l'indice de colonne avec N_MAX
    bge     finboucle2           @ Si l'indice de colonne dépasse N_MAX, terminer la boucle interne
    ldr     r1, LD_barre         @ Charger le caractère de la barre dans r1
    ldrb    r1, [r1]             @ Charger le caractère de la barre

    bl      EcrCar               @ Afficher le caractère de la barre
    ldr     r3, LD_debutTab      @ Charger l'adresse de début du tableau dans r3
    mov     r10, #4              @ Taille d'un entier en octets
    mul     r8, r0, r10          @ Calculer l'indice de ligne multiplié par la taille d'un entier
    mov     r7, #10              @ Nombre maximum de colonnes
    mul     r4, r8, r7           @ Calculer l'indice de ligne multiplié par le nombre maximum de colonnes
    add     r3, r3, r4           @ Ajouter l'indice de ligne à l'adresse de début du tableau
    mul     r4, r2, r10          @ Calculer l'indice de colonne multiplié par la taille d'un entier
    add     r3, r3, r4           @ Ajouter l'indice de colonne à l'adresse du tableau
    ldrb    r4, [r3]             @ Charger la valeur de l'élément dans r4

    cmp     r4, #100             @ Comparer la valeur de l'élément avec 100
    bge     si1                  @ Si la valeur est supérieure ou égale à 100, passer à la prochaine étape
    ldr     r1, LD_espace        @ Charger le caractère espace dans r1
    ldrb    r1, [r1]             @ Charger le caractère espace
    bl      EcrCar               @ Afficher le caractère espace

si1:
    cmp     r4, #10              @ Comparer la valeur de l'élément avec 10
    bge     si2                  @ Si la valeur est supérieure ou égale à 10, passer à la prochaine étape
    ldr     r1, LD_espace        @ Charger le caractère espace dans r1
    ldrb    r1, [r1]             @ Charger le caractère espace
    bl      EcrCar               @ Afficher le caractère espace

si2:
    mov     r1, r4               @ Charger la valeur dans r1
    bl      EcrNdecim32          @ Afficher la valeur
    add     r2, r2, #1           @ Incrémenter l'indice de colonne
    b       boucle1              @ Boucler sur les colonnes

finboucle2:
    ldr     r1, LD_barre         @ Charger le caractère de la barre dans r1
    ldrb    r1, [r1]             @ Charger le caractère de la barre
    bl      EcrCar               @ Afficher le caractère de la barre
    bl      AlaLigne             @ Aller à la ligne

    @ Écrire la ligne de séparation après chaque ligne du tableau
    mov     r3, #0               @ Initialisation de l'indice de colonne pour la ligne de séparation
    ldr     r1, LD_barre         @ Charger le caractère de la barre dans r1
    ldrb    r1, [r1]             @ Charger le caractère de la barre

boucle_sep:
    cmp     r3, #N_MAX           @ Comparaison de l'indice de colonne pour la ligne de séparation avec N_MAX
    bge     fin_sep              @ Si l'indice de colonne pour la ligne de séparation dépasse N_MAX, terminer la boucle
    ldr     r1, LD_barre         @ Charger le caractère de la barre dans r1
    ldrb    r1, [r1]             @ Charger le caractère de la barre
    bl      EcrCar               @ Afficher le caractère de la barre
    ldr     r1, LD_tirets        @ Charger le caractère de tiret dans r1
    bl      EcrChn               @ Afficher la chaîne de caractères tiret
    add     r3, r3, #1           @ Incrémenter l'indice de colonne pour la ligne de séparation
    b       boucle_sep           @ Boucler sur les colonnes pour la ligne de séparation

fin_sep:
    ldr     r1, LD_barre         @ Charger le caractère de la barre dans r1
    ldrb    r1, [r1]             @ Charger le caractère de la barre
    bl      EcrCar               @ Afficher le caractère de la barre
    bl      AlaLigne             @ Aller à la ligne
    add     r0, r0, #1           @ Incrémenter l'indice de ligne
    b       affichage_loop       @ Boucler sur les lignes

finboucle1:
    b       fin                  @ Terminer le programme

fin:
    @ Fin du programme



fin:pop {lr}
  bx lr

LD_debutTab:  .word debutTab
LD_barre:    .word barre
LD_espace:    .word espace
LD_tirets:    .word tirets