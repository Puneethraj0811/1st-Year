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
	int op=1,ch;
	printf("Enter the number of elements:");
	scanf("%d",&n);
	printf("Enter the array elements:\n");
	for(i=0;i<n;i++)
	scanf("%d",&a[i]);
	while(op)
	{
		printf("1.Bubble Sort\n2.Selection Sort\n");
		printf("Enter your choice:");
		scanf("%d",&ch);
		switch(ch)
		{
			case 1: bsort();
				printf("The sorted array is:\n");
				for(i=0;i<n;i++)
				printf("%d\t",a[i]);
				printf("\n");
				break;
			case 2: ssort();
				printf("The sorted array is:\n");
				for(i=0;i<n;i++)
				printf("%d\t",a[i]);
				printf("\n");
				break;
			default:printf("Inavlid choice\n");
				break;
		}
		printf("Do you want to continue(0/1):");
		scanf("%d",&op);
	}		
}
