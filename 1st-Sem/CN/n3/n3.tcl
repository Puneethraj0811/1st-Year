# This script is created by NSG2 beta1
# <http://wushoupong.googlepages.com/nsg>

#===================================
#     Simulation parameters setup
#===================================
set val(stop)   20.0                         ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator -multicast on] ; #enable multicast routing

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
set namfile [open out.nam w]
$ns namtrace-all $namfile

set group [Node allocaddr] ; #create multicast capable nodes

#===================================
#        Nodes Definition        
#===================================
#Create 5 nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

#===================================
#        Links Definition        
#===================================
#Createlinks between nodes
$ns duplex-link $n0 $n1 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n1 50
$ns duplex-link $n0 $n2 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n2 50
$ns duplex-link $n0 $n3 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n3 50
$ns duplex-link $n0 $n4 100.0Mb 10ms DropTail
$ns queue-limit $n0 $n4 50

#Give node position (for NAM)
$ns duplex-link-op $n0 $n1 orient right
$ns duplex-link-op $n0 $n2 orient left-down
$ns duplex-link-op $n0 $n3 orient left
$ns duplex-link-op $n0 $n4 orient left-up

set mproto DM ; #configure multicast protocol
set mrthandle [$ns mrtproto $mproto] ; #all nodes will contain multicast agents at node 1

#===================================
#        Agents Definition        
#===================================
set udp [new Agent/UDP]
$ns attach-agent $n0 $udp

$udp set dst_addr_ $group #set destination address to source(no)
$udp set dst_port_ 0 #set destination port

set rcvr1 [new Agent/LossMonitor] ;#create a receiver agent at node 1
$ns attach-agent $n1 $rcvr1
$ns at 1.2 "$n1 join-group $rcvr1 $group" ;#at what time n1 will join the group as soon as n0 start transmitting the packet to n1

$ns at 1.9 "$n1 leave-group $rcvr1 $group" ;#at what time n1 will leave the group

set rcvr2 [new Agent/LossMonitor] ;#create a receiver agent at node 2
$ns attach-agent $n2 $rcvr2
$ns at 1.4 "$n2 join-group $rcvr2 $group" ;#at what time n1 will join the group as soon as n0 start transmitting the packet to n2

set rcvr3 [new Agent/LossMonitor] ;#create a receiver agent at node 3
$ns attach-agent $n3 $rcvr3
$ns at 1.6 "$n3 join-group $rcvr3 $group" ;#at what time n1 will join the group as soon as n0 start transmitting the packet to n3

set rcvr4 [new Agent/LossMonitor] ;#create a receiver agent at node 4
$ns attach-agent $n4 $rcvr4
$ns at 1.8 "$n4 join-group $rcvr4 $group" ;#at what time n1 will join the group as soon as n0 start transmitting the packet to n4

#===================================
#        Applications Definition        
#===================================
#Setup a CBR Application over UDP connection
set cbr0 [new Application/Traffic/CBR]
$cbr0 attach-agent $udp
$cbr0 set packetSize_ 1000
$cbr0 set rate_ 1.0Mb
$cbr0 set random_ null
$ns at 1.0 "$cbr0 start"
$ns at 5.0 "$cbr0 stop"


#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile namfile
    $ns flush-trace
    close $tracefile
    close $namfile
    exec nam out.nam &
    exec -f n3.awk out.tr&
    exit 0
}
$ns at $val(stop) "$ns nam-end-wireless $val(stop)"
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run

