#include<stdio.h>
int i,j,n,a[10],temp;
void ssort()
{
	int min;
	for(i=0;i<n-1;i++)
	{
		min=i;
		for(j=i+1;j<n;j++)
		{	
			if(a[min]<a[j])
			{
				min=j;
			}
		}
		if(min!=i)
		{
			temp=a[i];
			a[i]=a[min];
			a[min]=temp;
		}
	}
}
void main()
{
	printf("Enter elements:");
	scanf("%d",&n);
	printf("ENter array:\n");
	for(i=0;i<n;i++)
	scanf("%d",&a[i]);
	ssort();
	printf("The sorted array is\n");
	for(i=0;i<n;i++)
	printf("%d\t",a[i]);
}
