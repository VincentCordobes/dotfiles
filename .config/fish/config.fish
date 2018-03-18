# fish
function fish_mode_prompt ; end

set -x EDITOR 'nvim'
set -x LANG 'en_US.UTF-8'
set -x LC_ALL 'en_US.UTF-8'

# aliases
alias vim "nvim"
alias ta 'tmux attach -t'
alias vimdiff "nvim -d"
alias cdFluo "cd ~/workspace/fluo"
alias l 'ls -lFh'
alias la 'ls -lAFh'
alias vw vim_wiki
alias gs 'git status'
alias fluowiki vim_wiki_fluo

# alias setAWSRole 'eval "$(pass AWS-Fluo/default/sts-env-vars)"'


# fzf respect .gitignore 
set -x FZF_DEFAULT_COMMAND 'ag -g ""'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -x FZF_DEFAULT_OPTS '--color=light,hl+:14,bg+:255,hl:14'

# aws profile
# set -x AWS_DEFAULT_PROFILE 'fluo'
# set -x AWS_PROFILE 'fluo'

alias weather:paris "curl wttr.in/paris"
# THEME PURE #
set fish_function_path /Users/vincent/.config/fish/functions/theme-pure $fish_function_path

# autojump
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

function vim_wiki
  pushd /Users/vincent/Dropbox/wiki/
    vim -c VimwikiIndex
  popd
end

function vim_wiki_fluo
  pushd /Users/vincent/Dropbox/job/fluo/wiki/
    vim -c VimwikiIndex2
  popd
end
