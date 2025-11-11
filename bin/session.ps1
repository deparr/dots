$root = $env:DEV_ROOT ?? "v:\dev"
$proj = $null
if (-not [string]::IsNullOrEmpty($args[0]) -and (test-path (join-path $root $args[0]))) {
    $proj = join-path $root $args[0]
} else {
    $proj = fd --exact-depth 2 --type d  --color never . $root | & $env:FILTER_PROG
    if ($lastexitcode -ne "0") {
        exit 0
    }
}

cd $proj
$Host.UI.RawUI.WindowTitle = (split-path $proj -LeafBase)
