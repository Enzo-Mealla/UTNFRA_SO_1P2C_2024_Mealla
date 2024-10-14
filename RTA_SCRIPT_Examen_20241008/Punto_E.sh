#!/bin/bash

#buscamos la informacion en la ubicacion
cat /proc/meminfo | grep -i "mem"
#filtramos el dato que nos interesa:
cat /proc/meminfo | grep -i "memtotal"
#lo trasladamos al archivo:

sudo cat /proc/meminfo | grep -i "memtotal" > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Mealla/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
#repetimos proceso con los demas filtros

sudo dmidecode -t chassis | grep -i "chassis" >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Mealla/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt

sudo dmidecode -t chassis | grep -i "manufacturer" >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_Mealla/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt

