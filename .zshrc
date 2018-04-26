###########################################
# Oh My Zsh configuration                 #
###########################################

export ZSH=/Users/vincent/.oh-my-zsh

ZSH_THEME=""
DISABLE_AUTO_TITLE="true"
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

###########################################
# User configuration                      #
###########################################

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=vim
else
  export EDITOR=nvim
fi

# VI keys
export KEYTIMEOUT=1
bindkey -v

# Aliases
alias vim='nvim'
alias ta='tmux attach -t'
alias vimdiff='nvim -d'
alias l='ls -lFh'
alias la='ls -lAFh'
alias gs='git status'
alias ctop='ctop -i'

# nvm stuff
export NVM_DIR="$HOME/.nvm"
alias loadnvm='[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_OPTS='--color=light,hl+:14,bg+:255,hl:14'
export FZF_DEFAULT_OPTS='--color=light,bg+:255,hl:#00897B,hl+:#00897B'

# # pyenv
# export PATH="/Users/vincent/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# prompt
autoload -U promptinit; promptinit
prompt pure

# Specific Payfit
source $HOME/payfit/stack/.zshrc

export PATH="$PATH:./node_modules/.bin:../node_modules/.bin:./node_modules/eslint-config-payfit/node_modules/.bin"


ptag() {
  git log --oneline | grep "\[.*\]" | awk '!($2 in a) { a[$2];print $2 }' | fzf
}

vw() {
  (cd /Users/vincent/Dropbox/wiki; vim -c VimwikiIndex; clear)
}

todo() {
  (cd /Users/vincent/Dropbox/wiki; vim ./Tasks.md; clear)
}
	
pwiki() {
  (cd /Users/vincent/Dropbox/job/payfit/wiki; vim -c VimwikiIndex3; clear)
}

pdiary() {
  (cd /Users/vincent/Dropbox/job/payfit/wiki; vim -c VimwikiMakeDiaryNote)
}

tmp() {
  (cd /Users/vincent/tmp; vim tmp.md; clear)
}


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
