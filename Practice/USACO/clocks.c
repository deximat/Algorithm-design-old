/*
PROG:clocks
ID:deximat
LANG:C++
*/
#include <stdio.h>

//satovi
struct satovi
       {
         int    a,b,c;
         int    d,e,f;
         int    g,h,i;
       };
struct satovi pocetni,trenutni;
int pomeri(int brojpokreta, int brojputa);
int obradi(int *pokret);
int main()
    {
          FILE * in,* out;
          in = fopen("clocks.in","r");
          out = fopen("clocks.out","w");
          //freopen("clocks.out","w",stdout);
          //freopen("clocks.in","r",stdin);
          //ucitavanje
          fscanf(in,"%d %d %d\n%d %d %d\n%d %d %d",&pocetni.a,&pocetni.b,&pocetni.c,&pocetni.d,&pocetni.e,&pocetni.f,&pocetni.g,&pocetni.h,&pocetni.i);
          
          // provera ulaza 
          //        printf("%d %d %d\n%d %d %d\n%d %d %d",pocetni.a,pocetni.b,pocetni.c,pocetni.d,pocetni.e,pocetni.f,pocetni.g,pocetni.h,pocetni.i);
          
          //petlja koja broji koliko od puta ce se svaki potez uraditi
          int pokret[10];
          obradi(pokret);
          //ispis
          int i,j,k;
          
          int ispis[100];
          k=0;
          for(i=1;i<=9;i++)
            for (j=1;j<=pokret[i];j++)
            {
                ispis[k]=i;
                k++;
            }
          
          for(i=0;i<k-1;i++)
            fprintf(out,"%d ",ispis[i]);
          fprintf(out,"%d\n",ispis[k-1]);
          //system("pause");
          fclose(out);
          }
int pomeri(int brojpokreta, int brojputa)
{
     switch(brojpokreta)
     {
  case 1:trenutni.a+=3*brojputa;
         trenutni.b+=3*brojputa;
         trenutni.d+=3*brojputa;
         trenutni.e+=3*brojputa;
       break;
  case 2:
         trenutni.a+=3*brojputa;
         trenutni.b+=3*brojputa;
         trenutni.c+=3*brojputa;
       break;
  case 3:
         trenutni.b+=3*brojputa;
         trenutni.c+=3*brojputa;
         trenutni.e+=3*brojputa;
         trenutni.f+=3*brojputa;
       break;
  case 4:
         trenutni.a+=3*brojputa;
         trenutni.d+=3*brojputa;
         trenutni.g+=3*brojputa;
       break;
  case 5:trenutni.b+=3*brojputa;
         trenutni.d+=3*brojputa;
         trenutni.e+=3*brojputa;
         trenutni.f+=3*brojputa;
         trenutni.h+=3*brojputa;
         
       break;
  case 6:trenutni.c+=3*brojputa;
         trenutni.f+=3*brojputa;
         trenutni.i+=3*brojputa;
       break;
  case 7:trenutni.d+=3*brojputa;
         trenutni.e+=3*brojputa;
         trenutni.g+=3*brojputa;
         trenutni.h+=3*brojputa;
       break;
  case 8:trenutni.g+=3*brojputa;
         trenutni.h+=3*brojputa;
         trenutni.i+=3*brojputa;
       break;
  case 9:trenutni.e+=3*brojputa;
         trenutni.f+=3*brojputa;
         trenutni.h+=3*brojputa;
         trenutni.i+=3*brojputa;
       break;
     };
}
int obradi(int *pokret)
{
    for(pokret[9]=0;pokret[9]<=3;pokret[9]++)
            for(pokret[8]=0;pokret[8]<=3;pokret[8]++)
              for(pokret[7]=0;pokret[7]<=3;pokret[7]++)
                for(pokret[6]=0;pokret[6]<=3;pokret[6]++)
                  for(pokret[5]=0;pokret[5]<=3;pokret[5]++)
                    for(pokret[4]=0;pokret[4]<=3;pokret[4]++)
                      for(pokret[3]=0;pokret[3]<=3;pokret[3]++)
                        for(pokret[2]=0;pokret[2]<=3;pokret[2]++)
                          for(pokret[1]=0;pokret[1]<=3;pokret[1]++)
                            {
                            //pomeraj trenutnog stanja satova
                              trenutni=pocetni; //inicijalizacija
                              int i;
                              for(i=1;i<=9;i++)
                                if(pokret[i]>0)
                                  pomeri(i,pokret[i]);
                            //provera da li su svi satovi na 12
                              if(!((trenutni.a%12) ||
                                (trenutni.b%12) ||
                                (trenutni.c%12) ||
                                (trenutni.d%12) ||
                                (trenutni.e%12) ||
                                (trenutni.f%12) ||
                                (trenutni.g%12) ||
                                (trenutni.h%12) ||
                                (trenutni.i%12)
                                )) return 0;
                             //system("pause");     
                              
                            }
}
