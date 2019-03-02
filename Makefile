all: vim zsh code

.PHONY: vim zsh code init

init:
	mkdir -p ~/tmp

vim:
	./vim/install.sh

zsh:
	./zsh/install.sh

code:
	./code/install.sh
