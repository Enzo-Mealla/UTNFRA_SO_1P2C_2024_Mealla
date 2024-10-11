#!/bin/bash

#buscamos el disco a particionar que sea de 10gb
sudo fdisk -l

#Disk /dev/sdc: 10Gib, lo particionamos en 1 disco extendido y lo dividimos en 10 logicos

sudo fdisk /dev/sdc << EOF
n
e
1


p
w
EOF


for i in {1..9}
do
	       
	sudo fdisk /dev/sdc <<EOF
        n

        +1G
        p
        w

EOF
done
#nos queda un disco con menos de 1gib
sudo fdisk /dev/sdc << EOF
n


p
w
EOF


