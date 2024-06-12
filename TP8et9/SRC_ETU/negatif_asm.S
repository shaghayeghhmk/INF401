@ Importation des constantes symboliques WIDTH, HEIGHT, BYTES, BYTES_PER_LINE
#include "image_bits_include.h"

.text

.global neg_image

neg_image:
    mov r1, #0               @ Initialiser l'indice de ligne à 0
boucle:
    cmp r1, #HEIGHT         @ Comparer l'indice de ligne avec la hauteur de l'image
    bgt finboucle           @ Sortir de la boucle si nous avons atteint la fin de l'image

    mov r2, #0               @ Initialiser l'indice de colonne à 0
boucle2:
    cmp r2, #BYTES_PER_LINE @ Comparer l'indice de colonne avec le nombre d'octets par ligne
    bgt finboucle2          @ Sortir de la boucle si nous avons atteint la fin de la ligne

    ldrb r4, [r0]            @ Charger l'octet actuel de l'image dans r4
    mvn r4, r4               @ Inverser tous les bits de l'octet

    strb r4, [r0], #1        @ Stocker l'octet inversé dans l'image et avancer l'adresse
    add r2, r2, #1           @ Incrémenter l'indice de colonne
    b boucle2                @ Boucler si nécessaire

finboucle2:
    add r1, r1, #1           @ Incrémenter l'indice de ligne
    b boucle                 @ Boucler si nécessaire

finboucle:
    mov pc, lr               @ Retourner
