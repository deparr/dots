$root = $env:DEV_ROOT ?? "v:\dev"
if ($args[0] -eq "-b" -or $args[0] -eq "--build") {
    $root = $env:BUILD_ROOT ?? "v:\build"
    $args = $args[1..($args.Length - 1)]
}

$proj = $null
if (-not [string]::IsNullOrEmpty($args[0]) -and (test-path (join-path $root $args[0]))) {
    $proj = join-path $root $args[0]
} else {
    $proj = fd --exact-depth 2 --type d . $root | & $env:FILTER_PROG
    if ($lastexitcode -ne "0") {
        exit 0
    }
}

cd $proj
$Host.UI.RawUI.WindowTitle = (split-path $proj -LeafBase)
