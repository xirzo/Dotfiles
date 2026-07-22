HISTSIZE=50000
SAVEHIST=50000
HYPHEN_INSENSITIVE="true"
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY   

alias g='git'
alias lg='lazygit'
alias v='vim'
alias nix-shell='nix-shell --run zsh'

plugins=(git)

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export MANPAGER="less"
export EDITOR=vim
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# delete directory paths word-by-word
backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
    zle -f kill
}
zle -N backward-kill-dir

bindkey '^[^?' backward-kill-dir
bindkey '^[[Z' reverse-menu-complete
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

unsetopt pathdirs
zstyle ':completion:*' menu select

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2026-07-21 22:22:56
export PATH="$PATH:/home/xir/.local/bin"

# opencode
export PATH=/home/xir/.opencode/bin:$PATH
