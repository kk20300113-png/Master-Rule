param(
    [string]$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path,
    [string]$TargetRoot = (Join-Path $env:APPDATA "Code\User"),
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$sourceRoot = Join-Path $RepoRoot "vscode-profile"
$manifestPath = Join-Path $TargetRoot "master-rules-vscode-profile.manifest.txt"
$managedSubdirs = @("agents", "instructions", "prompts")

function Convert-ToPortableRelativePath {
    param([string]$PathValue)
    return ($PathValue -replace '[\\/]', '/')
}

function Convert-ToTargetRelativePath {
    param([string]$RelativePath)
    return $RelativePath.Replace('/', [System.IO.Path]::DirectorySeparatorChar)
}

function Test-IsSafeTargetRoot {
    param([string]$PathValue)

    $allowedRoots = @($env:APPDATA, $env:LOCALAPPDATA, $env:USERPROFILE) |
        Where-Object { $_ -and $_.Trim() -ne "" } |
        ForEach-Object { [System.IO.Path]::GetFullPath($_) }

    $resolvedTarget = [System.IO.Path]::GetFullPath($PathValue)
    foreach ($allowedRoot in $allowedRoots) {
        if ($resolvedTarget.StartsWith($allowedRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
            return $true
        }
    }

    return $false
}

function Test-IsManagedRelativePath {
    param([string]$RelativePath)

    if ([string]::IsNullOrWhiteSpace($RelativePath)) {
        return $false
    }

    $portable = Convert-ToPortableRelativePath $RelativePath
    if ($portable.StartsWith("/")) {
        return $false
    }

    $segments = $portable.Split('/')
    if ($segments -contains "..") {
        return $false
    }

    return $segments[0] -in $managedSubdirs
}

function Show-NextSteps {
    param([string]$RepoRootPath)

    $sopPath = Join-Path $RepoRootPath "NEW_DEVICE_SOP.md"

    Write-Host ""
    Write-Host "Next step - VS Code validation"
    Write-Host "Open a fresh Copilot Chat in Agent mode and paste:"
    Write-Host ""
    Write-Host "orchestrated standard: I am validating that this device loaded the shared VS Code profile bundle correctly. Run Phase 1 only for a tiny feature named status banner that shows System Ready and emits one structured startup log event. Do not write code yet. Stop at the checkpoint and require the exact token before Phase 2."
    Write-Host ""
    Write-Host "Expected result:"
    Write-Host "- Agent Mode Check banner"
    Write-Host "- Phase 1 checkpoint token"
    Write-Host "- No file writes before exact token approval"
    Write-Host ""
    Write-Host "New device SOP: $sopPath"
}

if (-not (Test-Path $sourceRoot)) {
    throw "VS Code profile source not found at $sourceRoot"
}

if (-not (Test-IsSafeTargetRoot $TargetRoot)) {
    throw "TargetRoot must stay inside your user profile directories. Received: $TargetRoot"
}

New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null

$sourceFiles = foreach ($subdir in $managedSubdirs) {
    $managedSourceDir = Join-Path $sourceRoot $subdir
    if (Test-Path $managedSourceDir) {
        Get-ChildItem -Path $managedSourceDir -Recurse -File |
            Where-Object { $_.Extension -eq ".md" } |
            Sort-Object FullName |
            ForEach-Object {
                Convert-ToPortableRelativePath $_.FullName.Substring($sourceRoot.Length + 1)
            }
    }
}

$currentFiles = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
foreach ($relativePath in $sourceFiles) {
    [void]$currentFiles.Add($relativePath)
}

if (Test-Path $manifestPath) {
    $previousFiles = Get-Content $manifestPath |
        Where-Object { $_.Trim() -ne "" } |
        Where-Object { Test-IsManagedRelativePath $_ }
    foreach ($relativePath in $previousFiles) {
        if (-not $currentFiles.Contains($relativePath)) {
            $staleTarget = Join-Path $TargetRoot (Convert-ToTargetRelativePath $relativePath)
            if (Test-Path $staleTarget) {
                if ($DryRun) {
                    Write-Host "[DryRun] Would remove stale file: $relativePath"
                }
                else {
                    Remove-Item $staleTarget -Force
                    $parentDir = Split-Path $staleTarget -Parent
                    if ($parentDir -and (Test-Path $parentDir)) {
                        $isEmpty = (Get-ChildItem $parentDir -Force | Measure-Object).Count -eq 0
                        if ($isEmpty) {
                            Remove-Item $parentDir -Force
                        }
                    }
                }
            }
        }
    }
}

$copiedCount = 0
foreach ($relativePath in $sourceFiles) {
    $sourceFile = Join-Path $sourceRoot (Convert-ToTargetRelativePath $relativePath)
    $targetFile = Join-Path $TargetRoot (Convert-ToTargetRelativePath $relativePath)

    if ([System.IO.Path]::GetExtension($sourceFile) -ne ".md") {
        Write-Warning "Skipping non-markdown file: $relativePath"
        continue
    }

    if ($DryRun) {
        Write-Host "[DryRun] Would copy: $relativePath"
        continue
    }

    New-Item -ItemType Directory -Force -Path (Split-Path $targetFile -Parent) | Out-Null
    Copy-Item $sourceFile $targetFile -Force
    $copiedCount += 1
}

if (-not $DryRun) {
    $sourceFiles | Set-Content -Path $manifestPath -Encoding UTF8
}

Write-Host "VS Code profile synced successfully."
Write-Host "Repo root   : $RepoRoot"
Write-Host "Target root : $TargetRoot"
Write-Host "Files synced: $copiedCount"
if ($DryRun) {
    Write-Host "Dry run only: no files were changed."
}
else {
    Show-NextSteps $RepoRoot
}
