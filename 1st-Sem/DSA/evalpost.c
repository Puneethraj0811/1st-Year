#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<math.h>

int stack[30],top=-1;
char postfix[30];
void push(char symbol)
{
        stack[++top]=symbol;
}
int pop()
{
        char symbol;
        symbol=stack[top--];
        return symbol;
}
int evalpost()
{
        char symbol;
        int op1,op2,i=0;
        while((symbol=postfix[i++])!='\0')
        {
                if(isalnum(symbol))
                {
                        push(symbol-'0');
                }
                else
                {
                        op2=pop();
                        op1=pop();
                        switch(symbol)
                        {
                                case '+':push(op1+op2);
                                         break;
                                case '-':push(op1-op2);
                                         break;
                                case '*':push(op1*op2);
                                         break;
                                case '/':if(op2!=0)
                                         {
                                                push(op1/op2);
                                                break;
                                         }
                                         else
                                         {
                                                printf("Invalid expression");
                                                exit(0);
                                         }
                                case '^':push(pow(op1,op2));
                                         break;
                        }
                }
        }
        return(pop());
}
int main()
{
int val;
printf("Enter postfix expression:\n");
scanf("%s",postfix);
val=evalpost();
printf("Evaluated expression:%d\n",val);
return 0;
}
