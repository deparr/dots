function recycle ($query) {
    # note to future me: this was vibetranspiled from ./_reycycle
    # if there's errors with replacement/substitution/expansion, that's probably why

    $recycler_dir = $env:RECYCLER_DIR
    if ([string]::IsNullOrEmpty($recycler_dir)) {
        $recycler_dir = Join-Path $HOME "dev/recycler"
    }

    $recycler_base = Split-Path $recycler_dir -Leaf

    if ($query) {
        $query = "--query=$query"
    }

    # because you can't tell fd to print relative paths when the search dir is absolute
    pushd
    cd $recycler_dir
    $selection= fd --color never --type file -E 'bin\*' -E 'readme.md' -E 'project.godot' -E '*.import' -E 'examples/*' | fzf "$query"
    popd

    if ([string]::IsNullOrEmpty($selection)) {
        return
    }

    $selection_subpath = $selection -replace ".*$recycler_base[\\/]", ""

    Write-Host -NoNewline "`e[36mcopy to where? `e[30m($selection_subpath)`e[0m "
    $user_path = Read-Host

    if (-not [string]::IsNullOrEmpty($user_path)) {
        $selection_subpath = $user_path
    }

    $selection_subpath_dir = Split-Path $selection_subpath -Parent
    if (-not [string]::IsNullOrEmpty($selection_subpath_dir)) {
        New-Item -ItemType Directory -Force -Path $selection_subpath_dir | Out-Null
    }

    cp -Path $selection -Destination $selection_subpath -Force

    Write-Host "copied $selection to $selection_subpath"
}

