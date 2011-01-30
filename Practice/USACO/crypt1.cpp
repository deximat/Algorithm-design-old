/*
PROB: crypt1
LANG: C++
ID: deximat1
*/
#include <stdio.h>
FILE *in,*out;
int cifre[10],cifra[9],broj[11],medju1[11],medju2[11];
int main()
{
    in = fopen("crypt1.in","r");
    out = fopen("crypt1.out","w");
    int n=0,i=0;
    fscanf(in,"%d",&n);
    for(i=0;i<n;i++)
    {
      fscanf(in,"%d ",&cifra[i]);
      cifre[cifra[i]]=1;
    }
    int a,b,c,d,e,resenje=0;
    for(a=0;a<n;a++)
      for(b=0;b<n;b++)
        for(c=0;c<n;c++)
          for(d=0;d<n;d++)
            for(e=0;e<n;e++)
            { 
              broj[10]=(cifra[c]*cifra[e])%10;
              broj[9]=(cifra[b]*cifra[e]+cifra[c]*cifra[d]+(cifra[c]*cifra[e])/10)%10;
              broj[8]=(cifra[a]*cifra[e]+cifra[b]*cifra[d]+(cifra[b]*cifra[e]+cifra[c]*cifra[d]+(cifra[c]*cifra[e])/10)/10)%10;
              broj[7]=(cifra[a]*cifra[d]+(cifra[a]*cifra[e]+cifra[b]*cifra[d]+(cifra[b]*cifra[e]+cifra[c]*cifra[d]+(cifra[c]*cifra[e])/10)/10)/10)%10;
              broj[6]=(cifra[a]*cifra[d]+(cifra[a]*cifra[e]+cifra[b]*cifra[d]+(cifra[b]*cifra[e]+cifra[c]*cifra[d]+(cifra[c]*cifra[e])/10)/10)/10)/10; 
              
              if (cifre[broj[10]] && 
                  cifre[broj[9]] &&
                  cifre[broj[8]] &&
                  cifre[broj[7]] &&
                 (cifre[broj[6]]==0) && 
                 //medju1
                 cifre[(cifra[e]*cifra[c])%10] &&
                 cifre[(cifra[e]*cifra[b]+(cifra[e]*cifra[c])/10)%10] &&
                 cifre[(cifra[e]*cifra[a]+(cifra[e]*cifra[b]+(cifra[e]*cifra[c])/10)/10)%10] &&
                 ((cifra[e]*cifra[a]+(cifra[e]*cifra[b]+(cifra[e]*cifra[c])/10)/10)/10 == 0) &&
                 //medju 2
                 cifre[(cifra[d]*cifra[c])%10] &&
                 cifre[(cifra[d]*cifra[b]+(cifra[d]*cifra[c])/10)%10] &&
                 cifre[(cifra[d]*cifra[a]+(cifra[d]*cifra[b]+(cifra[d]*cifra[c])/10)/10)%10] &&
                 ((cifra[d]*cifra[a]+(cifra[d]*cifra[b]+(cifra[d]*cifra[c])/10)/10)/10 == 0) 
                 )resenje++;
            }
    fprintf(out,"%d\n",resenje);
    fclose(in);
    fclose(out);
}
