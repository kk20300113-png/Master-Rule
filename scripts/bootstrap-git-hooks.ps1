param(
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
)

$ErrorActionPreference = "Stop"

$hooksPath = Join-Path $RepoRoot ".githooks"
$profileSource = Join-Path $RepoRoot "vscode-profile"
$successMarker = git -C $RepoRoot rev-parse --git-path master-rules-profile-sync.last-success
$errorMarker = git -C $RepoRoot rev-parse --git-path master-rules-profile-sync.last-error

if (-not (Test-Path $hooksPath)) {
    throw "Hook directory not found at $hooksPath"
}

if (-not (Test-Path $profileSource)) {
    throw "VS Code profile source not found at $profileSource"
}

$profileFileCount = (Get-ChildItem -Path $profileSource -Recurse -File -Filter *.md | Measure-Object).Count
if ($profileFileCount -eq 0) {
    throw "VS Code profile source is empty at $profileSource"
}

git -C $RepoRoot config core.hooksPath $hooksPath

& (Join-Path $RepoRoot "scripts\install-vscode-profile.ps1")

@(
    "hook=bootstrap",
    "commit=$(git -C $RepoRoot rev-parse HEAD)",
    "timestamp=$([DateTime]::UtcNow.ToString('yyyy-MM-ddTHH:mm:ssZ'))"
) | Set-Content -Path $successMarker -Encoding UTF8

if (Test-Path $errorMarker) {
    Remove-Item $errorMarker -Force
}

Write-Host "Git hooks bootstrapped successfully."
Write-Host "Repo root : $RepoRoot"
Write-Host "Hooks path: $hooksPath"
Write-Host "Future git pull, checkout, and rebase operations in this repo will auto-sync the VS Code profile bundle."
