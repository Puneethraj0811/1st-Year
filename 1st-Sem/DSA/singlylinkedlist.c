#include<stdio.h>
#include<stdlib.h>
typedef struct Node * lstptr;
struct Node
	{
		int data;
		lstptr link;
	};

lstptr first=NULL;

lstptr getnode()
{
	lstptr node;
	node=(lstptr)malloc(sizeof(struct Node));
	return node;
}

void insertBegin(int ele)
{	
	lstptr new;
	new=getnode();
	new->data=ele;
	new->link=NULL;
	if(first!=NULL)
	{
		new->link=first;
	}
	first=new;
}

void insertEnd(int ele)
{	
	lstptr new,temp;
	new=getnode();
	new->data=ele;
	new->link=NULL;
	if(first!=NULL)
	{
		temp=first;	
		while(temp->link!=NULL)
		temp=temp->link;
		temp->link=new;		
	}
	else
	first=new;
}

void deleteBegin()
{
	lstptr temp;
	if(first==NULL)
	{
		printf("List is empty\n");
		return;
	}
	temp=first;
	if(first->link==NULL)
	first=NULL;
	else
	{
		first=first->link;
	}
	free(temp);
}

void deleteEnd()
{
	lstptr temp,prev;
	if(first==NULL)
	{
		printf("List is empty\n");
		return;
	}
	temp=first;
	if(first->link==NULL)
	first=NULL;
	else
	{
		prev=temp;
		while(temp->link!=NULL)
		{
			prev=temp;
			temp=temp->link;
		}
		prev->link=NULL;
	}
	free(temp);
}

void deleteSpecific(int ele)
{
	lstptr temp,prev;
	temp=first;
	if(first==NULL)
	{
		printf("\nEmpty list\n");
	}
	else if(first->data==ele)
	{
		if(first->link!=NULL)
		first=first->link;
		else
		first=NULL;
	}
	else
	{
		while(temp->data!=ele && temp->link!=NULL)
		{
			prev=temp;
			temp=temp->link;
		}
		if(temp->link==NULL && temp->data!=ele)
		{
			printf("\nspecific element not found\n");
			return;
		}
		else if(temp->link!=NULL)
		prev->link=temp->link;
		else 
		prev->link=NULL;
	}
	free(temp);
}

void display()
{
	lstptr temp;
	if(first==NULL)
	{
		printf("List is empty\n");
		return;
	}
	temp=first;
	while(temp->link!=NULL)
	{
		printf("%d\t",temp->data);
		temp=temp->link;
	}
	printf("%d\t",temp->data);
	printf("\n");
}
void main()
{
	int ch,op=1,ele;
	while(op)
	{
		printf("1.INSERT BEGIN\n2.INSERT END\n3.DELETE BEGIN\n4.DELETE END\n5.DELETE SPECIFIC\n6.DISPLAY\n");
		printf("Enter your choice:");
		scanf("%d",&ch);
		switch(ch)
		{
			case 1: printf("Enter the element to be inserted:");
				scanf("%d",&ele);
				insertBegin(ele);
				break;
			case 2: printf("Enter the element to be inserted:");
				scanf("%d",&ele);
				insertEnd(ele);
				break;
			case 3: deleteBegin();
				break;
			case 4: deleteEnd();
				break;
			case 5: printf("Enter the item to be deleted:");
				scanf("%d",&ele);
				deleteSpecific(ele);
				break;
			case 6: display();
				break;
		}
		printf("\nDo you want to continue(0/1):");
		scanf("%d",&op);
	}
}
