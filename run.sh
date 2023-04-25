#!/usr/bin/env bash
# pfifo_fast
maxq=100 # Max buffer size of network interface in packets
cong="bbr" #Congestion control algorithm
qman="fq"  #Queue management algorithm
bw_host=100 #Bandwidth of host link

Q="./images/${cong}_queue__bw_${bw_host}__q_${maxq}.png"
P="./images/${cong}_ping__bw_{$bw_host}__q_{$maxq}.png"

python tcp.py --bw-host $bw_host \
        --bw-net 2 \
        --delay 100 \
        --dir ./ \
        --time 25\
        --maxq $maxq \
        --cong $cong \
        --qman $qman \
        


python plot_queue.py --files q.txt --out $Q
python plot_ping.py --files ping.txt --out $P
mn -c
