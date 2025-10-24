#!/bin/zsh

alias s='source ~/.config/zsh/zshrc'

for c in sv shutdown poweroff reboot ; do
    alias $c="sudo $c"
done; unset c

alias \
    ls='lsr --icons=never' \
    ll='lsr -Al --icons=never' \
    la='lsr -A --icons=never' \
    l.='eza -d -s=Name --color=auto .*' \
    diff="diff --color=auto" \
    rg="rg --color auto" \
    bc="bc -ql" \
    venv="source .venv/bin/activate"

alias \
    gvim='nvim --listen /tmp/godot.pipe' \
    lf='lfrun' \
    cat='bat' \
	zh='nvim ~/.local/zsh_history' \

# xbps
alias \
    xi='sudo xbps-install -S' \
    xu='sudo xbps-install -Su' \
    xq='xbps-query' \
    xs='xbps-query -R' \
    xr='sudo xbps-remove -R'

alias diskspace='du -hS | sort -n -r | more'

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

