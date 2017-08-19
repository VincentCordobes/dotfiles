# fish

# aliases
alias vim "nvim"
alias ta 'tmux attach -t'
alias vimdiff "nvim -d"
alias cdFluo "cd ~/workspace/fluo"
alias l 'ls -lFh'
alias la 'ls -lAFh'



# fzf respect .gitignore 
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_DEFAULT_OPTS '--color=light,hl+:14,bg+:255,hl:14'

# aws profile
set -x AWS_DEFAULT_PROFILE 'fluo'
set -x AWS_PROFILE 'fluo'

alias weather:paris "curl wttr.in/paris"
# THEME PURE #
set fish_function_path /Users/vincent/.config/fish/functions/theme-pure $fish_function_path
