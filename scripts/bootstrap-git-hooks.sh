#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
hooks_path="$repo_root/.githooks"
profile_source="$repo_root/vscode-profile"
success_marker="$(git -C "$repo_root" rev-parse --git-path master-rules-profile-sync.last-success)"
error_marker="$(git -C "$repo_root" rev-parse --git-path master-rules-profile-sync.last-error)"

if [[ ! -d "$hooks_path" ]]; then
  echo "Hook directory not found at $hooks_path" >&2
  exit 1
fi

if [[ ! -d "$profile_source" ]]; then
  echo "VS Code profile source not found at $profile_source" >&2
  exit 1
fi

profile_file_count="$(find "$profile_source" -type f -name '*.md' | wc -l | tr -d ' ')"
if [[ "$profile_file_count" == "0" ]]; then
  echo "VS Code profile source is empty at $profile_source" >&2
  exit 1
fi

chmod +x \
  "$repo_root/.githooks/run-sync" \
  "$repo_root/.githooks/post-merge" \
  "$repo_root/.githooks/post-checkout" \
  "$repo_root/.githooks/post-rewrite" \
  "$repo_root/scripts/run-vscode-profile-sync-hook.sh" \
  "$repo_root/scripts/bootstrap-git-hooks.sh" \
  "$repo_root/scripts/install-vscode-profile.sh"
git -C "$repo_root" config core.hooksPath "$hooks_path"

bash "$repo_root/scripts/install-vscode-profile.sh"

{
  echo "hook=bootstrap"
  echo "commit=$(git -C "$repo_root" rev-parse HEAD)"
  echo "timestamp=$(date -u +%Y-%m-%dT%H:%M:%SZ)"
} > "$success_marker"

rm -f "$error_marker"

echo "Git hooks bootstrapped successfully."
echo "Repo root : $repo_root"
echo "Hooks path: $hooks_path"
echo "Future git pull, checkout, and rebase operations in this repo will auto-sync the VS Code profile bundle."
