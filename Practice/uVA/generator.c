#include <stdio.h>
#include <stdlib.h>
int main()
    {
          srand( (int) time(NULL));
          freopen("baze.in","w",stdout);
          int i;
          for(i=1;i<=100000;i++)
          printf("A%dAH B%dB\n",rand(),rand());
    }
