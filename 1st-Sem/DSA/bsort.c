#include<stdio.h>
int a[10], n, i, j, temp;
void bsort()
{
	for(i=0;i<n-1;i++)
	{
		for(j=0;j<n-i-1;j++)
		if(a[j]>a[j+1])
		{
			temp=a[j];
			a[j]=a[j+1];
			a[j+1]=temp;
		}
	}
}
int main()
{
	printf("Enter the number of elements:");
	scanf("%d",&n);
	printf("Enter the array elements:\n");
	for(i=0;i<n;i++)
	scanf("%d",&a[i]);
	bsort();
	printf("The sorted array is:\n");
	for(i=0;i<n;i++)
	printf("%d\t",a[i]);
	printf("\n");
	return 0;
} 


