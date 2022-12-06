#include<stdio.h>
int cost[15][15],n,mincost,v1=0,v2=0;

//finding the edge having min weight
void findmin()
{
        int edgewt=99,i,j;
        for(i=0;i<n;i++)
        {
                 for(j=0;j<n;j++)
                 {
                         if(cost[i][j]>0 && cost[i][j]<edgewt)
                         {
                                edgewt=cost[i][j];
                                v1=i;
                                v2=j;
                         }
                }
        }
}

//finding cycles
void doUnion(int root[],int v1,int v2)
{
        int temp,i;
        temp=root[v2];
        for(i=0;i<n;i++)
        {
                if(root[i]==temp)
                {
                        root[i]=root[v1];
                }
        }
}

void kruskal()
{ 
        int i,edgewt,root[n];
        for(i=0;i<n;i++)
        root[i]=i;
        printf("\nEdges of min-cost spanning tree are");
        i=0;
        while(i!=n-1)
        {
                findmin(); //updates v1 and v2 vertices of edge with min weight
                edgewt=cost[v1][v2];
                cost[v1][v2]=cost[v2][v1]=0;  //supresses selection of same edges on next time
                if(root[v1]!=root[v2])
                {
                        printf("\n(%d,%d)",v1,v2);
                        doUnion(root,v1,v2);
                        mincost+=edgewt;
                        i++;
                }
        }
        printf("\nCost of min-cost spanning tree= %d\n",mincost);
}

void main()
{
        int i,j;
        printf("Enter the number of vertices:");
        scanf("%d",&n);
        printf("Enter the undirected graph as adjecency matrix\n");
        for(i=0;i<n;i++)
        for(j=0;j<n;j++)
        scanf("%d",&cost[i][j]); 
        //graph display
        for(i=0;i<n;i++)
        {
                for(j=0;j<n;j++)
                {
                        printf("%d\t",cost[i][j]);
                } 
                printf("\n");
        }
        kruskal();
}
