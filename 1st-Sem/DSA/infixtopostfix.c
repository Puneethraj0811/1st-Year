#include<stdio.h>
#include<ctype.h>
char infix[30],postfix[30],stack[30];
int top=-1;
void push(char symbol)
{
	stack[++top]=symbol;
}
char pop()
{
	return stack[top--];
}
int preceed(char symbol)
{
	switch(symbol)
	{
		case '$': return -1;
		case '(': return 0;
		case '+':
		case '-': return 1;
		case '/': 
		case '*': return 2;
		case '^': return 3;
	}
}
void intopo()
{
	int i=0,k=0;
	char symbol;
	while((symbol=infix[i++])!='\0')
	{
		if(symbol=='(')
		{
			push(symbol);
		}
		else if(symbol==')')
		{	
			while(stack[top]!='(')
			{
				postfix[k++]=pop();
			}
			if(stack[top]=='(')
			{
				pop();
			}
		}
		else if(isalnum(symbol))
		{
			postfix[k++]=symbol;
		}
		else
		{
			while(preceed(symbol)<=preceed(stack[top]))
			{
				postfix[k++]=pop();
			}
			push(symbol);
		}
	}
	while(top!=-1)
	{
		if(stack[top]=='('||stack[top]==')')
		{
			top--;
		}
		else
		{
			postfix[k++]=pop();
		}
	}
}
void main()
{
	printf("Enter infix expression\n");
	scanf("%s",infix);
	intopo();
	printf("Postfix expression is %s\n",postfix);
}
