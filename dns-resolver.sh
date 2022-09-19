#!/bin/bash

network_prefix=$1
dns=$2

echo "dns resolution for $network_prefix"

for host in $(seq 1 254);
do
	nslookup $network_prefix.$host $dns | grep "name"	
done
