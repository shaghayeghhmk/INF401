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



    @ Remplissage du tableau 
    @ utilisation de l'operation "mul"


    ldr r0, =debutTab         
    mov r1, #1                @ Initialiser le compteur à 1

remplissage:
    cmp r1, #N_MAX            @ Vérifier si le compteur dépasse N_MAX
    bgt affichage             @ Si oui, passer à l'affichage

    mov r2, #1                @ Initialiser le compteur de colonne à 1

remplissage_ligne:
    cmp r2, #N_MAX            @ Vérifier si le compteur de colonne dépasse N_MAX
    bgt prochaine_ligne       @ Si oui, passer à la prochaine ligne

    mul r3, r1, r2            @ Calculer le produit de la ligne et de la colonne
    str r3, [r0], #4          @ Stocker le produit dans le tableau et avancer l'LDesse

    add r2, r2, #1            @ Incrémenter le compteur de colonne
    b remplissage_ligne       @ Revenir pour la prochaine colonne

prochaine_ligne:
    mov r3, #0                @ Réinitialiser le compteur de colonne à 0
    add r1, r1, #1            @ Incrémenter le compteur de ligne
    b remplissage             @ Revenir pour la prochaine ligne
    
affichage:
 


@ Affichage du tableau



mov     r0, #0                  @ Initialisation de l'indice de ligne
affichage_loop:
    cmp     r0, #N_MAX          @ Vérifier si l'indice de ligne dépasse N_MAX
    bge     finboucle1          @ Si oui, terminer l'affichage
    mov     r2, #0              @ Initialisation de l'indice de colonne
boucle1:
    cmp     r2, #N_MAX          @ Vérifier si l'indice de colonne dépasse N_MAX
    bge     finboucle2          @ Si oui, terminer la boucle
    ldr     r1, LD_barre        @ Charger le caractère BARRE dans r1
    ldrb    r1, [r1]            @ Charger le caractère BARRE
    bl      EcrCar              @ Afficher le caractère BARRE
    ldr     r3, LD_debutTab     @ Charger l'adresse de début du tableau dans r3
    mov     r10, #4             @ Taille d'un entier en octets
    mul     r8, r0, r10         @ Calculer l'offset de ligne
    mov     r7, #10             @ Nombre maximum de colonnes
    mul     r4, r8, r7          @ Calculer l'offset de ligne
    add     r3, r3, r4          @ Ajouter l'offset de ligne à l'adresse de début du tableau
    mul     r4, r2, r10         @ Calculer l'offset de colonne
    add     r3, r3, r4          @ Ajouter l'offset de colonne à l'adresse du tableau
    ldrb    r4, [r3]            @ Charger la valeur de l'élément dans r4

    @ Gestion des espaces pour l'alignement
    cmp     r4, #100            @ Vérifier si la valeur est inférieure à 100
    bge     si1                 @ Si oui, passer à l'étape suivante
    ldr     r1, LD_espace       @ Charger le caractère ESPACE dans r1
    ldrb    r1, [r1]            @ Charger le caractère ESPACE
    bl      EcrCar              @ Afficher le caractère ESPACE

si1:
    cmp     r4, #10             @ Vérifier si la valeur est inférieure à 10
    bge     si2                 @ Si oui, passer à l'étape suivante
    ldr     r1, LD_espace       @ Charger le caractère ESPACE dans r1
    ldrb    r1, [r1]            @ Charger le caractère ESPACE
    bl      EcrCar              @ Afficher le caractère ESPACE

si2:
    mov     r1, r4              @ Charger la valeur dans r1
    bl      EcrNdecim32         @ Afficher la valeur
    add     r2, r2, #1          @ Incrémenter l'indice de colonne
    b       boucle1             @ Boucler sur les colonnes

finboucle2:
    ldr     r1, LD_barre        @ Charger le caractère BARRE dans r1
    ldrb    r1, [r1]            @ Charger le caractère BARRE
    bl      EcrCar              @ Afficher le caractère BARRE
    bl      AlaLigne            @ Aller à la ligne

    @ Écrire la ligne de séparation après chaque ligne du tableau
    mov     r3, #0              @ Initialisation de l'indice de colonne pour la ligne de séparation
    ldr     r1, LD_barre        @ Charger le caractère BARRE dans r1
    ldrb    r1, [r1]            @ Charger le caractère BARRE
boucle_sep:
    cmp     r3, #N_MAX          @ Vérifier si l'indice de colonne pour la ligne de séparation dépasse N_MAX
    bge     fin_sep             @ Si oui, terminer la boucle
    ldr     r1, LD_barre        @ Charger le caractère BARRE dans r1
    ldrb    r1, [r1]            @ Charger le caractère BARRE
    bl      EcrCar              @ Afficher le caractère BARRE
    ldr     r1, LD_tirets       @ Charger le caractère TIRETS dans r1
    bl      EcrChn              @ Afficher la chaîne de caractères TIRETS
    add     r3, r3, #1          @ Incrémenter l'indice de colonne pour la ligne de séparation
    b       boucle_sep          @ Boucler sur les colonnes pour la ligne de séparation

fin_sep:
    ldr     r1, LD_barre        @ Charger le caractère BARRE dans r1
    ldrb    r1, [r1]            @ Charger le caractère BARRE
    bl      EcrCar              @ Afficher le caractère BARRE
    bl      AlaLigne            @ Aller à la ligne
    add     r0, r0, #1          @ Incrémenter l'indice de ligne
    b       affichage_loop      @ Boucler sur les lignes

finboucle1:
    b       fin                 @ Terminer

fin:
    @ Fin du programme




fin:pop {lr}
  bx lr

LD_debutTab:  .word debutTab
LD_barre:    .word barre
LD_espace:    .word espace
LD_tirets:    .word tirets