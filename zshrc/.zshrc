HISTSIZE=50000
SAVEHIST=50000

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

zstyle ':completion:*' menu select

backward-kill-dir () {
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
    zle -f kill
}

zle -N backward-kill-dir
bindkey '^[^?' backward-kill-dir
bindkey '^[[Z' reverse-menu-complete
bindkey '^[^?' backward-kill-dir
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

export GOPATH=$HOME/go  
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH="$PATH:$HOME/.dotnet/tools"

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++
# export MANPAGER="nvim +Man!"
export MANPAGER="less"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
setopt extendedglob
