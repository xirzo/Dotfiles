HISTSIZE=50000
SAVEHIST=50000
HYPHEN_INSENSITIVE="true"
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY   

alias g='git'
alias lg='lazygit'
alias v='vim'

plugins=(git)

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export MANPAGER="less"
export EDITOR=emacs

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
ZSH_THEME="custom"
plugins=(git)
source $ZSH/oh-my-zsh.sh
