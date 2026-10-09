export DEJA_CYCLE_KEY=$'\e[Z'

autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zmodload zsh/complist
compinit
_comp_options+=('globdots')

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
eval "$(deja init zsh)"
eval "$(starship init zsh)"
 
spf() {
    os=$(uname -s)

    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}

alias ls='ls --color=auto'
