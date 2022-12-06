BEGIN {
	bytes_rcvd=0;
	throughput=0;
}
{
	pkt_size=$6;
	if($2>1 && $2<5)
	{
		if($1=="r" && $5=="cbr")
		{
			bytes_rcvd=bytes_rcvd+pkt_size;
		}
	}
}
END {
	throughput=bytes_rcvd/(4*60);
	printf("Throughput is %f kbps\n",throughput/1024);
}
	
