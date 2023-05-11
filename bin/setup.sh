#!/usr/bin/bash

exclude=( install.sh setup.sh )
bins=$HOME/.config/bin
target=$HOME/.local/bin

is_in () {
    local ck=$1
    shift
    local arr=("$@")
    for val in "${arr[@]}"; do
        [[ "$val" == "$ck" ]] && return 1
    done

    return 0 
}

echo "moving to $target..."

for s in $bins/*; do
    is_in "${s##*/}" "${exclude[@]}"
    if [[ "$?" == "0" ]]; then
        cp $s $target
    fi
done

echo "done"

