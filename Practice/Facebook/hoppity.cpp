#include <stdio.h>
#include <string>

int main(int argc, char** argv)
	{
		FILE * f;
		f=fopen(argv[1],"r");
		int n,i;
		n=0;
		fscanf(f,"%d",&n);
		for(i=1;i<=n;i++)
		if (((i % 3) == 0) && ((i % 5) == 0))
			{
				printf("Hop\n");
			}
			else
			{
				if((i % 3) == 0)
				{
					printf("Hoppity\n");
				}
				if((i % 5) == 0)
				{
					printf("Hophop\n");
				}
			}
}