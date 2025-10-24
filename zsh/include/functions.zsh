#!/bin/zsh

# Extract most files
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1 ;;
             *.tar.gz)    tar xzf $1 ;;
             *.bz2)       bunzip2 $1 ;;
             *.rar)       rar x $1   ;;
             *.gz)        gunzip $1  ;;
             *.tar)       tar xf $1  ;;
             *.tbz2)      tar xjf $1 ;;
             *.tgz)       tar xzf $1 ;;
             *.zip)       unzip $1   ;;
             *.Z)         uncompress $1 ;;
             *.7z)        7z x $1 ;;
             *.xz)        unxz $1 ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# don't source node at startup
function snode() {
    source $XDG_CONFIG_HOME/zsh/plugin/zsh-nvm/zsh-nvm.plugin.zsh
}

function geometry_bun() {
    test -f bun.lockb || return 1
    GEOMETRY_BUN=$(ansi yellow ${GEOMETRY_BUN_SYMBOL="󰋙"})
    echo -n "$GEOMETRY_BUN v$(bun --version)"
}

function geometry_go() {
    test -f go.mod || test -f go.sum || return 1
    GEOMETRY_GO=$(ansi cyan ${GEOMETRY_GO_SYMBOL="󰋙"})
    local go_ver="$(go version | grep --color=never -oE '[0-9]+\.[0-9]+\.[0-9]')"
    echo -n "$GEOMETRY_GO v$go_ver"
}

function geometry_zig() {
    test -f build.zig || test -f build.zig.zon || return 1
    GEOMETRY_ZIG=$(ansi yellow ${GEOMETRY_ZIG_SYMBOL=""})
    echo -n "$GEOMETRY_ZIG v$(zig version)"
}

function geometry_rust() {
    test -f Cargo.toml || return 1
    GEOMETRY_RUST=$(ansi red ${GEOMETRY_RUST_SYMBOL="󰋘"})
    local rust_ver="$(rustc --version | grep --color=never -oE '[0-9]+\.[0-9]+\.[0-9]')"
    echo -n "$GEOMETRY_RUST v$rust_ver"
}

function geometry_better_jobs() {
    [[ 0 -ne "$(jobs -s | wc -l)" ]] && ansi magenta '%(j.✦%j.fj)'
}

function better_ctrl_z() {
    if [[ -n $(jobs -sp) ]]; then
        if [[ $#BUFFER -ne 0 ]]; then
            zle push-input
        fi

        BUFFER="fg"
        zle accept-line
    fi
}


zle -N better_ctrl_z
bindkey '^z' better_ctrl_z
