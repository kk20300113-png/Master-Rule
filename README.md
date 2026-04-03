# master-rules

Universal development standard for all AI-assisted projects.
One set of rules. All tools. All laptops.

---

## How to Fire Agents — Quick Reference

Copy any of these prompts exactly into VS Code Chat (Agent mode ✦), Claude Code, or any AI tool that has loaded MASTER_RULES.md.

> ⚠️ **Tier 3 language specialists are NEVER auto-fired.** They must be added manually using `— also run [agent-name]`. See Tier 3 section below.

### Fast Lane (Section 13) — Automated, No Checkpoints

Fires all agents to completion. No human gates. Use for drafts, exploration, speed-over-rigor.

| Goal | Prompt to type |
|---|---|
| Bug fix / small feature | `quick mode: [describe your task]` |
| Full feature with security | `standard mode: [describe your task]` |
| New project / pre-deployment | `full mode: [describe your task]` |

**Examples:**
```
quick mode: add email validation to the user registration form in the FastAPI backend
```
```
standard mode: build a JWT authentication system with refresh tokens for a Node.js Express API
```
```
full mode: design and implement a multi-tenant SaaS billing system using Stripe webhooks and PostgreSQL
```

---

### Precision Lane (Section 14) — Pre-flight + 2 Human Checkpoints + Optional Blind Review

Runs pre-flight agents first, then stops for your review before execution begins, then stops again before review. Use for production code, anything you will ship, security-sensitive work.

| Goal | Prompt to type |
|---|---|
| Small feature, want review gate | `orchestrated quick: [describe your task]` |
| Production feature | `orchestrated standard: [describe your task]` |
| Greenfield project | `orchestrated full: [describe your task]` |

**Examples:**
```
orchestrated quick: add pagination to the /users endpoint using cursor-based pagination
```
```
orchestrated standard: build a password reset flow with time-limited tokens, rate limiting, and audit logging
```
```
orchestrated full: build a document processing microservice that accepts PDF uploads, extracts text via OCR, stores metadata in PostgreSQL, and exposes a REST API
```

---

### Tier 3 — Language Specialists (Opt-In Only, Never Auto-Fired)

> ⚠️ **Tier 3 agents are NOT included in any pipeline by default.** You must explicitly add them. If you do not append `— also run [agent-name]`, they will not run even in Full mode.

In the VS Code profile bundle, requested Tier 3 specialists run after the base Phase 1 agents and before the checkpoint.

You can also explicitly request the existing built-in specialists such as `security-reviewer`, `database-reviewer`, `performance-optimizer`, `e2e-runner`, `refactor-cleaner`, or `doc-updater`. If one is already included in the selected mode, it is reported as already included instead of being run twice.

Append to any precision lane trigger:

```
orchestrated standard: build a React dashboard with real-time WebSocket updates — also run typescript-reviewer
```
```
orchestrated full: implement a CQRS event sourcing system for order management — also run java-reviewer
```
```
orchestrated full: build a Kotlin multiplatform backend with Ktor and PostgreSQL — also run kotlin-reviewer and database-reviewer
```
```
orchestrated standard: add OAuth2 social login with Google and GitHub — also run typescript-reviewer and security-reviewer
```
```
orchestrated quick: implement a high-throughput message queue consumer in Rust — also run rust-reviewer
```

**Tier 3 agents available:**

| Agent name | Language / Domain |
|---|---|
| `typescript-reviewer` | TypeScript / JavaScript |
| `java-reviewer` | Java / Spring Boot |
| `java-build-resolver` | Java build errors |
| `kotlin-reviewer` | Kotlin / Android / KMP |
| `kotlin-build-resolver` | Kotlin build errors |
| `go-reviewer` | Go |
| `go-build-resolver` | Go build errors |
| `rust-reviewer` | Rust |
| `rust-build-resolver` | Rust build errors |
| `cpp-reviewer` | C++ |
| `cpp-build-resolver` | C++ build errors |
| `flutter-reviewer` | Flutter / Dart |
| `healthcare-reviewer` | Clinical / PHI / HIPAA |
| `pytorch-build-resolver` | PyTorch / CUDA |

---

### Blind Review via handover.md

At Checkpoint 2 of any precision lane pipeline, choose option `C`. The AI generates a `handover.md` file. Paste it into a new chat window or a different AI model entirely for a genuinely blind cross-model review.

---

## What This Is

A single repository that makes every AI tool you use follow the same
development standards automatically — across every project and every
laptop. Contains the complete master rules plus installation files
for Claude Code, Gemini CLI, VS Code, Antigravity Desktop, and more.

## Syncing VS Code Across Devices

This repo can also be the source of truth for your VS Code Copilot user profile.
The `vscode-profile/` folder contains the router instruction, custom agents, and
prompt wrappers that power the validated autofire behavior.

On each device:
1. `git pull`
2. Run one installer command:

Windows PowerShell:
```
powershell -File .\scripts\install-vscode-profile.ps1
```

If your machine blocks local scripts and you trust this repo, you can use:
```
powershell -ExecutionPolicy Bypass -File .\scripts\install-vscode-profile.ps1
```

macOS / Linux:
```
bash ./scripts/install-vscode-profile.sh
```

That refreshes the local VS Code user profile from the latest GitHub version.

## Optional: Make Post-Pull Sync Automatic On Each Device

GitHub cannot force a new device to auto-run local scripts after `git pull`.
Git does not trust versioned hooks until you explicitly enable them on that device.

The safe model is:
1. one-time bootstrap per device
2. after that, future `git pull`, checkout, and rebase operations in this repo auto-sync the VS Code profile bundle

Windows PowerShell:
```
powershell -File .\scripts\bootstrap-git-hooks.ps1
```

macOS / Linux:
```
bash ./scripts/bootstrap-git-hooks.sh
```

What the bootstrap does:
- points this repo to the versioned `.githooks/` directory
- runs the VS Code profile installer once immediately
- enables automatic profile refresh after later `git pull`, checkout, and rebase operations in this repo

If a hook-based sync fails later, Git operations still complete, but the hook leaves a local error marker in `.git/master-rules-profile-sync.last-error` and prints a recovery message.
If a hook-based sync succeeds, the hook writes `.git/master-rules-profile-sync.last-success` with the hook name, commit hash, and UTC timestamp.

## Trust Model

Bootstrapping Git hooks on a device means you trust future commits from this repository to update your local VS Code profile.

Before you enable hooks on a device:
1. verify you are on your trusted repository and branch
2. review `.githooks/` and `scripts/`
3. bootstrap only on machines where you want this repo to manage the VS Code profile automatically

To disable automatic post-pull sync on a device:
```
git config --unset core.hooksPath
```

For a copy-paste checklist for a second device, see `NEW_DEVICE_SOP.md`.

Important:
- this installs the router, prompts, and custom agents into the local profile
- you still need Agent mode in Copilot Chat
- you still need to type the trigger phrase, such as `orchestrated standard: ...`

## Files in This Repository

| File | Purpose | Activation |
|------|---------|-----------|
| **MASTER_RULES.md** | All rules — single source of truth | Read by all tools |
| **HANDOVER.md** | Agent briefing — install and verify everything | Give to agent first |
| **CLAUDE.md** | Auto-fire pointer for Claude Code terminal | Automatic every session |
| **GEMINI.md** | Auto-fire pointer for Gemini CLI | Automatic every session |
| **ANTIGRAVITY.md** | Rules for Antigravity Desktop system prompt | Paste once into settings |
| **.vscode/settings.json** | VS Code Chat instruction injection | Copy to each project |
| **NEW_DEVICE_SOP.md** | Copy-paste checklist for first-time setup and second-device validation | Use after clone or pull |
| **vscode-profile/** | VS Code user-profile router, agents, and prompts | Sync to every device |
| **scripts/install-vscode-profile.ps1** | Windows installer/updater for the VS Code profile bundle | Run after git pull |
| **scripts/install-vscode-profile.sh** | macOS/Linux installer/updater for the VS Code profile bundle | Run after git pull |
| **scripts/bootstrap-git-hooks.ps1** | Windows one-time hook bootstrap for automatic post-pull sync | Run once per device |
| **scripts/bootstrap-git-hooks.sh** | macOS/Linux one-time hook bootstrap for automatic post-pull sync | Run once per device |
| **.githooks/** | Versioned Git hooks that auto-refresh the VS Code profile after pull/checkout/rebase | Enabled by bootstrap |
| **SETUP_GUIDE.md** | Plain language setup for each new laptop | Read on each new laptop |
| **README.md** | This file | GitHub home page |

## Start Here

**If setting up a new laptop**: give HANDOVER.md to your agent.
The agent will verify, execute, and install everything in order.

**If the VS Code profile bundle is installed**: open a fresh Agent-mode chat and use the trigger directly.

**If rules are already set up but the VS Code profile bundle is not installed**: type this at the start of any
VS Code Chat, Kimi, or Claude Desktop session:
```
Read MASTER_RULES.md and confirm rules loaded before we begin.
```

## Auto-Fire Tools (No Action Needed)

- Claude Code terminal → CLAUDE.md fires automatically
- Gemini CLI → GEMINI.md fires automatically
- Antigravity Desktop → system prompt fires automatically (after one-time setup)

## On-Demand Tools (One Line at Session Start)

- VS Code Chat without profile bundle → type the opening ritual
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

## Pipeline Commands

### Fast Lane — Section 13 (Automated, No Checkpoints)

Fires agents to completion with no human gates. Use for exploratory work, drafts, speed-over-rigor.

| What You Type | Mode | Agents | Time |
|---|---|---|---|
| `quick mode: [task]` | Quick | 4 | ~3–6 min |
| `standard mode: [task]` | Standard | 6 | ~8–14 min |
| `autofire tier 1: [task]` | Standard (alias) | 6 | ~8–14 min |
| `full mode: [task]` | Full | 11 | ~18–28 min |
| `fire all agents: [task]` | Full (alias) | 11 | ~18–28 min |

### Precision Lane — Section 14 (AO Backbone + Checkpoints)

Pre-flight agents run first, then **two human checkpoints** before execution and before review. Use for production code, anything you will ship, security-sensitive work.

| What You Type | Pre-flight Agents | Checkpoints | Blind Review |
|---|---|---|---|
| `orchestrated quick: [task]` | 4 | 2 | Optional handover.md |
| `orchestrated standard: [task]` | 6 | 2 | Optional handover.md |
| `orchestrated full: [task]` | 11 | 2 | Optional handover.md |

**Add Tier 3 language specialists to any precision lane trigger:**
- `orchestrated standard: build auth API — also run typescript-reviewer`
- `orchestrated full: payment module — also run java-reviewer`

Full pipeline specs are in **SECTION 13** and **SECTION 14** of MASTER_RULES.md.

---

## Agent Registry — All 30 ECC Agents

Installed at `~/.claude/agents/` via [everything-claude-code](https://github.com/affaan-m/everything-claude-code).

### TIER 1 — Core Pipeline Agents (Use Every Session)

These 6 agents run on virtually every feature. Fire them with `autofire tier 1`.

| Agent | Role | What It Produces | When to Call |
|---|---|---|---|
| **planner** | Strategist | Phased implementation plan, tech stack, build order, risk table | Before writing any code |
| **architect** | System Designer | ASCII architecture diagram, module boundaries, Python dataclass contracts, scalability path | After planner, before TDD |
| **tdd-guide** | Test-First Enforcer | Test file skeletons, conftest.py, pytest.ini (80% coverage), mock strategy, first failing test | Before writing any function |
| **security-reviewer** | Attack Simulator | OWASP Top 10 scan, SSRF/injection/secrets findings, exact fix code per issue | Before every commit |
| **python-reviewer** | Python Specialist | PEP 8 compliance, type hints, anti-patterns, naming conventions, error handling patterns | After writing Python code |
| **code-reviewer** | Senior Engineer Read-Through | Quality, maintainability, error handling, logic correctness, naming | After any code change |

### TIER 2 — Regular Support Agents (Use Per Phase)

These 5 agents run at specific milestones. Included in `autofire tier 1 and tier 2`.

| Agent | Role | What It Produces | When to Call |
|---|---|---|---|
| **database-reviewer** | Query Doctor | Schema design, index strategy, SQL query review, integrity constraints, connection pooling | Before finalising any DB schema |
| **performance-optimizer** | Speed Engineer | Bottleneck analysis, caching strategy, memory risk, batching opportunities, API deduplication | After Phase 1 complete, before production |
| **e2e-runner** | User Journey Tester | Critical flow test skeletons, happy/error path tests, CI integration config | Before each deployment |
| **refactor-cleaner** | Dead Code Remover | Unused functions/imports/packages found and safely removed, duplicate logic consolidated | End of each phase |
| **doc-updater** | README Keeper | Updated README, .env.example, codemap diagrams, setup guides, per-phase doc checklist | After adding any new feature |

### TIER 3 — Language Specialists (Use Only for That Language)

Call individually when working in that specific language. Not included in autofire pipelines.

| Agent | Language | Use When |
|---|---|---|
| **typescript-reviewer** | TypeScript / JavaScript | Any `.ts`, `.tsx`, `.js`, `.jsx` files |
| **kotlin-reviewer** | Kotlin / Android / KMP | Any `.kt`, `.kts` files |
| **kotlin-build-resolver** | Kotlin / Gradle | Kotlin build errors |
| **java-reviewer** | Java / Spring Boot | Any `.java` files |
| **java-build-resolver** | Java / Maven / Gradle | Java build errors |
| **go-reviewer** | Go | Any `.go` files |
| **go-build-resolver** | Go | Go compilation errors |
| **rust-reviewer** | Rust | Any `.rs` files |
| **rust-build-resolver** | Rust / Cargo | Rust build/borrow checker errors |
| **cpp-reviewer** | C++ | Any `.cpp`, `.hpp`, `.h` files |
| **cpp-build-resolver** | C++ / CMake | C++ build/linker errors |
| **flutter-reviewer** | Flutter / Dart | Any `.dart` files |
| **pytorch-build-resolver** | PyTorch / CUDA | CUDA/tensor/training errors |
| **healthcare-reviewer** | Clinical / PHI / HIPAA | Healthcare data or clinical logic |

### UTILITY AGENTS (Invoke By Name Anytime)

| Agent | Purpose | When to Call |
|---|---|---|
| **build-error-resolver** | Fix TypeScript/JS/Python build errors (minimal diff only) | When any build breaks |
| **docs-lookup** | Fetch live library documentation via Context7 MCP | When you need current API docs |
| **loop-operator** | Monitor and recover autonomous agent batch loops | When running overnight batch jobs |
| **harness-optimizer** | Tune ECC agent config for reliability, cost, throughput | Monthly maintenance |
| **chief-of-staff** | Triage email/Slack/LINE/Messenger, draft replies | When managing communications |

---

## How to Call a Single Agent

```
Use the planner agent to plan [task]
Use the security reviewer to audit [file]
Use the TDD guide to write tests for [module]
Use the architect agent to design [component]
Use the code reviewer to review [file or recent changes]
Use the Python reviewer to review [file or folder]
Use the database reviewer to review [schema or queries]
```

---

## Installed Repositories This System References

| Repository | Purpose | Stars |
|-----------|---------|-------|
| affaan-m/everything-claude-code | Agent harness, 30 agents, 125+ skills | ~100K |
| hesreallyhim/awesome-claude-code | Vetted skill and tool index | Active |
| Chachamaru127/claude-code-harness | TypeScript guardrail engine | Active |
| farion1231/cc-switch | CLI manager, model switching | 27K+ |

## Updating Rules

Edit MASTER_RULES.md → commit → push → pull on other laptops.
All tools pick up new rules immediately on next session.
