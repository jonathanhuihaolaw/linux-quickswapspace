#!/bin/bash

echo "How much swap do you want to allocate"
read -p "Enter swap size in GB : "  swapsize
echo " "

grep -q "swapfile" /etc/fstab
if [ $? -ne 0 ]; then
	echo "Creating swap..."
else
	echo -e "\e[93mSwapfile found. Removing...\e[0m"
	sudo swapoff -v /swapfile
	sudo rm /swapfile
	echo 'Creating....'
fi

sudo fallocate -l ${swapsize}G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo " "
if [ $? -ne 0 ]; then
	sudo echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
	echo "Creating swap on boot"
else
	echo 'Swapfile already set on boot'
fi

sudo swapon --show
sudo rm -f create-swap.sh
