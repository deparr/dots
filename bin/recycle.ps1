function recycle ($query) {
    # note to future me: this was vibetranspiled from ./_reycycle
    # if there's errors with replacement/substitution/expansion, that's probably why

    $recycler_dir = $env:RECYCLER_DIR
    if ([string]::IsNullOrEmpty($recycler_dir)) {
        $recycler_dir = "V:\Code\recycler"
    }

    $recycler_base = Split-Path $recycler_dir -Leaf

    if ($query) {
        $query = @("--query=$query")
    }

    pushd
    cd $recycler_dir
    $selection= fd --color never --type file -E 'bin\*' -E 'readme.md' -E 'project.godot' -E '*.import' -E 'examples/*' | fzf @query
    popd
    $selection_full_path = Join-Path $recycler_dir $selection

    if ([string]::IsNullOrEmpty($selection)) {
        return
    }


    Write-Host -NoNewline "`e[36mcopy to where? `e[30m($selection)`e[0m "
    $user_path = Read-Host
    
    if ([string]::IsNullOrEmpty($user_path)) {
        $user_path = $selection
    }

    $user_path_parent = Split-Path $user_path -Parent
    if (-not [string]::IsNullOrEmpty($user_path_parent)) {
        New-Item -ItemType Directory -Force -Path $user_path_parent | Out-Null
    }

    cp -Path $selection_full_path -Destination $user_path -Force

    Write-Host "copied $selection to $user_path"
}
