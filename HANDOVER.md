# HANDOVER.md
# Complete Agent Briefing — Read This Before Doing Anything Else
# For: The agent receiving this task (Claude Code, Gemini CLI, or any capable agent)
# From: Previous session — design and planning complete
# Task: Verify, execute, and install the complete master-rules system
#
# ═══════════════════════════════════════════════════════════════════
# YOUR MISSION IN ONE SENTENCE:
# Set up the master-rules repository on this laptop so that every
# AI tool the owner uses automatically follows MASTER_RULES.md —
# and install ECC, CC-Switch, and Claude Code Harness to make
# the advanced skill calls functional.
# ═══════════════════════════════════════════════════════════════════

---

## PART A: WHAT YOU NEED TO UNDERSTAND FIRST

### What MASTER_RULES.md Is

MASTER_RULES.md is the owner's universal development standard.
It is a single markdown file that contains all the rules, guardrails,
and best practices that must govern every AI-assisted development
session — regardless of which tool, which project, or which laptop.

It is not a script. It is not code. It is a written instruction set
that AI agents read and then follow for the entire session.

Think of it as a standing brief that every agent reads at the start
of every engagement, the same way a new contractor reads a company
handbook before starting work. Once read, the agent operates under
those rules without needing to be reminded.

### What MASTER_RULES.md Contains

It has 12 sections:

| Section | Contents |
|---------|----------|
| Confirmation Phrase | The block the agent must output to confirm rules loaded |
| Section 1: Master Skill Stack | ECC, Awesome Claude Code, Harness, CC-Switch — what each is and its principles |
| Section 2: Task Lifecycle | The 6-step sequence: Plan → Build → Review → Verify → Release → Close |
| Section 3: Planning Rules | Mandatory plan block before any code; Plans.md as session memory |
| Section 4: Build Rules | TDD discipline, incremental steps, no silent deviations |
| Section 5: Code Review Rules | Self-review, flag before fix, security review before release |
| Section 6: Security Rules | Secret detection, .env protection, dependency vetting, commit safety |
| Section 7: Context/Token Rules | Compact thresholds, MCP limits, model tier matching |
| Section 8: Client-Facing Rules | Pre-client checklist, no hallucinated data, professional tone |
| Section 9: On-Demand Skills | Complete table of skill calls and what each requires |
| Section 10: Session Rules | Start and end protocols, override rule |
| Section 11: Owner Context | Non-technical director, energy/commodities domain |
| Section 12: Installation Status | Check and update at each session start |

### When MASTER_RULES.md Is Used

**Auto-fire situations** (no action required from owner):
- Claude Code terminal: fires automatically every session via CLAUDE.md
- Gemini CLI: fires automatically every session via GEMINI.md
- Antigravity Desktop: fires via system prompt (set up once)

**On-demand situations** (owner types one line at session start):
- VS Code Chat sidebar: owner types "Read MASTER_RULES.md and confirm rules loaded"
- Kimi extension in VS Code: same one-line ritual
- Claude Desktop: same one-line ritual

**Mid-session re-activation** (if rules drift or tool bypasses):
- Owner or agent types: "Apply MASTER_RULES"
- Agent re-reads the file and re-confirms rules loaded

### How an Agent Uses MASTER_RULES.md

Step 1: Read the entire file at session start
Step 2: Output the CONFIRMATION PHRASE block from the top of the file
Step 3: Check for Plans.md — state the last checkpoint
Step 4: Apply all rules throughout the session without being reminded
Step 5: At session end: update Plans.md and output "Session closed"

The agent does not need to be told to apply individual rules during
the session. The agent applies them proactively. If the owner asks
to skip a rule, the agent states the rule, the risk, and asks for
explicit confirmation before proceeding.

---

## PART B: WHAT HAS ALREADY BEEN DONE

The following files have already been designed and are ready
in the master-rules GitHub repository:

| File | Status | Purpose |
|------|--------|---------|
| MASTER_RULES.md | ✅ Complete | Universal rules — single source of truth |
| CLAUDE.md | ✅ Complete | Auto-fire pointer for Claude Code terminal |
| GEMINI.md | ✅ Complete | Auto-fire pointer for Gemini CLI |
| ANTIGRAVITY.md | ✅ Complete | Rules formatted for Antigravity Desktop |
| .vscode/settings.json | ✅ Complete | VS Code Chat instruction injection |
| SETUP_GUIDE.md | ✅ Complete | Plain language laptop setup guide |
| README.md | ✅ Complete | Repository home page |
| HANDOVER.md | ✅ This file | Agent briefing for installation |

---

## PART C: WHAT YOU MUST DO NOW

Work through these tasks in order. Do not skip steps.
After each step, verify it worked before moving to the next.
Report status after each step.

---

### TASK 1: Verify the GitHub Repository Exists

Check whether the repository github.com/[owner-username]/master-rules
already exists and contains all 8 files listed in Part B.

**Action**:
Ask the owner: "What is your GitHub username?"
Then check: does the repository exist with all files present?

**If repository exists with all files**: proceed to Task 2.

**If repository does not exist yet**:
Tell the owner:
"Please do the following:
1. Go to github.com and sign in
2. Click the + icon in the top right → New repository
3. Name it exactly: master-rules
4. Set it to Private
5. Do not initialize with any files — leave it empty
6. Click Create repository
7. Tell me when done"

Once created, upload all 8 files from the master-rules-repo folder
to the repository root.

**Verify**: confirm all 8 files are visible in the repository
before proceeding.

---

### TASK 2: Clone the Repository to This Laptop

**What this does**: Downloads the rules to this laptop so all tools
can read them. This is a one-time action per laptop.

**Command to run in terminal**:
```
git clone https://github.com/[owner-username]/master-rules ~/master-rules
```

**Verify**: run `ls ~/master-rules` and confirm these files appear:
- MASTER_RULES.md
- CLAUDE.md
- GEMINI.md
- ANTIGRAVITY.md
- SETUP_GUIDE.md
- README.md
- HANDOVER.md
And folder: .vscode/ containing settings.json

**If verify fails**: report what is missing and do not proceed to Task 3.

---

### TASK 3: Activate Claude Code Auto-Fire

**What this does**: Makes CLAUDE.md fire automatically every time
Claude Code opens — for every project on this laptop forever.

**Command**:
```
cp ~/master-rules/CLAUDE.md ~/.claude/CLAUDE.md
```

**Verify**: open a new Claude Code session in any directory.
Confirm the session opens with the MASTER_RULES LOADED block.

**If the ~/.claude/ directory does not exist**:
```
mkdir ~/.claude
cp ~/master-rules/CLAUDE.md ~/.claude/CLAUDE.md
```

**Report**: "Claude Code auto-fire: ACTIVE" or describe the error.

---

### TASK 4: Activate Gemini CLI Auto-Fire

**What this does**: Makes GEMINI.md fire automatically every time
Gemini CLI opens — for every project on this laptop forever.

**Commands**:
```
mkdir -p ~/.gemini
cp ~/master-rules/GEMINI.md ~/.gemini/GEMINI.md
```

**Verify**: open Gemini CLI in any directory.
Confirm the session opens with the MASTER_RULES LOADED block.

**Report**: "Gemini CLI auto-fire: ACTIVE" or describe the error.

---

### TASK 5: Copy MASTER_RULES.md to Current Project Root

**What this does**: Places MASTER_RULES.md in the current project
so VS Code Chat and Kimi can find it when the owner types the
opening ritual.

**Command** (replace [project-path] with the actual project directory):
```
cp ~/master-rules/MASTER_RULES.md [project-path]/MASTER_RULES.md
```

**For each active project the owner uses** — repeat this step.
Ask the owner: "Please list the folder paths of your active projects
so I can copy MASTER_RULES.md to each one."

**Verify**: confirm MASTER_RULES.md is visible in the VS Code file
explorer at the top level of each project folder.

**Report**: list of projects where MASTER_RULES.md was placed.

---

### TASK 6: Set Up VS Code Chat Injection

**What this does**: Injects a standing instruction into VS Code's
AI chat so it references MASTER_RULES.md automatically.

**For each project folder**:
```
mkdir -p [project-path]/.vscode
cp ~/master-rules/.vscode/settings.json [project-path]/.vscode/settings.json
```

**Verify**: open VS Code in the project. Open VS Code Chat.
Start a conversation and check whether it references the rules
or requires the opening ritual.

**Note for Kimi extension**: Kimi does not read settings.json.
The opening ritual is the only reliable method for Kimi:
"Read MASTER_RULES.md and confirm rules loaded before we begin."
Tell the owner this is expected behaviour — not a setup failure.

**Report**: list of projects where settings.json was placed.

---

### TASK 7: Install Everything Claude Code (ECC)

**What this does**: Installs the full ECC agent harness inside
Claude Code, making the skill calls in MASTER_RULES.md functional:
/planner, /security-reviewer, /rulecheck, /skill-create.

**Prerequisite**: Claude Code must be installed and running.
If not installed, ask the owner to install it first from:
https://claude.ai/code

**Commands** (run inside a Claude Code terminal session):
```
/plugin marketplace add affaan-m/everything-claude-code
/plugin install everything-claude-code@everything-claude-code
```

**Verify**: after installation, run:
```
/planner
```
If the planner agent responds with a structured prompt — ECC is active.

**Run initial security scan**:
```
npx ecc-agentshield scan
```
Report all findings to the owner before proceeding.

**Fix any findings**: if AgentShield flags misconfigurations,
fix them now before continuing.

**Report**: "ECC installed. AgentShield scan complete. Findings: [list]"

---

### TASK 8: Install Claude Code Harness

**What this does**: Adds the TypeScript guardrail engine that
enforces hard rules — blocks destructive actions at the execution
level, not just as suggestions.

**Commands** (run inside Claude Code terminal):
```
/plugin marketplace add Chachamaru127/claude-code-harness
/plugin install claude-code-harness@claude-code-harness-marketplace
/harness-setup
```

**Verify**: run `/harness-work` in any project.
Confirm the harness initializes and presents the planning phase.

**Report**: "Claude Code Harness: ACTIVE" or describe the error.

---

### TASK 9: Install CC-Switch

**What this does**: Installs the desktop app for one-click switching
between Claude Code, Gemini CLI, and other CLI tools. Prevents
losing 20 minutes to manual config editing when quota runs out.

**Command** (macOS):
```
brew install --cask cc-switch
```

**For Windows**: download the installer from:
https://github.com/farion1231/cc-switch/releases/latest

**After installation**:
1. Open CC-Switch from your Applications folder or taskbar
2. Click "Add Provider" and add your Claude API key
3. Click "Add Provider" again and add your Gemini API key
4. Set Claude as primary, Gemini as fallback
5. Enable the system tray icon for quick switching

**Verify**: confirm CC-Switch shows in the menu bar (macOS) or
system tray (Windows) with both providers listed.

**Report**: "CC-Switch: ACTIVE — providers configured: [list]"

---

### TASK 10: Set Up Antigravity Desktop

**What this does**: Places your rules into Antigravity Desktop's
system prompt so it follows MASTER_RULES.md without the opening ritual.

**Instructions to give the owner**:
"Please do the following in Antigravity Desktop:
1. Open Antigravity Desktop
2. Go to Settings or Agent Configuration
3. Find the field labelled System Prompt or Instructions
4. Open the file ~/master-rules/ANTIGRAVITY.md on your laptop
5. Copy the entire contents of that file
6. Paste it into the System Prompt field
7. Save the settings
8. Start a new Antigravity session and confirm it outputs the
   MASTER_RULES LOADED block at the start"

**Verify**: confirm owner sees the MASTER_RULES LOADED block
in a new Antigravity session.

**Report**: "Antigravity Desktop: ACTIVE" or "Pending owner action"

---

### TASK 11: Create Plans.md in Each Active Project

**What this does**: Creates the session memory file that agents
update at every session end. Without this file, the planning
rules have nowhere to write to.

**For each active project folder**:
```
touch [project-path]/Plans.md
```

Then open each Plans.md and add this starter content:
```
# Plans.md — Session Memory
# Project: [project name]
# Created: [today's date]

## Current Status
Session 1 — Setup complete. Master rules installed.

## Next Step
Begin first development task. Agent will update this file at each session end.

## Decisions Log
[Decisions will be recorded here as work progresses]
```

**Report**: list of projects where Plans.md was created.

---

### TASK 12: Full System Verification

Run this check across all tools and report status for each:

```
INSTALLATION VERIFICATION REPORT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
GitHub repository (master-rules)    : [ ] EXISTS / [ ] MISSING
Files cloned to ~/master-rules      : [ ] COMPLETE / [ ] INCOMPLETE
Claude Code auto-fire (CLAUDE.md)   : [ ] ACTIVE / [ ] NOT ACTIVE
Gemini CLI auto-fire (GEMINI.md)    : [ ] ACTIVE / [ ] NOT ACTIVE
MASTER_RULES.md in project roots    : [ ] PLACED / [ ] NOT PLACED
VS Code settings.json in projects   : [ ] PLACED / [ ] NOT PLACED
ECC installed                       : [ ] ACTIVE / [ ] NOT INSTALLED
ECC AgentShield scan                : [ ] CLEAN / [ ] FINDINGS: [list]
Claude Code Harness installed       : [ ] ACTIVE / [ ] NOT INSTALLED
CC-Switch installed                 : [ ] ACTIVE / [ ] NOT INSTALLED
CC-Switch providers configured      : [ ] DONE / [ ] PENDING
Antigravity system prompt           : [ ] ACTIVE / [ ] PENDING OWNER
Plans.md in all active projects     : [ ] CREATED / [ ] MISSING: [list]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Overall status: [ ] COMPLETE / [ ] PARTIAL — items remaining: [list]
```

Do not mark overall status COMPLETE until every line is checked.

---

## PART D: WHAT TO DO IF SOMETHING FAILS

| Problem | What To Do |
|---------|-----------|
| Git clone fails | Check internet connection. Ask owner to confirm GitHub username. |
| ~/.claude/ directory missing | Create it: `mkdir -p ~/.claude` then retry |
| ECC install command fails | Confirm Claude Code is up to date. Try `/plugin marketplace` alone first. |
| CC-Switch brew fails | Check Homebrew is installed: `brew --version`. If not: install Homebrew first. |
| AgentShield scan finds issues | List all findings to owner. Fix one at a time. Do not proceed to next task until resolved. |
| Harness setup fails | Check ECC is installed first — Harness depends on Claude Code plugin system |
| Kimi does not respond to settings.json | Expected. Inform owner: Kimi requires the manual opening ritual. Not a failure. |
| Plans.md already exists | Do not overwrite. Read existing content and report current checkpoint to owner. |

---

## PART E: HOW TO MAINTAIN THIS SYSTEM GOING FORWARD

### Updating Rules on One Laptop and Syncing to Others

When the owner wants to change any rule:
1. Edit ~/master-rules/MASTER_RULES.md directly
2. Run:
   ```
   cd ~/master-rules
   git add MASTER_RULES.md
   git commit -m "Updated: [describe what changed]"
   git push
   ```
3. On other laptops, run: `cd ~/master-rules && git pull`
4. The updated rules are now active on all laptops immediately

### Verifying Rules Loaded Each Session

At the start of every session, look for the CONFIRMATION PHRASE:
```
MASTER_RULES LOADED
Project: ...
Checkpoint: ...
Guardrails: Planning | Security | Context | Client-Safety
ECC Skills: ...
Status: READY
```

If this does not appear: type "Apply MASTER_RULES" and the agent
will re-read and re-confirm before proceeding.

### Adding a New Tool in Future

If a new CLI tool or IDE extension is added to the workflow:
1. Check if the tool has an auto-read convention (like CLAUDE.md or GEMINI.md)
2. If yes: create a pointer file following the same pattern
3. If no: the opening ritual applies — "Read MASTER_RULES.md and confirm loaded"
4. Add the new tool to the tool table in SETUP_GUIDE.md
5. Commit and push to GitHub

---

## PART F: QUICK REFERENCE FOR THE OWNER

### The One Sentence to Memorize (For Non-Auto Tools)
```
Read MASTER_RULES.md and confirm rules loaded before we begin.
```

### On-Demand Skill Calls (Type These Anytime)
```
/planner          → forced plan before any work (needs ECC)
/security-reviewer → security audit (needs ECC)
/rulecheck        → MASTER_RULES compliance scan (needs ECC)
/compact          → compress context (always available)
"client check"    → pre-client review checklist (always available)
"apply master rules" → re-activate rules mid-session (always available)
"check plans"     → read Plans.md checkpoint (always available)
"switch model"    → reminder to use CC-Switch (always available)
```

### Tool Activation Summary
```
TOOL              HOW RULES LOAD         YOUR ACTION
Claude Code       Automatic via CLAUDE.md None — just watch for confirmation
Gemini CLI        Automatic via GEMINI.md None — just watch for confirmation
Antigravity       Automatic via sys prompt None after initial setup
VS Code Chat      On-demand              Type the opening ritual
Kimi extension    On-demand              Type the opening ritual
Claude Desktop    On-demand              Type the opening ritual
```

---
*End of HANDOVER.md*
*This document is the complete briefing for any agent executing the setup*
*Do not modify the installation sequence — tasks must be done in order*
*Report status after every task before proceeding to the next*
