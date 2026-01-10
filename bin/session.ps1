$root = $env:DEV_ROOT ?? "v:\dev"
$proj = $null
$hasArg = -not [string]::IsNullOrEmpty($args[0])
if ($hasArg -and (test-path (join-path $root $args[0]))) {
    $proj = join-path $root $args[0]
} else {
    $query = @()
    if ($hasArg) {
        $query = @("--query=$($args[0])")
    }
    $proj = fd --exact-depth 2 --type d  --color never . $root | & $env:FILTER_PROG @query --select-1
    if ($lastexitcode -ne "0") {
        exit 0
    }
}

cd $proj
$Host.UI.RawUI.WindowTitle = (split-path $proj -LeafBase)
