#!/usr/bin/env bash
set -euo pipefail

show_next_steps() {
  local repo_root="$1"
  local sop_path="$repo_root/NEW_DEVICE_SOP.md"

  echo
  echo "Next step - VS Code validation"
  echo "Open a fresh Copilot Chat in Agent mode and paste:"
  echo
  echo "orchestrated standard: I am validating that this device loaded the shared VS Code profile bundle correctly. Run Phase 1 only for a tiny feature named status banner that shows System Ready and emits one structured startup log event. Do not write code yet. Stop at the checkpoint and require the exact token before Phase 2."
  echo
  echo "Expected result:"
  echo "- Agent Mode Check banner"
  echo "- Phase 1 checkpoint token"
  echo "- No file writes before exact token approval"
  echo
  echo "New device SOP: $sop_path"
}

if (( BASH_VERSINFO[0] < 4 )); then
  echo "This script requires Bash 4 or later." >&2
  exit 1
fi

dry_run=false
target_root_override=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      dry_run=true
      shift
      ;;
    --target-root)
      [[ $# -lt 2 ]] && { echo "--target-root requires a value" >&2; exit 1; }
      target_root_override="$2"
      shift 2
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
source_root="$repo_root/vscode-profile"

if [[ ! -d "$source_root" ]]; then
  echo "VS Code profile source not found at $source_root" >&2
  exit 1
fi

if [[ "${OSTYPE:-}" == darwin* ]]; then
  default_target="$HOME/Library/Application Support/Code/User"
else
  default_target="$HOME/.config/Code/User"
fi

target_root="${target_root_override:-${TARGET_ROOT:-$default_target}}"

normalized_target_root="${target_root//\\//}"
case "$normalized_target_root" in
  ../*|*/../*|*/..|..)
    echo "TARGET_ROOT may not contain path traversal segments: $target_root" >&2
    exit 1
    ;;
esac

case "$target_root" in
  "$HOME"|"$HOME"/*) ;;
  *)
    echo "TARGET_ROOT must stay inside your home directory. Received: $target_root" >&2
    exit 1
    ;;
esac

manifest_path="$target_root/master-rules-vscode-profile.manifest.txt"

mkdir -p "$target_root"

mapfile -t source_files < <(cd "$source_root" && find agents instructions prompts -type f -name '*.md' | LC_ALL=C sort)

declare -A current_files=()
for relative_path in "${source_files[@]}"; do
  current_files["$relative_path"]=1
done

if [[ -f "$manifest_path" ]]; then
  while IFS= read -r relative_path; do
    [[ -z "$relative_path" ]] && continue
    if [[ "$relative_path" == /* || "$relative_path" == *".."* ]]; then
      echo "Skipping unmanaged manifest entry: $relative_path" >&2
      continue
    fi
    case "$relative_path" in
      agents/*|instructions/*|prompts/*) ;;
      *)
        echo "Skipping unmanaged manifest entry: $relative_path" >&2
        continue
        ;;
    esac
    if [[ -z "${current_files[$relative_path]+x}" ]]; then
      stale_target="$target_root/$relative_path"
      if [[ -f "$stale_target" ]]; then
        if [[ "$dry_run" == true ]]; then
          echo "[DryRun] Would remove stale file: $relative_path"
        else
          rm -f "$stale_target"
          rmdir "$(dirname "$stale_target")" 2>/dev/null || true
        fi
      fi
    fi
  done < "$manifest_path"
fi

copied_count=0
for relative_path in "${source_files[@]}"; do
  if [[ "${relative_path##*.}" != "md" ]]; then
    echo "Skipping non-markdown file: $relative_path" >&2
    continue
  fi
  if [[ "$dry_run" == true ]]; then
    echo "[DryRun] Would copy: $relative_path"
    continue
  fi
  mkdir -p "$(dirname "$target_root/$relative_path")"
  cp "$source_root/$relative_path" "$target_root/$relative_path"
  copied_count=$((copied_count + 1))
done

if [[ "$dry_run" == false ]]; then
  printf '%s\n' "${source_files[@]}" > "$manifest_path"
fi

echo "VS Code profile synced successfully."
echo "Repo root   : $repo_root"
echo "Target root : $target_root"
echo "Files synced: $copied_count"
if [[ "$dry_run" == true ]]; then
  echo "Dry run only: no files were changed."
else
  show_next_steps "$repo_root"
fi
