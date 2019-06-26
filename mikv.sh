wget https://download2.mikrotik.com/routeros/6.40.8/chr-6.40.8.img.zip
unzip *.img.zip
dd if=chr-6.40.8.img of=/dev/vda
reboot
