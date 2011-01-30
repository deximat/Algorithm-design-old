/*
PROG: milk
LANG: C++
ID: deximat1
*/
#include <stdio.h>
FILE *in,*out;
int main(){
      in = fopen("milk.in","r");
      out = fopen("milk.out","w");
      int n,m,i,j,temp;
      int cene[5000][2];
      fscanf(in,"%d %d",&n,&m);
    
      for(i=0;i<=m-1;i++){
        fscanf(in,"%d %d",&cene[i][0],&cene[i][1]);
      }
      for(i=m-2;i>=0;i--){
        for(j=0;j<=i;j++){
          if(cene[j][0]>cene[j+1][0]){
            temp=cene[j][1];
            cene[j][1]=cene[j+1][1];
            cene[j+1][1]=temp;
            temp=cene[j][0];
            cene[j][0]=cene[j+1][0];
            cene[j+1][0]=temp;
          }
        }
      }
    int cena=0,galoni=0;
    i=-1;
    while(galoni<n){
      i++;
      cena+=cene[i][0]*cene[i][1];
      galoni+=cene[i][1];
    }
    cena=cena-(galoni-n)*cene[i][0];
    fprintf(out,"%d\n",cena);
    fclose(out);
    }
