#include<stdio.h>
#include<stdlib.h>
void main()
{
	int a[10],n,i,key;
	printf("Enter the No.of elements\n");
	scanf("%d",&n);
	printf("Enter the array elements\n");
	for(i=0;i<n;i++)
	scanf("%d",&a[i]);
	printf("Enter the search element\n");
	scanf("%d",&key);
	for(i=0;i<n;i++)
	{
		if(key==a[i])
		{
			printf("Element found is %d found at location %d\n",key,i);
			exit(0);
		}
	}
	printf("Element not found\n");
}
