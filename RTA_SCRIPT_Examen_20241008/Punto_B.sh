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
sudo mkfs -t ext4 /dev/sdc1

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

#formateamos los discos

sudo mkfs -t ext4 /dev/sdc5
sudo mkfs -t ext4 /dev/sdc6
sudo mkfs -t ext4 /dev/sdc7
sudo mkfs -t ext4 /dev/sdc8
sudo mkfs -t ext4 /dev/sdc9
sudo mkfs -t ext4 /dev/sdc10
sudo mkfs -t ext4 /dev/sdc11
sudo mkfs -t ext4 /dev/sdc12
sudo mkfs -t ext4 /dev/sdc13
sudo mkfs -t ext4 /dev/sdc14


