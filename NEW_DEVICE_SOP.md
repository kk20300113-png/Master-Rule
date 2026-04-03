## New Device SOP

Use this on any new device that will pull the `master-rules` repo and use VS Code Copilot with the shared profile bundle.

### First-Time Setup On A New Device

Windows PowerShell:

```powershell
cd $env:USERPROFILE\master-rules
git pull
powershell -File .\scripts\bootstrap-git-hooks.ps1
```

If local PowerShell scripts are blocked and you trust this repo:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap-git-hooks.ps1
```

macOS / Linux:

```bash
cd ~/master-rules
git pull
bash ./scripts/bootstrap-git-hooks.sh
```

### What Bootstrap Does

- installs the VS Code profile bundle once immediately
- enables repo-managed Git hooks for this repo on this device
- makes future `git pull`, checkout, and rebase operations auto-refresh the VS Code profile bundle

### Ongoing Update Flow On A Bootstrapped Device

Windows PowerShell:

```powershell
cd $env:USERPROFILE\master-rules
git pull
```

macOS / Linux:

```bash
cd ~/master-rules
git pull
```

After that, the hook should auto-sync the VS Code profile bundle.

### Proof That Auto-Sync Ran

Check this file inside the repo clone:

```text
.git/master-rules-profile-sync.last-success
```

It records:
- hook name
- synced commit hash
- UTC timestamp

If sync failed, check:

```text
.git/master-rules-profile-sync.last-error
```

### VS Code Validation Prompt

Open a fresh Copilot Chat in Agent mode and paste this exact message:

```text
orchestrated standard: I am validating that this device loaded the shared VS Code profile bundle correctly. Run Phase 1 only for a tiny feature named status banner that shows System Ready and emits one structured startup log event. Do not write code yet. Stop at the checkpoint and require the exact token before Phase 2.
```

### Expected Result

- Agent Mode Check banner appears
- Phase 1 runs through the standard coordinator flow
- A checkpoint token is printed
- No files are written before the exact token is returned

### Troubleshooting

If the profile did not sync automatically after `git pull`:

Windows PowerShell:

```powershell
cd $env:USERPROFILE\master-rules
powershell -File .\scripts\install-vscode-profile.ps1
```

macOS / Linux:

```bash
cd ~/master-rules
bash ./scripts/install-vscode-profile.sh
```

If hooks are disabled or broken, rerun the bootstrap command for your platform.