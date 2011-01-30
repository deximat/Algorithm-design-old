#include <stdio.h>
int main()
    {
    char niz[]="1234567890QWERTYUIOPASDFGHJKLZXCVBNM";
    int i,j,k,l,m,nj;
    freopen("baze.in","w",stdout);
    for(i=0;i<=35;i++)
      for(j=0;j<=35;j++)
        for(k=0;k<=35;k++)
          /*for(l=1;l<=36;l++)
            for(m=1;m<=36;m++)
              for(nj=1;nj<=36;nj++) */
                printf("%c%c%c%c%c%c %c%c%c%c%c%c\n",niz[i],niz[k],niz[k],niz[j],niz[i],niz[k],niz[i],niz[j],niz[i],niz[j],niz[i],niz[j]);
    }
