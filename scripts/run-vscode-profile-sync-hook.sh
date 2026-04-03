#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"

run_powershell_sync() {
  if command -v powershell.exe >/dev/null 2>&1; then
    powershell.exe -ExecutionPolicy Bypass -File "$repo_root/scripts/install-vscode-profile.ps1"
    return $?
  fi

  if command -v pwsh >/dev/null 2>&1; then
    pwsh -File "$repo_root/scripts/install-vscode-profile.ps1"
    return $?
  fi

  return 1
}

os_name="$(uname -s 2>/dev/null || echo unknown)"
case "$os_name" in
  MINGW*|MSYS*|CYGWIN*)
    if ! run_powershell_sync; then
      echo "master-rules hook: could not find PowerShell to sync the VS Code profile." >&2
      exit 1
    fi
    ;;
  *)
    bash "$repo_root/scripts/install-vscode-profile.sh"
    ;;
esac
