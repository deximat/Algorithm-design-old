/*
PROG: barn1
LANG: C++
ID: deximat1
*/
#include <stdio.h>
FILE *in,*out;
int popunjenost[202],komadi[202];
int main(){
      int m,s,c,i;
      in=fopen("barn1.in","r");
      out=fopen("barn1.out","w"); 
      fscanf(in,"%d %d %d",&m,&s,&c);
      int b=s;
      for(i=0;i<c;i++){
        int stall;
        fscanf(in,"%d",&stall);
        popunjenost[stall]=1;
      }
      int brojac=0,prvi=1;
      for(i=1;i<=b;i++){
        if(popunjenost[i]==0){
          brojac++;
          if (prvi == 1) prvi=3;
        }else{
          if (prvi == 3){
            
            s-=brojac;
          }else{
          komadi[brojac]+=1;
          }
          brojac=0;
          prvi=2;
        }
      
      }
      s-=brojac;
      brojac=1;
     
      for(i=b;(i>0)&&(brojac<m);i--){
        if(komadi[i]>0){
             brojac++;
             s-=i;
             komadi[i]--;
             i++;
        }
      }
     
      fprintf(out,"%d\n",s);
      fclose(out);
      
    }
