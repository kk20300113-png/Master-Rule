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

## Step 4: Activate VS Code Chat — Per Project Setup

For each project you open in VS Code, do this once:

1. In your project folder, create a folder called ".vscode" if it
   doesn't already exist (you can do this in VS Code's file explorer
   by right-clicking and selecting "New Folder")

2. Copy the settings.json file from the master-rules repo into
   your project's .vscode folder:
   ```
   cp ~/master-rules/.vscode/settings.json [your-project-path]/.vscode/settings.json
   ```

3. Replace [your-project-path] with the actual path to your project

Also copy MASTER_RULES.md to your project root:
```
cp ~/master-rules/MASTER_RULES.md [your-project-path]/MASTER_RULES.md
```

After this, VS Code's AI chat will have a standing instruction to
reference your rules. Still use the opening ritual to fully activate.

---

## Step 5: Activate Antigravity Desktop — One-Time Setup

1. Open Antigravity Desktop
2. Go to Settings or Agent Configuration
3. Find the "System Prompt" or "Instructions" field
4. Open the file ~/master-rules/ANTIGRAVITY.md on your laptop
5. Copy its contents and paste into the system prompt field
6. Save

Antigravity will now apply your core rules as its baseline
for every session.

---

## Step 6: Claude Desktop — Opening Ritual Only

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

## Step 7: Kimi Extension in VS Code — Opening Ritual Only

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
| VS Code Chat | Semi-automatic | Type opening ritual once per session |
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
2. Edit the rules
3. Open terminal and type:
   ```
   cd ~/master-rules
   git add MASTER_RULES.md
   git commit -m "Updated rules"
   git push
   ```
4. On your other laptops, type:
   ```
   cd ~/master-rules && git pull
   ```

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
│   └── settings.json   ← Copy to each project's .vscode folder
└── SETUP_GUIDE.md      ← This file
```

---
*End of Setup Guide*
*Estimated setup time: 10 minutes per laptop*
*Support: update rules in MASTER_RULES.md and push to GitHub*
