all: vim zsh

.PHONY: vim zsh init

init:
	mkdir -p ~/tmp

vim:
	./vim/install.sh

zsh:
	./zsh/install.sh
