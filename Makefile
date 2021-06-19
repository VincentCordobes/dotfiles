all: init vim zsh code node

.PHONY: vim zsh code init

init:
	mkdir -p ~/tmp

vim:
	./vim/install.sh

zsh:
	./zsh/install.sh

code:
	./code/install.sh

node:
	./node/install.sh

.PHONY: bluetooth
bluetooth:
	sudo pacman -S --needed --noconfirm \
		bluez \
		bluez-utils
	systemctl enable bluetooth.service

.PHONY: python
python:
	sudo pacman -S --needed --noconfirm python-pip

.PHONY: tlp
tlp:
	sudo pacman -S --needed --noconfirm tlp tlp-rdw
	systemctl enable tlp.service
	systemctl enable NetworkManager-dispatcher.service
	systemctl mask systemd-rfkill.service
	systemctl mask systemd-rfkill.socket
