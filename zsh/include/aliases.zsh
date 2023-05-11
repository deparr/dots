#!/bin/zsh

alias s='source ~/.config/zsh/zshrc'

for c in sv shutdown poweroff reboot ; do
    alias $c="sudo $c"
done; unset c

# convenience
#alias \
#    ls='ls --color=auto' \
#    ll='ls -al --color=auto' \
#    la='la -A --color=auto' \
#    l='ls -CF --color=auto' \
#    l.='ls -d .* --color=auto'

alias \
    ls='exa -s=Name --color=auto' \
    ll='exa -s=Name -al --color=auto' \
    la='exa -s=Name -a --color=auto' \
    l='exa -F -s=Name --color=auto' \
    l.='exa -d -s=Name --color=auto .*' \
    diff="diff --color=auto" \
    rg="rg --color auto" \
    bc="bc -ql"

# remaps
alias \
    vim='nvim' \
    vimdiff='nvim -d' \
    lf='lfrun' \
    cat='bat -n ' \
    campus='ssh dmparr22@schizo.cs.byu.edu' \
    campusx='ssh -X dmparr22@schizo.cs.byu.edu' \
    zh='history|grep '

# xbps
alias \
    xi='sudo xbps-install -S' \
    xu='sudo xbps-install -Su' \
    xq='xbps-query' \
    xr='sudo xbps-remove -R'

alias diskspace='du -hS | sort -n -r | more'

# borken keyboard aliases
alias \
    jit='git ' \
    jo='go ' \
    jcc='gcc ' \
    j++='g++ ' \
    ytop='htop ' \

