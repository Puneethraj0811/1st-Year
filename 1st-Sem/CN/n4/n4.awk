BEGIN {
	count=0
	sent1=0;
	sent2=0
	rcvd=0;
}
{
	if($1=="d")
	{
		count++;
	}
	else if($1=="+" && $3==1 && $4==2)
	{
		sent1++;
	}
	else if($1=="+" && $3==0 && $4==2)
	{
		sent2++;
	}
	else if($1=="r" && $3==2 && $4==3)
	{
		rcvd++;
	}
}
END {
	printf("\nNumber of packets dropped is: %d\n",$11);
	printf("Packet sent from source node 1 is: %d\n",sent1);
	printf("Packet sent from source node 2 is: %d\n",sent2);
	printf("Packet received is: %d\n",rcvd);
	sent=sent1+sent2;
	printf("Packet delivery ratio is: %.2f\n",(rcvd/sent)*100);
}
