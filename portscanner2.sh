#!/bin/bash
# Collabored with Matt Bobbitt, Alayna Cash, & Morgan Hanrahan 

ip_prefix=$1
port=$2
#if [ -n "$1" ] && [ -n "$2" ]; then
    for host in $(seq 1 254);
   	do	 			
		timeout .1 bash -c "echo >/dev/tcp/$ip_prefix.$host/$port" 2> /dev/null
      		if [ $? -eq 0 ];
		then
	   	   echo "port $port is OPEN  on host $ip_prefix.$host" > sweep4.txt
		else 
	           echo "port $port is not open on host $ip_prefix.$host"
		fi
    done	
cat sweep4.txt 
