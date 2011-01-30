/*
PROG: dualpal
LANG: C++
ID: deximat1
*/
#include <stdio.h>
#include <math.h>
FILE *in,*out;
int brojac2=0;
char cifra[13]={'0','1','2','3','4','5','6','7','8','9'};
int main(){
      in = fopen("dualpal.in","r");
      out = fopen("dualpal.out","w");
      int i,llim,kolicina;
      llim=0;
      i=0;
      fscanf(in,"%d %d",&kolicina,&llim);
      bool finis=1;
      for(i=llim+1;finis;i++){
        int baza;
        int brojac=0;
        char palindrom[15];
        for(baza=2;(baza<=10)&&!(brojac==2);baza++){
          int broj=i;
          int j=0;
          while(broj>0){
            palindrom[j++]=cifra[broj%baza];
            broj=broj/baza;
          }
          palindrom[j]='X';
          int g=0;
          while((palindrom[g]==palindrom[j-g-1])&&(g<=(j/2)))g++;
          if ((g-1)==(j/2))brojac=brojac+1;
        }
        if (brojac==2) {
          fprintf(out,"%d\n",i);
          brojac2++;
        }
        if (brojac2>=kolicina) finis=0;
      }
      fclose(out);
    }
