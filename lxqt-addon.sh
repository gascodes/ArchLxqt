#!/bin/bash
func_instalar() {
	if pacman -Qi $1 &> /dev/null; then
	else
    	sudo pacman -S --noconfirm --needed $1 
    fi
}


lista=(
pulseaudio-bluetooth
bluez
bluez-libs
bluez-utils
blueberry
qt5-stylesplugin
ksmoothdock
make
zsh-autosuggestions
zsh-syntax-highlighting
zsh-lovers
gvfs
gvfs-afc
inter-font
terminus-font
catppuccin-gtk-theme
)

count=0

for paquete in "${lista[@]}" ; do
	count=$[count+1]
	func_instalar $paquete
done

#Habilitando Servicios
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf
