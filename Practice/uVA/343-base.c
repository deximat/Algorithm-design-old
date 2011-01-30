#include <stdio.h>
#include <string.h>
int convertdigit(char digit); 

int main()
    {
          char broj[2][100];
          //freopen("baze.in","r",stdin);
          //freopen("baze[moj].out","w",stdout);
          while((scanf("%s",broj[0])!=EOF) && (scanf("%s",broj[1]))!=EOF)
          {
              int min[2]={2,2};
              
              unsigned long long int matrica[41][41];
              int i,j;
              //minimalna baza
              for(j=0;j<=1;j++)
                for(i=0;i<strlen(broj[j]);i++)
                  if( min[j]<(convertdigit(broj[j][i])+1))
                        min[j]=convertdigit(broj[j][i])+1;
              //printf("%d %d",min[0],min[1]);
              //system("pause");      
                 
              //generisem matricu bazaXexsponent
              for(i=1;i<=38;i++) matrica[i][0]=1;
              for(i=1;i<=38;i++)
                for(j=1;j<=20;j++){
                  matrica[i][j]=matrica[i][j-1]*i;              
                  }
              //izracunavam oba broja u svim bazama
              int broja,baza,eksponent;
              unsigned long long int resenja[2][40];
              for(broja=0;broja<=1;broja++)
                for(baza=min[broja];baza<=38;baza++)
                { 
                  resenja[broja][baza]=0;
                  for(eksponent=0;eksponent<strlen(broj[broja]);eksponent++)
                    resenja[broja][baza]+=convertdigit(broj[broja][strlen(broj[broja])-eksponent-1])*matrica[baza][eksponent];
                    
                };
              
              for(i=min[0];i<=36;i++){
                for(j=min[1];j<=36;j++)
                  if((resenja[0][i]==resenja[1][j]) && (j!=i))
                    {
                       printf("%s (base %d) = %s (base %d)\n",broj[0],i,broj[1],j);
                       goto gotov;
                    };
               
              }
              printf("%s is not equal to %s in any base 2..36\n",broj[0],broj[1]);
              
              gotov:
              if(1);
          }     
    }
int convertdigit(char digit)
{
if(digit<'A')
  {
      return digit - 48;
  }
  else
  {
      return digit - 55;
  }
}

