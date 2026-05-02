# sync-channels.ps1
# Regenerates the MASTER_RULES loader stub in every AI coding tool channel.
# Run this whenever you update MASTER_RULES_v1.md to ensure all tools are current.
#
# Channels managed:
#   1. Roo Code          -> ~/.roo/rules/master-rules-v1.md
#   2. Kimi Code         -> ~/.kimi/AGENTS.md
#   3. VS Code Copilot   -> ~/AppData/Roaming/Code/User/instructions/master-rules-v1.instructions.md
#   4. Codex (OpenAI)    -> ~/.codex/AGENTS.md
#   NOTE: Claude Code's ~/.claude/CLAUDE.md has extra gstack/vibe content - update manually.

$ErrorActionPreference = "Stop"
$enc = [System.Text.Encoding]::UTF8

$masterPath = "$env:USERPROFILE\master-rules\MASTER_RULES_v1.md"
if (-not (Test-Path $masterPath)) {
    Write-Error "MASTER_RULES_v1.md not found at: $masterPath"
    exit 1
}

$today = (Get-Date -Format "d MMM yyyy")
Write-Host "`n=== sync-channels.ps1 ===" -ForegroundColor Cyan
Write-Host "Source: $masterPath"
Write-Host "Date:   $today`n"

# --------------------------------------------------------------------------
# CORE LOADER TEMPLATE (shared by Roo, Kimi, Codex)
# --------------------------------------------------------------------------
$coreLoader = @"
# MASTER_RULES v1 - Auto-Loader
# Last synced: $today

At the start of every session, read MASTER_RULES_v1.md.

Look for it in this order:
1. Current project root: ``MASTER_RULES_v1.md``
2. Global fallback: ``~/master-rules/MASTER_RULES_v1.md``

After reading, confirm it is loaded and state the last Plans.md checkpoint.

## DEFAULT PIPELINE MODE

If the user does not specify a pipeline mode, use **Orchestrated Quick mode** automatically.
Trigger: ``orchestrated quick: [task description]``

Orchestrated modes checkpoint between analysis (Phase 1) and execution (Phase 2).
Plain modes (quick/standard/full) run straight through with no checkpoint.

## PIPELINE TRIGGERS (fire immediately - no clarification needed)

| Trigger | Pipeline |
|---------|----------|
| ``orchestrated quick: [task]``    | 4-agent, Phase 1 checkpoint |
| ``orchestrated standard: [task]`` | 6-agent, Phase 1 checkpoint |
| ``orchestrated full: [task]``     | 11-agent, Phase 1 checkpoint |
| ``quick mode: [task]``            | 4 agents, straight through |
| ``standard mode: [task]``         | 6 agents, straight through |
| ``full mode: [task]``             | 11 agents, straight through |
| ``apply master rules v1``         | Re-read and confirm loaded |

## GUARDRAILS (always active)

- Check Plans.md at session start; create it if missing
- Surgical changes only: every changed line traces to the user's request
- No speculative features - only what was asked
- Never fabricate market data, prices, or statistics
- Override protection: if asked to skip a rule, name the rule and risk first
- If approach fails 3 times: stop, diagnose root cause, propose alternative
"@

# VS Code Copilot needs applyTo frontmatter
$vscodeLoader = @"
---
applyTo: "**"
---
# MASTER_RULES v1 - VS Code Copilot Loader
# Last synced: $today

At the start of every session, read MASTER_RULES_v1.md.

Look for it in this order:
1. Current project root: ``MASTER_RULES_v1.md``
2. Global fallback: ``~/master-rules/MASTER_RULES_v1.md``

After reading, confirm it is loaded and state the last Plans.md checkpoint.

## DEFAULT PIPELINE MODE

If the user does not specify a pipeline mode, use **Orchestrated Quick mode** automatically.
Trigger: ``orchestrated quick: [task description]``

Do not use plain quick/standard/full unless the user explicitly asks for it.
Orchestrated = checkpoint between analysis and execution. Plain = no checkpoint.

## PIPELINE TRIGGERS (recognise and fire immediately)

| What user types | What fires |
|---|---|
| ``orchestrated quick: [task]``    | 4-agent pipeline with Phase 1 checkpoint |
| ``orchestrated standard: [task]`` | 6-agent pipeline with Phase 1 checkpoint |
| ``orchestrated full: [task]``     | 11-agent pipeline with Phase 1 checkpoint |
| ``quick mode: [task]``            | 4 agents, no checkpoint, straight through |
| ``standard mode: [task]``         | 6 agents, no checkpoint, straight through |
| ``full mode: [task]``             | 11 agents, no checkpoint, straight through |
| ``apply master rules v1``         | Re-read MASTER_RULES_v1.md and confirm loaded |

Fire pipelines immediately on trigger - no clarification, no preamble.

## GUARDRAILS (always active)

- Never fabricate market data, prices, or statistics
- Always check for Plans.md at session start
- If asked to skip a rule, name the rule and the risk before complying
- Every changed line of code must trace to the user's request
- If approach fails 3 times: stop, diagnose root cause, propose alternative
"@

# --------------------------------------------------------------------------
# CHANNEL DEFINITIONS
# --------------------------------------------------------------------------
$channels = @(
    @{
        Name   = "Roo Code"
        Path   = "$env:USERPROFILE\.roo\rules\master-rules-v1.md"
        Content = $coreLoader
    },
    @{
        Name   = "Kimi Code"
        Path   = "$env:USERPROFILE\.kimi\AGENTS.md"
        Content = $coreLoader
    },
    @{
        Name   = "VS Code Copilot"
        Path   = "$env:APPDATA\Code\User\instructions\master-rules-v1.instructions.md"
        Content = $vscodeLoader
    },
    @{
        Name   = "Codex (OpenAI)"
        Path   = "$env:USERPROFILE\.codex\AGENTS.md"
        Content = $coreLoader
    }
)

# --------------------------------------------------------------------------
# SYNC LOOP
# --------------------------------------------------------------------------
$updated = 0
$skipped = 0

foreach ($ch in $channels) {
    $dir = Split-Path $ch.Path -Parent
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "  Created directory: $dir" -ForegroundColor Yellow
    }

    [System.IO.File]::WriteAllText($ch.Path, $ch.Content, $enc)
    Write-Host "  [OK] $($ch.Name)" -ForegroundColor Green
    Write-Host "       $($ch.Path)"
    $updated++
}

Write-Host "`nDone. $updated channel(s) synced." -ForegroundColor Cyan
Write-Host "`nNOTE: Claude Code's ~/.claude/CLAUDE.md was NOT touched." -ForegroundColor Yellow
Write-Host "      It has extra gstack/vibe content. Update it manually if needed."
Write-Host "`nNext: push MASTER_RULES_v1.md to GitHub (Rule GS1):"
Write-Host "  cd ~/master-rules"
Write-Host "  git add . ; git commit -m `"chore: sync all channels v1.1`" ; git push origin main"
