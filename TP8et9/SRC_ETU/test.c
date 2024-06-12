#include "commun.h"

void symetrie_octet (unsigned char *adresse) {
  unsigned char octet;
  
  octet = *adresse;

  // echange de quartets adjacents
  octet = (octet & 0xF0) >> 4 | (octet & 0x0F) <<4;
  // echange de doublets adjacents
  octet = (octet & 0xCC) >> 2 | (octet & 0x33) <<2;
  // echange de bits adjacents
  octet = (octet & 0xAA)>> 1 | (octet & 0x55) <<1;

  *adresse = octet;
}


void permuter_cols (unsigned char *tab, unsigned int col) {
   unsigned char tmp;

   tmp = tab[BYTES_PER_LINE -1 - col];
   tab [BYTES_PER_LINE -1 - col] = tab [col];
   tab[col] = tmp;
}



void symetrie_axe_v (unsigned char *image) {
   unsigned int position;
   unsigned int li,col;
   unsigned char *adresse;

   // symetriser chaque octet
   for (position = 0; position < BYTES; position++) {
       symetrie_octet (image+position);
       }
   // symetrie verticale octet par octet
   for (li=0;li<HEIGHT;li++) {
      adresse = image+li*BYTES_PER_LINE;
      for (col=0; col<BYTES_PER_LINE/2;col++) {
         permuter_cols (adresse, col);
      }
   }
}  



void permuter_lignes (ligne_t *tab, unsigned int li) {
   unsigned char tmp;

   tmp = tab[li][0];
   tab[li][0] = tab [HEIGHT -1 - li][0];
   tab[HEIGHT -1 - li][0] = tmp;
}


void symetrie_axe_h (unsigned char *image) {
   unsigned int li,col;

   for (li=0;li<HEIGHT/2;li++) {
      for (col=0; col<BYTES_PER_LINE;col++) {
        permuter_lignes ((ligne_t *) (image+col), li);
      }
   }
}  
