#!/bin/bash
# Collabored with Zach Morris, Matt Bobbitt, Alayna Cash, & Morgan Hanrahan 

hostfile=$1
portfile=$2
if [ -n "$1" ] && [ -n "$2" ]; then
	for host in $(cat $hostfile); do
  		for port in $(cat $portfile); do
    			if timeout .1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null; then
      				echo "port $port is OPEN  on host $host!!"
			else 
				echo "port $port is not open on host $host."
			fi

		done	
        done
else 
       echo "Invalid Parameters. Must have two files as parameters."	
fi
