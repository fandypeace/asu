#!/bin/bash
#@fandypeace 
#only deb/ubuntu

echo "############## Memulai Script ##############

## Checking if temp dir is available..."
if [ -d /temp ] 
then
    echo "-- Directory sudah ada!"
else
    echo "-- Membuat direktory temp!"
    mkdir /temp
fi
# 1
echo "## Persiapan Download CHR!"
read -p "Masukan Versi CHR untuk dipasang! (6.38.2, 6.40.1, etc):" version
# 2
if [ -f /temp/chr-$version.img ] 
then
    echo "-- CHR image sudah ada."
else
    echo "-- Download utilitas."
	apt-get install unzip -y
    echo "-- Downloading CHR $version file."
    cd  /temp
    echo "---------------------------------------------------------------------------"
    wget https://download2.mikrotik.com/routeros/$version/chr-$version.img.zip
    unzip chr-$version.img.zip
    echo "---------------------------------------------------------------------------"
fi
#3
echo "== memulai pengubahan!"
cd /temp
dd if=chr-$version.img of=/dev/vda
echo "otomatis restart!"
echo "############## Selesai! ##############"
/sbin/reboot 
