/*
PROB: calfflac
LANG: C++
ID: deximat1
*/
#include <stdio.h>
#include <ctype.h>
char niz[20001], //originalan niz
     niz2[20001];//upcase niz
int duzina,pocetak,kraj;
 int proveriulaz(char bla[],char bla2[]);
FILE *in,*out,*out2;
int main()
{
    in = fopen("calfflac.in","r");
    out = fopen("calfflac.out","w");
    //out2 = fopen("davidim.out","w");
    int i=0;
    char c;
    while((c=getc(in))!=EOF)
    {
      niz[i]=c;
      niz2[i]=toupper(c);
      i++;
    }
    int n=i-1;
    // proveriulaz(niz,niz2);
    i=0;
    while(niz2[i]!='\0')
    {
       //odd palindrom                  
      if ((niz2[i]>='A') && (niz2[i]<='Z'))
      {
       
        int a=i,b=i,size=1,kslovo=0,pslovo=0;
        do
         { 
          a--; 
          b++;
          while((a>=0) && ((niz2[a]<'A') || (niz2[a]>'Z'))) a--;
          while((b<=n) && ((niz2[b]<'A') || (niz2[b]>'Z'))) b++;
          
          if ((a>=0) && (b<=n) && (niz2[a]==niz2[b]))
          {
            size+=2;
            pslovo=a;
            kslovo=b;
          }
        } while((a>=0) && (b<=n) && (niz2[a]==niz2[b]));
        if (size>duzina)
        {
          duzina=size;
          pocetak=pslovo;
          kraj=kslovo;
        }
       }
        //parni palindromi
      if ((niz2[i]>='A') && (niz2[i]<='Z'))
       {
        int x=1;
        while(((niz2[i+x]<'A') || (niz2[i+x]>'Z')) && (i+x<=n))x++; 
        if(niz2[i]==niz2[i+x]){
        int a=i,b=i+x,size=2,kslovo=i+x,pslovo=i;
        do
        { 
          a--; 
          b++;
          while((a>=0) && ((niz2[a]<'A') || (niz2[a]>'Z'))) a--;
          while((b<=n) && ((niz2[b]<'A') || (niz2[b]>'Z'))) b++;
          
          if ((a>=0) && (b<=n) && (niz2[a]==niz2[b]))
          {
            size+=2;
            pslovo=a;
            kslovo=b;
          }
        } while((a>=0) && (b<=n) && (niz2[a]==niz2[b]));
        if (size>duzina)
        {
          duzina=size;
          pocetak=pslovo;
          kraj=kslovo;
        }
        }
      }
      i++;
    }
    fprintf(out,"%d\n",duzina);
    for(i=pocetak;i<=kraj;i++)fprintf(out,"%c",niz[i]);
    fprintf(out,"\n");
    fclose(out);
    getchar();
}
 int proveriulaz(char obican[],char upcase[]){
      int i=0;
      printf("Obican niz:\n");
      while(obican[i]!='\0')
      {
        printf("%c",obican[i]);
        i++;
      }
      i=0;
      printf("\nUpcase niz\n");
      while(upcase[i]!='\0')
      {
        fprintf(out2,"%c",upcase[i]);
        i++;
      }
      fclose(out2);
    }

