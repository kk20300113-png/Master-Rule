# SETUP_GUIDE.md
# Plain Language Setup Guide
# Do this once on each laptop. Takes about 10 minutes.
# No technical background needed.

---

## What This Repository Does

This repository is your universal development standard.
It contains one set of rules (MASTER_RULES.md) that all your
AI tools will follow — across every project, on every laptop.

You do this setup once per laptop. After that, everything is automatic
for Claude Code and Gemini CLI. VS Code Chat, Kimi, and Claude Desktop
need one line typed at the start of each session.

---

## Step 1: Get This Repository Onto Your Laptop

Open VS Code. Open the terminal panel at the bottom (View → Terminal).
Type this and press Enter:

```
git clone https://github.com/[your-username]/master-rules ~/master-rules
```

Replace [your-username] with your actual GitHub username.

This downloads all the files to a folder called "master-rules"
on your laptop. You only do this once per laptop.

To update your rules on any laptop in the future, open the terminal and type:
```
cd ~/master-rules && git pull
```

---

## Step 2: Activate Claude Code (Terminal) — One-Time Setup

This makes CLAUDE.md fire automatically every time you open Claude Code,
for every project on this laptop.

In the terminal, type:
```
cp ~/master-rules/CLAUDE.md ~/.claude/CLAUDE.md
```

That's it. Claude Code will now load your rules automatically
every single session, forever, without you doing anything.

To verify it worked: open Claude Code in any project.
Your first response should begin with "MASTER_RULES LOADED".

---

## Step 3: Activate Gemini CLI — One-Time Setup

In the terminal, type:
```
cp ~/master-rules/GEMINI.md ~/.gemini/GEMINI.md
```

If you get an error saying the folder doesn't exist, type this first:
```
mkdir ~/.gemini
```
Then repeat the copy command above.

Gemini CLI will now load your rules automatically every session.

---

## Step 4: Activate VS Code Copilot Profile — One-Time Per Laptop

This is the recommended setup if you want your router, prompts,
and custom agents to follow you across devices.

After cloning this repo on a laptop, run one command:

**Windows PowerShell**
```
powershell -File ~/master-rules/scripts/install-vscode-profile.ps1
```

If your laptop blocks local scripts and you trust this repo, you can run:
```
powershell -ExecutionPolicy Bypass -File ~/master-rules/scripts/install-vscode-profile.ps1
```

**macOS / Linux**
```
bash ~/master-rules/scripts/install-vscode-profile.sh
```

This installs the VS Code Copilot profile bundle from this repo into
your local VS Code user profile.

Important:
- the profile bundle makes the router, prompts, and custom agents available
- you still need to open Copilot Chat in Agent mode
- you still need to type the trigger phrase you want to run

After that, open a fresh Copilot chat in Agent mode and use the trigger directly:
```
orchestrated standard: build a tiny test feature
```

If you see the Agent Mode Check banner and a Phase 1 checkpoint,
the profile bundle is working.

Optional: if you want future `git pull` operations in this repo to refresh
the VS Code profile automatically on this laptop, run a one-time bootstrap.

**Windows PowerShell**
```
powershell -File ~/master-rules/scripts/bootstrap-git-hooks.ps1
```

**macOS / Linux**
```
bash ~/master-rules/scripts/bootstrap-git-hooks.sh
```

This does one trusted local setup step on that device. After that,
future pull, checkout, and rebase operations in this repo auto-sync
the VS Code profile bundle.

If a later hook-based sync fails, run the installer manually once,
then rerun the bootstrap command if needed.

If a later hook-based sync succeeds, the device records:
- `.git/master-rules-profile-sync.last-success`

That file shows the last hook name, commit hash, and UTC timestamp.

For a simple copy-paste checklist for a second device, see `NEW_DEVICE_SOP.md`.

## Step 5: VS Code Project-Level Pointer — Optional Fallback

If you also want a per-project reminder to read `MASTER_RULES.md`,
keep the existing `.vscode/settings.json` pointer in each project.

For each project you open in VS Code, do this once:

1. In your project folder, create a folder called `.vscode` if it
   doesn't already exist.

2. Copy the settings.json file from the master-rules repo into
   your project's `.vscode` folder:
   ```
   cp ~/master-rules/.vscode/settings.json [your-project-path]/.vscode/settings.json
   ```

3. Replace [your-project-path] with the actual path to your project.

Also copy `MASTER_RULES.md` to your project root:
```
cp ~/master-rules/MASTER_RULES.md [your-project-path]/MASTER_RULES.md
```

This pointer is useful, but it is separate from the profile bundle above.

---

## Step 6: Activate Antigravity Desktop — One-Time Setup

1. Open Antigravity Desktop
2. Go to Settings or Agent Configuration
3. Find the "System Prompt" or "Instructions" field
4. Open the file ~/master-rules/ANTIGRAVITY.md on your laptop
5. Copy its contents and paste into the system prompt field
6. Save

Antigravity will now apply your core rules as its baseline
for every session.

---

## Step 7: Claude Desktop — Opening Ritual Only

Claude Desktop does not have an auto-read system.
At the start of every Claude Desktop session, type:

```
Read MASTER_RULES.md and confirm rules loaded before we begin.
```

If you are working on a project, add:
```
The project is [project name]. 
Read MASTER_RULES.md and confirm rules loaded before we begin.
```

---

## Step 8: Kimi Extension in VS Code — Opening Ritual Only

Same as Claude Desktop. At the start of every Kimi session:
```
Read MASTER_RULES.md and confirm rules loaded before we begin.
```

If Kimi does not output the CONFIRMATION PHRASE, type:
```
You did not confirm rules loaded. Read MASTER_RULES.md 
now and output the confirmation phrase as your next response.
```

---

## Daily Reference Card

| Tool | How Rules Load | Your Action |
|------|---------------|-------------|
| Claude Code terminal | Automatic | None — just look for "MASTER_RULES LOADED" |
| Gemini CLI | Automatic | None — just look for "MASTER_RULES LOADED" |
| VS Code Chat with profile bundle | Automatic after one-time install | None except Agent mode |
| VS Code Chat without profile bundle | Semi-automatic | Type opening ritual once per session |
| Kimi in VS Code | Manual | Type opening ritual once per session |
| Claude Desktop | Manual | Type opening ritual once per session |
| Antigravity Desktop | Automatic (after setup) | None after initial setup |

---

## Opening Ritual (Memorize This One Line)

```
Read MASTER_RULES.md and confirm rules loaded before we begin.
```

---

## How to Update Your Rules

1. Open ~/master-rules/MASTER_RULES.md on any laptop
2. Edit the rules or the `vscode-profile/` bundle
3. Open terminal and type:
   ```
   cd ~/master-rules
   git add .
   git commit -m "Update rules and VS Code profile bundle"
   git push
   ```
4. On your other laptops, type:
   ```
   cd ~/master-rules && git pull
   ```
5. If you changed anything under `vscode-profile/`, run the installer again:
   - Windows PowerShell:
     ```
     powershell -ExecutionPolicy Bypass -File ~/master-rules/scripts/install-vscode-profile.ps1
     ```
   - macOS / Linux:
     ```
     bash ~/master-rules/scripts/install-vscode-profile.sh
     ```

If you already bootstrapped Git hooks on that laptop, you can skip this extra
installer step after normal `git pull` because the hook will run it for you.

Your rules are now updated everywhere.

---

## Verification Check (How to Know Everything Is Working)

Open Claude Code in any project and look for this at the start:

```
MASTER_RULES LOADED
Project: [project name]
Checkpoint: [last Plans.md entry]
Active guardrails: Planning | Security | Context | Client-Safety
Ready.
```

If you see this: everything is working.
If you do not see this: Claude Code did not find CLAUDE.md.
Repeat Step 2 of this guide.

---

## File Map (What Each File Does)

```
~/master-rules/
├── MASTER_RULES.md     ← Your rules. Edit this to change anything.
├── CLAUDE.md           ← Auto-fires in Claude Code terminal
├── GEMINI.md           ← Auto-fires in Gemini CLI
├── ANTIGRAVITY.md      ← Paste into Antigravity system prompt
├── .vscode/
│   └── settings.json   ← Optional per-project pointer
├── vscode-profile/
│   ├── instructions/   ← VS Code user-profile router
│   ├── agents/         ← VS Code user-profile custom agents
│   └── prompts/        ← VS Code user-profile prompt wrappers
├── scripts/
│   ├── install-vscode-profile.ps1
│   └── install-vscode-profile.sh
└── SETUP_GUIDE.md      ← This file
```

---
*End of Setup Guide*
*Estimated setup time: 10 minutes per laptop*
*Support: update rules in MASTER_RULES.md and push to GitHub*
