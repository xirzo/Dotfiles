HISTSIZE=50000
SAVEHIST=50000
HYPHEN_INSENSITIVE="true"
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY   
export HISTFILE=$HOME/.config/zsh/.zsh_history

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

alias g='git'
alias lg='lazygit'
alias v='vim'
alias nix-shell='nix-shell --run zsh'
alias gvim='GTK_THEME=Adwaita:dark gvim'
alias tldr='tldr --short-options'

plugins=(git)

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export MANPAGER="less"
export EDITOR=vim

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

export ZSH="$HOME/.config/oh-my-zsh" # makes sure that oh-my-zsh is installed in the right place
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"

export PATH="/opt/Odin:$PATH"
export ODIN_ROOT="/opt/Odin"
export LD_LIBRARY_PATH="/opt/Odin/vendor/raylib/linux:$LD_LIBRARY_PATH"

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc 
