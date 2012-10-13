/*
PROG: palsquare
LANG: C++
ID: deximat1
*/
#include <stdio.h>
#include <math.h>
FILE *in,*out;
char cifra[22] = {'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L'};
char palindrom[15];
int main()
{
    in = fopen("palsquare.in","r");
    out = fopen("palsquare.out","w");
    int base;
    fscanf(in,"%d",&base);
    for(int i=1;i<=300;i++){
            int broj;
            int j=0;
            broj=int(round(pow(i,2)));
            while(broj>0){
              palindrom[j++]=cifra[broj%base];
              broj=broj/base;
            }
            int f=0;
            int g=0;
            while ((palindrom[f]==palindrom[j-f-1])&&(f<=j/2))f++;
            if ((f-1) == (j/2)){
                  int duzina=j;
                  broj=i;
                  char palindrom2[15];
                  j=0;
                  while(broj>0){
                    
                    palindrom2[j++]=cifra[broj%base];
                    broj=broj/base;
                  }
                  for(g=j-1;g>=0;g--){
                    fprintf(out,"%c",palindrom2[g]);
                  }
                  fprintf(out," ");
                  for(g=0;g<duzina;g++){
                    fprintf(out,"%c",palindrom[g]);
                  }
                  fprintf(out,"\n");
            }
    }
    fclose(out);
}
