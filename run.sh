#!/usr/bin/env bash

maxq=100 # Max buffer size of network interface in packets
cong="reno" #Congestion control algorithm
qman="pfifo_fast"  #Queue management algorithm
bw_host=1000 #Bandwidth of host link


# The out images of plots
Q="./images/${cong}_queue__bw_${bw_host}__q_${maxq}.png"  
P="./images/${cong}_ping__bw_{$bw_host}__q_{$maxq}.png"

# Execute tcp.py
python tcp.py --bw-host $bw_host \
        --bw-net 2 \
        --delay 100 \
        --dir ./ \
        --time 25\
        --maxq $maxq \
        --cong $cong \
        --qman $qman \
        

# Mkae plots
python plot_queue.py --files q.txt --out $Q
python plot_ping.py --files ping.txt --out $P

# Clean 
mn -c
