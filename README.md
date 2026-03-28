# master-rules

Universal development standard for all AI-assisted projects.
One set of rules. All tools. All laptops.

## What This Is

A single repository that makes every AI tool you use follow the same
development standards automatically — across every project and every
laptop. Contains the complete master rules plus installation files
for Claude Code, Gemini CLI, VS Code, Antigravity Desktop, and more.

## Files in This Repository

| File | Purpose | Activation |
|------|---------|-----------|
| **MASTER_RULES.md** | All rules — single source of truth | Read by all tools |
| **HANDOVER.md** | Agent briefing — install and verify everything | Give to agent first |
| **CLAUDE.md** | Auto-fire pointer for Claude Code terminal | Automatic every session |
| **GEMINI.md** | Auto-fire pointer for Gemini CLI | Automatic every session |
| **ANTIGRAVITY.md** | Rules for Antigravity Desktop system prompt | Paste once into settings |
| **.vscode/settings.json** | VS Code Chat instruction injection | Copy to each project |
| **SETUP_GUIDE.md** | Plain language setup for each new laptop | Read on each new laptop |
| **README.md** | This file | GitHub home page |

## Start Here

**If setting up a new laptop**: give HANDOVER.md to your agent.
The agent will verify, execute, and install everything in order.

**If rules are already set up**: type this at the start of any
VS Code Chat, Kimi, or Claude Desktop session:
```
Read MASTER_RULES.md and confirm rules loaded before we begin.
```

## Auto-Fire Tools (No Action Needed)

- Claude Code terminal → CLAUDE.md fires automatically
- Gemini CLI → GEMINI.md fires automatically
- Antigravity Desktop → system prompt fires automatically (after one-time setup)

## On-Demand Tools (One Line at Session Start)

- VS Code Chat → type the opening ritual
- Kimi extension → type the opening ritual
- Claude Desktop → type the opening ritual

## On-Demand Skill Calls (Anytime in Any Session)

```
/planner          → forced structured plan (requires ECC)
/security-reviewer → full security audit (requires ECC)
/rulecheck        → MASTER_RULES compliance scan (requires ECC)
/compact          → compress context (always available)
"client check"    → pre-client review checklist (always available)
"apply master rules" → re-activate rules mid-session (always available)
```

## Installed Repositories This System References

| Repository | Purpose | Stars |
|-----------|---------|-------|
| affaan-m/everything-claude-code | Agent harness, 28 agents, 125+ skills | ~100K |
| hesreallyhim/awesome-claude-code | Vetted skill and tool index | Active |
| Chachamaru127/claude-code-harness | TypeScript guardrail engine | Active |
| farion1231/cc-switch | CLI manager, model switching | 27K+ |

## Updating Rules

Edit MASTER_RULES.md → commit → push → pull on other laptops.
All tools pick up new rules immediately on next session.
