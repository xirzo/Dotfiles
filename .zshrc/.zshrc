autoload -Uz compinit
zmodload zsh/complist
compinit

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


HISTSIZE=50000
SAVEHIST=50000

setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

source /home/alex/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh-themes/gruber-dark.omp.json)"

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

GOPATH=$HOME/go  PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

bindkey -s ^a "nvims\n"

export MANPAGER="nvim +Man!"
