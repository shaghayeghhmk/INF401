   .data
debutTAB: .skip 5*4 @ reservation de 20 octets
                @ sans valeur initiale

   .text
   .global main
main:
   ldr r0, ptr_debutTAB
   mov r1, #11
   str r1, [r0]

   mov r1, #22
   add r0, r0, #4
   str r1, [r0]
   
   mov r1, #33             @ Mettre la valeur 33 dans r1
   add r0, r0, #4          @ Ajouter 4 à r0 (déplacer le pointeur au prochain élément du tableau)
   str r1, [r0]            @ Stocker la valeur de r1 dans le troisième élément du tableau

   mov r1, #44             @ Mettre la valeur 44 dans r1
   add r0, r0, #4          @ Ajouter 4 à r0 (déplacer le pointeur au prochain élément du tableau)
   str r1, [r0]            @ Stocker la valeur de r1 dans le quatrième élément du tableau

   mov r1, #55             @ Mettre la valeur 55 dans r1
   add r0, r0, #4          @ Ajouter 4 à r0 (déplacer le pointeur au prochain élément du tableau)
   str r1, [r0]            @ Stocker la valeur de r1 dans le cinquième élément du tableau

fin:  BX LR

ptr_debutTAB : .word debutTAB

