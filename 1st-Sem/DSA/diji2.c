#include<stdio.h>
#include<stdlib.h>
int n,d[10], p[10],cost[6][6]; 
void diji(int source)    
{         
  int i,j,u,v,min;     
  int s[10];     
  for(i=0;i<n;i++)      
  {       
    d[i]=cost[source][i];       
    s[i]=0;       
    p[i]=source;      
  }     
  s[source]=1; 
  for(i=1;i<n;i++)      
  {        
    min=99;        
    u=-1;        
    for(j=0;j<n;j++)         
    {  
      if(s[j]==0)  
      {   
        if(d[j]<min)   
        {       
          min=d[j];       
          u=j;   
        }
      }      
    }      
    if(u==-1)      
    return;      
    s[u]=1;      
    for(v=0;v<n;v++)         
    { 
      if(s[v]==0)   
      {
        if(d[u]+cost[u][v]<d[v])    
        {       
          d[v]=d[u]+cost[u][v];       
          p[v]=u;    
        }  
      }       
    }    
  }  
}      
void main() 
{      
  int j,source,i;      
  printf("Number of vertices");      
  scanf("%d",&n);      
  printf ("Enter the cost adjacency matrix\n");                  
  for(i=0;i<n;i++)             
  {              
    for(j=0;j<n;j++)                
    {                  
      scanf("%d",&cost[i][j]);                                
    }                    
  }              
  printf (" ======cost adjacency matrix=========\n");                 
  for(i=0;i<n;i++)             
  {              
    for(j=0;j<n;j++)                
    {                 
      printf("%d\t",cost[i][j]);                
    }                        
    printf("\n");             
  }           
  printf (" ====================================\n");     
  printf ("Enter the source vertex\n");     
  scanf("%d",&source);                 
  diji(source);     
  printf("\nThe shortest path and distance are shown below\n");    
  for(j=0;j<n;j++)             
  {                    
    if(d[j]==99)                    
    printf(" is not reachable from%d-->%d",source,j);                    
    else                    
    i=j;           
    while(i!=source)           
    {    
      printf("%d<--",i);    
      i=p[i];           
    }           
    printf("%d = %d",i,d[j]);                  
    printf("\n");             
  }    
}
