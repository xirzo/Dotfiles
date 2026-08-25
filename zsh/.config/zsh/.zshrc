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

export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/config" 

export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

alias sps="sudo pacman -S "
alias sprns="sudo pacman -Rns "
alias cdsteamhome="$XDG_DATA_HOME/steam-home"
alias g='git'
alias t='tmux'
alias ta='tmux a'
alias lg='lazygit'
alias v='vim'
alias nix-shell='nix-shell --run zsh'
alias gvim='GTK_THEME=Adwaita:dark gvim'
alias tldr='tldr --short-options'

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
# export MANPAGER=less
export MANPAGER="vim -M +MANPAGER -c 'map q :q<CR>' -"
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

# js stuff
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc 

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export PATH="$XDG_DATA_HOME/cargo/bin:$PATH"

# odin
# export PATH="/opt/Odin:$PATH"
# export ODIN_ROOT="/opt/Odin"
# export LD_LIBRARY_PATH="/opt/Odin/vendor/raylib/linux:$LD_LIBRARY_PATH"

# for use with arch's odin package 
# WARN: also need to have raylib installed and 
#   `sudo ln -sf /usr/lib/libraylib.so /usr/lib/odin/vendor/raylib/linux/libraylib.so.600`
#   `sudo ln -sf /usr/lib/libraylib.a /usr/lib/odin/vendor/raylib/linux/libraylib.a`
export ODIN_ROOT="/usr/lib/odin"

# golang
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="$(go env GOPATH)/bin:$PATH"

# dotnet
export DOTNET_ROOT="/usr/share/dotnet"
export PATH="$DOTNET_ROOT:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
