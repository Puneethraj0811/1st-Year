#include<stdio.h>
#include<stdlib.h>
#define max 3
int top=-1,s[max],ch,ele,i;

int push()
{
	printf("Enter the element to push\n");
	scanf("%d",&ele);
	s[++top]=ele;

}
int pop()
{
	if(top==-1)
	{
		printf("Stack is empty\n");
		return 0;
	}
	top=top-1;
	return ele;
}
void display()
{
	if(top==-1)
	{
		printf("Stack is empty\n");
	}
	else
	{
		printf("\nStack elements are:\n");
		for(i=0;i<=top;i++)
		printf("%d\t",s[i]);
	}
}
int main()
{
	int ch,opt=1;
	while(opt)
	{
		printf("1.Push\n2.Pop\n3.Display\n\nEnter your choice:");
		scanf("%d",&ch);
		switch(ch)
		{
			case 1: if(top==max-1)
				{	
					printf("Stack is full\n");
				}
				else
				{
					push();
				}
			        break;
			case 2: pop();
			        break;
			case 3: display();
			        break;
			default:printf("Invalid choice");
				break;
		}
		printf("\nDo you want to continue(0/1):");
		scanf("%d",&opt);
	}
}						
