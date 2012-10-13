/*
PROG:ride
LANG:C++
ID:deximat1
*/
#include <stdio.h>
int main()
    {
        freopen("ride.in","r",stdin);
        freopen("ride.out","w",stdout);
        char c;
        long int proizvod1=1,proizvod2=1;
        while((c=getc(stdin)) != '\n')
            proizvod1=proizvod1*(c-64);
        while((c=getc(stdin)) != '\n')
            proizvod2=proizvod2*(c-64);
        if((proizvod1%47) == (proizvod2%47))
        {
            printf("GO\n");
        }
        else
        {
            printf("STAY\n");
        }
    }
