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
sudo partprobe  /dev/sdb

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

#montamos de forma persistente

echo "/dev/sdc5  /Examenes-UTN/alumno_1/parcial_1   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "/dev/sdc6  /Examenes-UTN/alumno_1/parcial_2   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "/dev/sdc7  /Examenes-UTN/alumno_1/parcial_3   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "/dev/sdc8  /Examenes-UTN/alumno_2/parcial_1   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "/dev/sdc9  /Examenes-UTN/alumno_2/parcial_2   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "/dev/sdc10  /Examenes-UTN/alumno_2/parcial_3   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "/dev/sdc11  /Examenes-UTN/alumno_3/parcial_1   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "/dev/sdc12  /Examenes-UTN/alumno_3/parcial_2   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "/dev/sdc13  /Examenes-UTN/alumno_3/parcial_3   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
echo "/dev/sdc14  /Examenes-UTN/profesores   ext4  defaults  0 0"  | sudo tee -a /etc/fstab
sudo systemctl daemon-reload
sudo mount -a
