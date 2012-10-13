/*
PROG:gift1
ID:deximat1
LANG:C++
*/
#include <stdio.h>
#include <string.h>
struct tip{
                char ime[16];
                int value,pocetak;
          };
int main()
    {
        freopen("gift1.in","r",stdin);
        freopen("gift1.out","w",stdout);
        int broj;
        struct tip niz[100];
        int k,i;
        char trenutni[16];
        scanf("%d",&broj);
        for(i=1;i<=broj;i++)
            scanf("%s\n",&niz[i].ime);
        for(k=1;k<=broj;k++)
        {
            scanf("%s",trenutni);
            i=1;
            int pare,ljudi,daje;
            while(strcmp(trenutni, niz[i].ime)) 
              i++;
            scanf("%d %d",&pare,&ljudi);
            niz[i].pocetak=pare;
            if(!(ljudi==0))
            {
              niz[i].value=pare%ljudi;
              daje=pare/ljudi;
            }
            else
            {
              niz[i].value=pare;
              daje=0;
            }
            for(i=1;i<=ljudi;i++)
                {
                    scanf("%s",trenutni);
                    int j=1;
                    while(strcmp(trenutni, niz[j].ime)) 
                       j++;
                    niz[j].value+=daje;
                }
        }
        for(i=1;i<=broj;i++) printf("%s %d\n",niz[i].ime,niz[i].value-niz[i].pocetak);
    
    }
