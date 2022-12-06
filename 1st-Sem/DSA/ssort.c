#include<stdio.h>
int a[10], i, j, n, temp, min;
void ssort()
{
	for(i=0;i<n;i++)
	{
		min=i;
		for(j=i+1;j<n;j++)
		if(a[min]<a[j])
		min=j;
		temp=a[min];
		a[min]=a[i];
		a[i]=temp;

	}
}
int main()
{
	printf("Enter the number of elements:");
	scanf("%d",&n);
	printf("Enter the array elements:\n");
	for(i=0;i<n;i++)
	scanf("%d",&a[i]);
	ssort();
	printf("The sorted array is:\n");
	for(i=0;i<n;i++)
	printf("%d\t",a[i]);
	printf("\n");
	return 0;
}
