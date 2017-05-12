autoload -U promptinit; promptinit
prompt pure

# # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# # Path to your oh-my-zsh installation.
# export ZSH=/Users/vincent/.oh-my-zsh
#
# # Set name of the theme to load. Optionally, if you set this to "random"
# # it'll load a random theme each time that oh-my-zsh is loaded.
# # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# # ZSH_THEME="robbyrussell"
# ZSH_THEME="pure"
#
# # Uncomment the following line to disable auto-setting terminal title.
# # DISABLE_AUTO_TITLE="true"
#
# # Uncomment the following line to enable command auto-correction.
# # ENABLE_CORRECTION="true"
#
# # Uncomment the following line to display red dots whilst waiting for completion.
# # COMPLETION_WAITING_DOTS="true"
#
# # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# # Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# # Example format: plugins=(rails git textmate ruby lighthouse)
# # Add wisely, as too many plugins slow down shell startup.
# # plugins=(git, tmux)
#
# source $ZSH/oh-my-zsh.sh
#
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# =======================
# My stuffs...
# =======================
# Aaliases
alias vim="nvim"
alias ta='tmux attach -t'
alias vimdiff="nvim -d"
alias cdFluo="cd ~/workspace/fluo"
alias l='ls -lFh'
alias la='ls -lAFh'



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# use ag for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# # export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

function fluoBackend() {
 pushd
 cd ~/workspace/fluo/backend
 mvn clean install -DskipTests
 cd backend-app
 mvn jetty:run
 popd
}

# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# export PATH="$HOME/.yarn/bin:$PATH"
