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
