# VS Code Profile Bundle

This folder is the GitHub-syncable source of truth for your VS Code Copilot profile customizations.

It contains:
- `instructions/` for natural-language routing
- `agents/` for coordinators and leaf subagents
- `prompts/` for thin slash-command wrappers

Install or refresh this bundle on any device after `git pull`:

- Windows PowerShell:
  `powershell -File .\scripts\install-vscode-profile.ps1`
- macOS / Linux:
  `bash ./scripts/install-vscode-profile.sh`

The installer:
- copies the bundle into the VS Code user profile
- updates changed files
- removes stale files that were previously installed by this repo only
- leaves unrelated user prompts, agents, and instructions untouched

If you want this to happen automatically after future `git pull` operations in
the `master-rules` repo, run the one-time Git hook bootstrap from the repo root:

- Windows PowerShell:
  `powershell -File .\scripts\bootstrap-git-hooks.ps1`
- macOS / Linux:
  `bash ./scripts/bootstrap-git-hooks.sh`

GitHub alone cannot make a new device auto-run local scripts. The bootstrap is
the trusted local step that enables versioned hooks on that device.

Troubleshooting:
- manual refresh: run the installer directly
- hook failure marker: `.git/master-rules-profile-sync.last-error`
- re-enable hooks: rerun the bootstrap script

Manifest tracking:
- Windows: `%APPDATA%\\Code\\User\\master-rules-vscode-profile.manifest.txt`
- macOS: `~/Library/Application Support/Code/User/master-rules-vscode-profile.manifest.txt`
- Linux: `~/.config/Code/User/master-rules-vscode-profile.manifest.txt`

Only files listed in this manifest are candidates for cleanup on later syncs.

This bundle does not make triggers fire by itself. You still need:
- Copilot Chat in Agent mode
- a trigger phrase such as `orchestrated standard: ...`

Rollback:
- checkout a previous commit of `vscode-profile/`
- rerun the installer

Automatic hook sync markers:
- success: `.git/master-rules-profile-sync.last-success`
- failure: `.git/master-rules-profile-sync.last-error`

The success marker records the hook name, synced commit hash, and UTC timestamp.

Default targets:
- Windows: `%APPDATA%\\Code\\User`
- macOS: `~/Library/Application Support/Code/User`
- Linux: `~/.config/Code/User`

PowerShell note:
- if your policy already allows local scripts, use `powershell -File .\scripts\install-vscode-profile.ps1`
- if local scripts are blocked and you trust this repo, you can use `powershell -ExecutionPolicy Bypass -File .\scripts\install-vscode-profile.ps1`

For a copy-paste setup and second-device validation checklist, see `NEW_DEVICE_SOP.md` in the repo root.

Validation example after install:

`orchestrated standard: build a tiny test feature`
