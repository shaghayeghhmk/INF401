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
@ multiplication par additions successives


    ldr r0, =debutTab         @ Charger l'adresse du début du tableau dans r0
    mov r1, #1                @ Initialiser le compteur de ligne à 1

remplissage:
    cmp r1, #N_MAX            @ Vérifier si le compteur de ligne dépasse N_MAX
    bgt affichage             @ Si oui, passer à l'affichage

    mov r2, #1                @ Initialiser le compteur de colonne à 1

remplissage_ligne:
    cmp r2, #N_MAX            @ Vérifier si le compteur de colonne dépasse N_MAX
    bgt prochaine_ligne       @ Si oui, passer à la prochaine ligne

    mov r3, #0                @ Initialiser le produit à 0

    mov r4, r1                @ Copier le compteur de ligne dans r4
    mov r5, r2                @ Copier le compteur de colonne dans r5

    somme_loop:
        add r3, r3, r4        @ Ajouter r4 à r3 (somme partielle)
        subs r5, r5, #1       @ Décrémenter le compteur de colonne
        bne somme_loop        @ Répéter jusqu'à ce que r5 soit nul

    str r3, [r0], #4          @ Stocker le produit dans le tableau et avancer l'adresse

    add r2, r2, #1            @ Incrémenter le compteur de colonne
    b remplissage_ligne       @ Revenir pour la prochaine colonne

prochaine_ligne:
    add r1, r1, #1            @ Incrémenter le compteur de ligne
    b remplissage             @ Revenir pour la prochaine ligne




@ Affichage du tableau - traduction de l'agorithme donné en TP


mov     r0, #0                 
affichage_loop:
    cmp     r0, #N_MAX          
    bge     finboucle1          
    mov     r2, #0             
boucle1:
    cmp     r2, #N_MAX          
    bge     finboucle2         
    ldr     r1, LD_barre      
    ldrb    r1, [r1]        
    bl      EcrCar           
    ldr     r3, LD_debutTab    
    mov     r10, #4            
    mul     r8, r0, r10        
    mov     r7, #10             
    mul     r4, r8, r7         
    add     r3, r3, r4          
    mul     r4, r2, r10         
    add     r3, r3, r4         
    ldrb    r4, [r3]            
    @ Gestion des espaces pour l'alignement
    cmp     r4, #100            
    bge     si1                
    ldr     r1, LD_espace       
    ldrb    r1, [r1]            
    bl      EcrCar              
si1:
    cmp     r4, #10            
    bge     si2                 
    ldr     r1, LD_espace      
    ldrb    r1, [r1]            
    bl      EcrCar          
si2:
    mov     r1, r4              
    bl      EcrNdecim32         
    add     r2, r2, #1         
    b       boucle1            
finboucle2:
    ldr     r1, LD_barre        
    ldrb    r1, [r1]              
    bl      EcrCar             
    bl      AlaLigne            
    @ Écrire la ligne de séparation après chaque ligne du tableau
    mov     r3, #0              
    ldr     r1, LD_barre        
    ldrb    r1, [r1]  
boucle_sep:
    cmp     r3, #N_MAX          
    bge     fin_sep             
    ldr     r1, LD_barre        
    ldrb    r1, [r1]            
    bl      EcrCar             
    ldr     r1, LD_tirets       
    bl      EcrChn             
    add     r3, r3, #1         
    b       boucle_sep          
fin_sep:
    ldr     r1, LD_barre       
    ldrb    r1, [r1]            
    bl      EcrCar             
    bl      AlaLigne      
    add     r0, r0, #1  
    b       affichage_loop   
finboucle1:
    b       fin              
fin:
    @ Fin du programme




fin:pop {lr}
  bx lr

LD_debutTab:  .word debutTab
LD_barre:    .word barre
LD_espace:    .word espace
LD_tirets:    .word tirets