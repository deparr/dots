
$psstyle.FileInfo.Directory = "`e[34m" # blue
$psstyle.FileInfo.Extension.Item('.zip') = "`e[91m"
$psstyle.FileInfo.Extension.Item('.tgz') = "`e[91m"
$psstyle.FileInfo.Extension.Item('.gz') = "`e[91m"
$psstyle.FileInfo.Extension.Item('.tar') = "`e[91m"
$psstyle.FileInfo.Extension.Item('.7z') = "`e[91m"
$psstyle.FileInfo.Extension.Item('.nupkg') = "`e[91m"
$psstyle.FileInfo.Extension.Item('.cab') = "`e[91m"
$psstyle.FileInfo.Extension.Item('.sh') = "`e[32m"
# $psstyle.FileInfo.Extension.Item('.md') = "`e[33m"

$PROFILE="C:\Users\Dpar\Documents\PowerShell\Profile.ps1"
$HISTFILE="C:\Users\Dpar\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
$env:STARSHIP_CONFIG = "$HOME\.starship.toml"
# $env:RECYCLER_DIR = "V:\Code\recycler"
$env:YAZI_FILE_ONE = "C:\Program Files\Git\usr\bin\file.exe"
$env:FZF_DEFAULT_OPTS = "--color fg:242,bg:-1,hl:65,fg+:15,bg+:-1,hl+:108 --color info:108,prompt:109,spinner:108,pointer:168,marker:168"

$env:DEV_ROOT = "V:\dev"
$env:FILTER_PROG = "fzf"
# for treesitter
$env:CC = "cc.exe"
Set-PSReadLineOption -Colors @{
    Command = "`e[34m"
    Comment = "`e[91m"
    Operator = "`e[33m"
    String = "`e[33m"
    Keyword = "`e[34m"
    # Variable = "`e[96m"
    Parameter = "`e[93m"
    InlinePrediction = "`e[90m"
}
Set-PSReadLineKeyHandler -Chord Ctrl+Spacebar -Function AcceptSuggestion
# Set-PSReadLineKeyHandler -Chord Tab -Function AcceptNextSuggestionWord

sal -Name cat -Value bat

. V:\.local\bin\bat\autocomplete\_bat.ps1
. V:\.local\bin\fd\autocomplete\fd.ps1
. V:\.local\bin\ripgrep\complete\_rg.ps1

Invoke-Expression (&starship init powershell)

function which ($cmd) {
	$cmd = gcm $cmd 2> $null || $cmd
	$name = $cmd.Name
	$desc = "no $cmd in path"
	switch ($cmd.CommandType) {
		"Application" {
			$desc = $cmd.Path
		}
		"Alias" {
			$desc = $cmd.Definition
			$desc = "$name is $desc"
		}
		"Function" {
			$desc = $cmd.Definition
			$desc = "$name is $desc"
		}
		"ExternalScript" {
			$desc = $cmd.Source
			$desc = "$name is $desc"
		}
	}
	echo "$desc"
}

function ln($t, $d) {
    ni "$d" -i SymbolicLink -ta "$t"
}

function opam-env() {
    (& opam env --switch=default) -split '\r?\n' | ForEach-Object { Invoke-Expression $_ }
}

function gs() {
    git status
}

function gd() {
    git diff
}

function gds() {
    git diff --stat
}

function bg() {
    Start-Process -NoNewWindow @args
}

function venv() {
    ./.venv/Scripts/activate.ps1
}

# godot vim
function gvim {
    [CmdletBinding()]
    param ([Parameter(ValueFromRemainingArguments)] $Args)
    nvim --listen 127.0.0.1:6004  @Args
    # neovide -- --listen 127.0.0.1:6004 @Args
}

function pcolors {
    $rows = @(
        "`e[39m 39`e[0m `e[37m 37`e[0m `e[49m 49`e[0m `e[47m 47`e[0m",
        "`e[30m 30`e[0m `e[90m 90`e[0m `e[39m`e[40m 40`e[0m `e[30m`e[100m100`e[0m",
        "`e[31m 31`e[0m `e[91m 91`e[0m `e[30m`e[41m 41`e[0m `e[30m`e[101m101`e[0m",
        "`e[32m 32`e[0m `e[92m 92`e[0m `e[30m`e[42m 42`e[0m `e[30m`e[102m102`e[0m",
        "`e[33m 33`e[0m `e[93m 93`e[0m `e[30m`e[43m 43`e[0m `e[30m`e[103m103`e[0m",
        "`e[34m 34`e[0m `e[94m 94`e[0m `e[30m`e[44m 44`e[0m `e[30m`e[104m104`e[0m",
        "`e[35m 35`e[0m `e[95m 95`e[0m `e[30m`e[45m 45`e[0m `e[30m`e[105m105`e[0m",
        "`e[36m 36`e[0m `e[96m 96`e[0m `e[30m`e[46m 46`e[0m `e[30m`e[106m106`e[0m"
    )
    foreach ($line in $rows) {
        Write-Host $line
    }
}

function recycle ($query) {

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


function hex($val) {
    '{0:x}' -f $val
}

function dec($val) {
    '{0:d}' -f [Convert]::ToInt64($val, 16)
}

function file($arg) {
    & "C:\Program Files\Git\usr\bin\file.exe" "$arg"
}

remove-alias -for diff # compare-object is actually useless
function diff() {
    [CmdletBinding()]
    param ([Parameter(ValueFromRemainingArguments)] $Args)
    & "C:\Program Files\Git\usr\bin\diff.exe" @Args
}

