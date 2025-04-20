#!/bin/zsh

alias s='source ~/.config/zsh/zshrc'

for c in sv shutdown poweroff reboot ; do
    alias $c="sudo $c"
done; unset c
# alias sleep="sudo zzz"

alias \
    ls='eza -s=Name --color=auto' \
    ll='eza -s=Name -al --color=auto' \
    la='eza -s=Name -a --color=auto' \
    l='eza -F -s=Name --color=auto' \
    l.='eza -d -s=Name --color=auto .*' \
    diff="diff --color=auto" \
    rg="rg --color auto" \
    bc="bc -ql" \

alias \
    vim='nvim' \
    vimdiff='nvim -d' \
    gvim='nvim --listen /tmp/godot.pipe' \
    lf='lfrun' \
    cat='bat' \
	zh='nvim ~/.local/zsh_history' \
	cloc='scc --no-cocomo' \
	scc='scc --no-cocomo'
    #zhs='rg ~/.local/zsh_history'

# xbps
alias \
    xi='sudo xbps-install -S' \
    xu='sudo xbps-install -Su' \
    xq='xbps-query' \
    xs='xbps-query -R' \
    xr='sudo xbps-remove -R'

alias diskspace='du -hS | sort -n -r | more'

alias icat='wezterm imgcat'

# git
alias \
	gs='git status' \
	gwip='git add -A; git rm $(git ls-files) 2> /dev/null; git commit -m "[WIP]: $(date)"' \
	gpull='git pull' \
	gpush='git push' \
	gd='git diff' \
	gpm='git pull --merge' \
	gundo='git reset HEAD~'

grbi() {
	git rebase -i "HEAD~$1"
}

# broken keyboard aliases
alias \
    jit='git ' \
    jo='go ' \
    jcc='gcc ' \
    j++='g++ ' \
    ytop='htop ' \

