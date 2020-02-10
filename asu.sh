#!/bin/bash
#@fandypeace

echo "############## Memulai Script ##############

## Checking if temp dir is available..."
if [ -d /temp ] 
then
    echo "-- Directory sudah ada!"
else
    echo "-- Membuat direktory temp!"
    mkdir /temp
fi
# Ask user for version
echo "## Persiapan Download CHR!"
read -p "Masukan Versi CHR untuk dipasang! (6.38.2, 6.40.1, etc):" version
# Check if image is available and download if needed
if [ -f /temp/chr-$version.img ] 
then
    echo "-- CHR image sudah ada."
else
    echo "-- Downloading CHR $version file."
    cd  /temp
    echo "---------------------------------------------------------------------------"
    wget https://download2.mikrotik.com/routeros/$version/chr-$version.img.zip
    unzip chr-$version.img.zip
    echo "---------------------------------------------------------------------------"
fi
#memlu
echo "== memulai pengubahan!"
dd if=chr-$version of=/dev/vda
echo "succes"
read -p "reboot"
echo ""
echo "############## Selesai! ##############"
