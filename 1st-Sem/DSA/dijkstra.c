#include<stdio.h>
int distance[10],path[10],cost[10][10],n,i,j;
void dijkstra(int src)
{
	int visited[10],u,v,min;
	for(i=0;i<n;i++)
	{
		distance[i]=cost[src][i];
		path[i]=src;
		visited[i]=0;
	}
	visited[src]=1;
	for(i=1;i<n;i++)
	{
		min=99;
		u=-1;
		for(j=0;j<n;j++)
		{
			if(visited[j]==0)
			{	
				if(distance[j]<min)
				{
					min=distance[j];
					u=j;
				}
			}
		}
		if(u==-1)
		return;
		visited[u]=1;
		for(v=0;v<n;v++)
		{
			if(visited[v]==0)
			{
				if(distance[u]+cost[u][v]<distance[v])
				{
					distance[v]=distance[u]+cost[u][v];
					path[v]=u;
				}
			}
		}
	}
}
void shortest_path(int src,int dst)
{
	i=dst;
	while(i!=src)
	{
		printf("%d<--",i);
		i=path[i];
	}
	printf("%d=%d",i,distance[dst]);
	printf("\n");
}
void main()
{
	int src;
	printf("Enter the number of vertices:");
	scanf("%d",&n);
	printf("Enter the adjacency matrix\n");
	for(i=0;i<n;i++)
	for(j=0;j<n;j++)	
	scanf("%d",&cost[i][j]);
	printf("\n=========Adjacency Matrix============\n");
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
		{
			printf("%d\t",cost[i][j]);
		}
		printf("\n");
	}	
	printf("Enther the source vertex:");
	scanf("%d",&src);
	dijkstra(src);
	for(j=0;j<n;j++)
	{
 		if(d[j]==99)
		printf("Is not reacheble from %d-->%d",source,j);
	}
  	else
	{
		shortest_path(src,j);
		printf("\n");
	}
}
