/*
PROG: namenum
LANG: C++
ID: deximat1
*/
#include <stdio.h>
FILE *inf,*outf,*dict;
char slova[9][3] = {
		   {'A','B','C'},
		   {'D','E','F'},
		   {'G','H','I'},
		   {'J','K','L'},
		   {'M','N','O'},
		   {'P','R','S'},
		   {'T','U','V'},
		   {'W','X','Y'},
		   {'\0','-','-'}
		   };
char lista[5000][12];
int jel=0;
int nivo=-1;
int b,n=0;
char broj[12];
void nadji(int poc,int kraj,int brojint){
       int j=0;
       nivo++;
       if(brojint<0) brojint=8;
       for(j=0;j<=2;j++){
	   b=poc;
	   while((lista[b][nivo]<slova[brojint][j])&&(b<=kraj)){b++;};
	   int pocetak=b;
	   while((lista[b][nivo]==slova[brojint][j])&&(b<=kraj)){b++;};
	   if (((b-1)-pocetak)>=0) {
	       if (nivo==11){
		 int g;
		 jel=1;
		 for(g=0;g<=n;g++){
		   putc(lista[b-1][g],outf);
		 };
		 putc('\n',outf);
	       }else{nadji(pocetak,b-1,broj[nivo+1]-50);}
	   }
	}
       nivo--;
     };
int main(){
      inf=fopen("namenum.in","r");
      dict=fopen("dict.txt","r");
      outf=fopen("namenum.out","w");
      int i=0;
      char c;

      while ((c=getc(inf))!= '\n'){
	      broj[i]=c;
	      i++;
	    };
      n=i-1;
      i=0;
      int j=0;
      while((c=getc(dict))!= EOF){
	j=0;
	lista[i][j]=c;
	while((c=getc(dict))!='\n'){
	  j++;
	  lista[i][j]=c;
	}
	i++;
      }
      nadji(0,i-1,broj[0]-50);
      if (jel==0) fprintf(outf,"NONE\n");
      fclose(outf);
    }
