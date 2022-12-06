#include<stdio.h>
void main()
{
	int incm_pckts,out_pckts, buff_size, n, store=0, i, drp_val;
	printf("Enter the number of packets to be inserted:");
	scanf("%d", &n);
	printf("Enter the buffer size:");
	scanf("%d", &buff_size);
	printf("Enter the outgoing rate:");
	scanf("%d", &out_pckts);
	while(n!=0)
	{
		printf("Enter the incoming packets:\n");
		scanf("%d", &incm_pckts);
		printf("%d is Incoming\n",incm_pckts);
		if(incm_pckts<=(buff_size-store))
		{	
			store=store+incm_pckts;
		}
		else
		{
			printf("%d Packet is dropped\n",incm_pckts-(buff_size-store));
			store=buff_size;
			printf("Buffer size %d out of %d\n",store,buff_size);
		}
		store=store-out_pckts;
		if(store<0)
		store=0;
		printf("After outgoing, %d packet is left in buffer of size %d\n",store,buff_size);
		n--;
	}
}	
