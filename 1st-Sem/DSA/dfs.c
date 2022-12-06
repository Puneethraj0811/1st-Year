#include<stdio.h>
int n,visited[10],count=0,a[10][10];
int dfs(int v)
{
	int w;
	count++;
	visited[v]=count;
	for(w=0;w<n;w++)
	if(a[v][w]==1 && visited[w]==0)
	dfs(w);
	printf("%d\t",v);
}
void main()
{
	int i,j,v;
	printf("Enter the number of vertices:");
	scanf("%d",&n);
	printf("Enter the adjacency matrix\n");
	for(i=0;i<n;i++)
	for(j=0;j<n;j++)
	scanf("%d",&a[i][j]);
	printf("Adjacency matrix\n");
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
		printf("%d\t",a[i][j]);
		printf("\n");		
	}
	printf("=======DFS Traversal=======\n");
	for(i=0;i<n;i++)
	visited[i]=0;
	dfs(0);
	printf("\n");
	if(count==n)
	printf("Graph is connected\n");
	else
	printf("Graph is disconnected\n");
}
