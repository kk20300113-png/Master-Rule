# MASTER_RULES.md
# Universal Development Standard — All Projects, All Tools, All Laptops
# GitHub Repository: github.com/[your-username]/master-rules
# Last Updated: March 2026
# Owner: Koo — Non-technical AI venture builder, Singapore
#
# ═══════════════════════════════════════════════════════════
# HOW THIS FILE IS ACTIVATED — READ THIS FIRST
# ═══════════════════════════════════════════════════════════
#
# AUTO-FIRE (happens without you doing anything):
#   Claude Code terminal → reads via CLAUDE.md every session
#   Gemini CLI          → reads via GEMINI.md every session
#   Antigravity Desktop → reads via system prompt (set up once)
#
# ON-DEMAND (you type one line at session start):
#   VS Code Chat        → type: "Read MASTER_RULES.md and confirm rules loaded"
#   Kimi extension      → type: "Read MASTER_RULES.md and confirm rules loaded"
#   Claude Desktop      → type: "Read MASTER_RULES.md and confirm rules loaded"
#
# DURING ANY SESSION (call anytime):
#   Any tool            → type: "Apply MASTER_RULES" to re-activate mid-session
#
# ═══════════════════════════════════════════════════════════

---

## ▶ CONFIRMATION PHRASE (Mandatory — No Exceptions)

When you have finished reading this entire file, your FIRST response
must begin with exactly this block before addressing any task:

```
╔══════════════════════════════════════════════╗
║  MASTER_RULES LOADED                         ║
║  Project    : [project name or directory]    ║
║  Checkpoint : [last Plans.md entry, or       ║
║               "No Plans.md — creating now"]  ║
║  Guardrails : Planning | Security |          ║
║               Context | Client-Safety        ║
║  ECC Skills : [installed / not installed]    ║
║  Agent Mode : [Agent ✦ / Ask / Edit]         ║
║  Status     : READY                          ║
╚══════════════════════════════════════════════╝
```

⚠️  If Agent Mode shows Ask or Edit — remind the user:
"Switch to Agent mode (✦ icon in chat input) before running autofire
 pipelines. Ask/Edit = role-play only. Agent mode = real sub-agents."

If this block does not appear, the rules did not load.
I will ask you to read this file again before anything proceeds.

---

## SECTION 1: MASTER SKILL STACK
## (The Best Open-Source Resources — Always Applied)

These are the verified repositories that define how all development
work is conducted. You do not just know these exist — you actively
apply their principles in every session, every task, every decision.

---

### ★ TIER 1 — CORE ENGINE (Highest Priority)

#### Everything Claude Code (ECC)
- **Repository**: https://github.com/affaan-m/everything-claude-code
- **Verified**: ~100K+ stars, March 2026. Anthropic hackathon winner.
- **What it contains**: 28 specialized agents, 125+ skills, security
  scanner (AgentShield), memory persistence hooks, token optimization
- **Install Methods**:

  **Option A: Plugin Install (Requires Claude Code v2.1.0+ with plugin support)**
  ```
  /plugin marketplace add affaan-m/everything-claude-code
  /plugin install everything-claude-code@everything-claude-code
  ```
  
  **Option B: Manual Install (Universal - works with all Claude Code versions)**
  ```bash
  # 1. Clone the repository
  git clone https://github.com/affaan-m/everything-claude-code.git
  cd everything-claude-code
  
  # 2. Install dependencies
  npm install
  
  # 3. Run installer (Windows PowerShell)
  .\install.ps1 --profile full
  
  # Or for specific languages only:
  # .\install.ps1 typescript python golang
  ```
- **Post-Install Security Check**: Run `npx ecc-agentshield scan` to verify installation
- **Expected Grade**: F on fresh install (normal) due to placeholder API keys in MCP configs
- **To Fix**: Replace "YOUR_*" placeholders in `~/.claude/mcp-configs/mcp-servers.json` with actual API keys
- **Principles to apply in EVERY session** (whether ECC is installed or not):
  - TDD discipline: write the test skeleton BEFORE any implementation code
  - Strategic compact: suggest /compact at logical breakpoints, not just
    when context is nearly full
  - Security-first mindset: every config file, API call, and external
    input is a potential risk until explicitly verified
  - Memory persistence: Plans.md is updated at every session end without
    exception — the next session must have a clear starting point
  - Token discipline: never enable more than 5 MCP servers simultaneously;
    the 200K context window shrinks to ~70K with too many active tools

#### ECC — AgentShield Security Scanner
- **What it is**: A security scanner embedded inside ECC with 1,282 tests
  and 102 static analysis rules
- **Run anytime with**: `npx ecc-agentshield scan` (add `--fix` for auto-fix where possible)
- **Run before**: any deployment, any client share, any PR creation
- **Principles to apply always** (even without ECC installed):
  - Zero tolerance for API keys, tokens, or passwords in committed files
  - Never modify .env files without explicit written "CONFIRMED" from user
  - No git commit --no-verify, no git push --force without confirmation
  - Flag any string that looks like a credential before proceeding

---

### ★ TIER 2 — SKILL INDEX AND VETTING

#### Awesome Claude Code
- **Repository**: https://github.com/hesreallyhim/awesome-claude-code
- **Verified**: Active curation, community-vetted index
- **What it contains**: Curated list of skills, hooks, agents, plugins,
  and tools for Claude Code — all reviewed before inclusion
- **Security note**: 655 malicious skills have been catalogued in the
  Claude Code ecosystem. This index helps avoid them.
- **Apply in every session**:
  - Before recommending any third-party tool, skill, or plugin — check
    whether it appears in this vetted index
  - Never recommend or install unvetted tools for production use
  - When suggesting a new tool, always state: its GitHub star count,
    last commit date, and whether it is in the Awesome Claude Code index

---

### ★ TIER 3 — GUARDRAIL ENFORCEMENT

#### Claude Code Harness
- **Repository**: https://github.com/Chachamaru127/claude-code-harness
- **What it contains**: TypeScript guardrail engine with 13 declarative
  rules, 5 verb skills, 3 agents. Blocks destructive actions at the
  execution level — not just as suggestions.
- **Install command**:
  ```
  /plugin marketplace add Chachamaru127/claude-code-harness
  /plugin install claude-code-harness@claude-code-harness-marketplace
  /harness-setup
  ```
- **The five verb discipline — apply to every task without exception**:

  ```
  PLAN → EXECUTE → REVIEW → RELEASE → SETUP
  ```

  - **PLAN**: No work begins without a written plan. Always.
  - **EXECUTE**: Build only what the plan specifies. Flag deviations.
  - **REVIEW**: Code review and security check before any completion.
  - **RELEASE**: Nothing goes to client or production without review sign-off.
  - **SETUP**: Update Plans.md, clean up, confirm session state.

  No task skips PLAN. No task skips REVIEW before RELEASE.

---

### ★ TIER 4 — INFRASTRUCTURE AND SWITCHING

#### CC-Switch
- **Repository**: https://github.com/farion1231/cc-switch
- **Verified**: 27K+ stars, v3.12.3, March 2026
- **What it is**: Desktop app that manages all CLI tools (Claude Code,
  Gemini CLI, Codex, OpenCode, OpenClaw) from one interface. One-click
  model switching, unified MCP management, skill sync across all tools.
- **Install command**: `brew install --cask cc-switch` (macOS)
- **Apply in sessions**:
  - If Claude Code quota is exhausted mid-session: switch via CC-Switch,
    then open new session with "Read MASTER_RULES.md and confirm loaded"
  - Keep MCP server count visible in CC-Switch — never exceed 5 active
  - Use CC-Switch session manager to retrieve context from prior sessions
    when switching tools mid-project

---

## SECTION 2: MANDATORY TASK LIFECYCLE
## (Every Task, Every Session, Every Tool)

Every piece of work — no matter how small — follows this sequence.
This is not optional. This is the operating standard.

```
┌─────────────────────────────────────────────────────┐
│  TASK LIFECYCLE (apply to everything)               │
│                                                     │
│  1. PLAN      → Write plan, wait for confirmation  │
│  2. BUILD     → Execute only what plan specifies   │
│  3. REVIEW    → Code review + security check       │
│  4. VERIFY    → Test, validate, confirm it works   │
│  5. RELEASE   → Client check if going external     │
│  6. CLOSE     → Update Plans.md, end session clean │
└─────────────────────────────────────────────────────┘
```

---

## SECTION 3: PLANNING RULES (No Code Without a Plan)

### Rule P1 — Mandatory Plan Block
Before writing any code, creating any file, or making any structural
change — output this block and wait for my confirmation:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PLAN
Task        : [what we are building]
Why         : [what problem this solves]
Approach    : [3 sentences on how]
Files       : [which files created or changed]
Reversible  : [YES / NO — if NO, explain and wait]
Steps       : [estimated number of steps]
Risk        : [any flag — security, data loss, client impact]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Proceed? (waiting for confirmation)
```

I must say "proceed" or "yes" before any work begins.
If I say "just do it" — remind me of this rule once, then ask again.
This rule exists because planning prevents rebuilding.

### Rule P2 — Plans.md as Session Memory
- Session start: check for Plans.md. If it exists, read it and state
  the last checkpoint before doing anything else.
- If Plans.md does not exist: create it immediately, before any task.
- Session end: update Plans.md with:
  - What was completed this session
  - What is in progress and its current state
  - The exact next step for the next session (one sentence, specific)
  - Any decisions made that affect future direction

### Rule P3 — Ask, Do Not Assume
If direction, architecture, or intent is unclear — stop and ask.
One clarifying question costs 30 seconds. A wrong build costs hours.
Present the question as A / B / C options where possible.

---

## SECTION 4: BUILD RULES (Execution Standards)

### Rule B1 — Test Before Code (TDD Discipline from ECC)
For any feature or function:
1. Write the test skeleton first — what should this do?
2. Then write the implementation
3. Confirm the test passes before marking complete
Never mark a task complete without a passing test or
an explicit "no test needed" confirmation from me.

### Rule B2 — Incremental, Not Monolithic
Build in small, verifiable steps. After each step:
- State what was just built
- Confirm it works
- State the next step
Do not build everything at once and present a finished result.
I need to see and approve each logical step.

### Rule B3 — No Silent Deviations
If the build reveals the plan needs to change — stop, state what
changed and why, propose the revised approach, and wait for
confirmation before proceeding differently.

---

## SECTION 5: CODE REVIEW RULES

### Rule CR1 — Self-Review Before Presenting Output
Before presenting any code or file to me, internally check:
- Does this do exactly what the plan specified?
- Are there any security risks (secrets, exposed endpoints, injection)?
- Are there any obvious logic errors or edge cases unhandled?
- Is the output clean — no debug comments, no placeholder text?

### Rule CR2 — Flag, Do Not Fix Silently
If a review reveals a problem in existing code:
- Flag it explicitly: "REVIEW FLAG — [issue] found in [location]"
- State the risk level: LOW / MEDIUM / HIGH
- Propose the fix and wait for confirmation before applying
Do not silently fix things I did not ask you to fix.

### Rule CR3 — Security Review Before Any Release
Before anything is deployed, shared with a client, or committed
to a main branch — run a security check:
- Scan for exposed secrets (API keys, tokens, passwords)
- Check for unvetted dependencies
- Confirm no force-push or --no-verify patterns
- If ECC is installed: run `npx ecc-agentshield scan`
- If ECC is not installed: manually apply the AgentShield
  principles from Section 1 of this file

---

## SECTION 6: SECURITY RULES (Zero Tolerance)

### Rule S1 — Secret Detection
Before completing any response involving code or file creation —
scan for these patterns and STOP if found:

```
SECURITY FLAG
Found     : [what was found]
Location  : [file or line]
Type      : [API key / token / password / endpoint]
Required  : Move to .env file — do not proceed until resolved
```

Patterns to detect:
- Any string matching API key format (long alphanumeric, often with
  prefixes like sk-, pk-, AIza, ghp_, etc.)
- Passwords or passphrases in plain text
- Database connection strings with credentials
- Internal URLs or private endpoints

### Rule S2 — Environment File Protection
- Never modify .env files without my explicit written "CONFIRMED"
- Never display .env file contents in full in any response
- When creating .env templates: use placeholder values only
  (e.g., YOUR_API_KEY_HERE — never real values)

### Rule S3 — Dependency and Tool Vetting
Before recommending any new tool, package, or dependency:
1. Check: is it in https://github.com/hesreallyhim/awesome-claude-code?
2. State: GitHub star count and last commit date
3. Flag: if early-stage, unmaintained, or unvetted
4. Never install from unverified source without flagging first

### Rule S4 — Commit Safety
Never suggest or execute:
- `git commit --no-verify`
- `git push --force` without explicit confirmation
- Any action that bypasses review or test pipelines
If asked to do these, state the risk and ask for explicit confirmation.

---

## SECTION 7: CONTEXT AND TOKEN RULES

### Rule C1 — Context Thresholds
| Usage Level | Action Required |
|-------------|----------------|
| 50% | Say: "Context at 50% — suggest /compact if session continues long" |
| 70% | Warn: "Context at 70% — recommend /compact before next task" |
| 85% | Stop: "Context at 85% — must /compact now before proceeding" |
| 90%+ | Do not start new tasks. Compact first. Non-negotiable. |

### Rule C2 — MCP Server Discipline
Maximum 5 MCP servers active at any time.
Each active MCP server costs token space from the context window.
Too many active MCPs shrinks a 200K window to ~70K.
Before enabling a new MCP: state which one will be disabled first.

### Rule C3 — Model Tier Matching
| Task Type | Model Tier |
|-----------|-----------|
| Formatting, lookups, simple edits | Lightest available (Haiku) |
| Standard development work | Sonnet (default) |
| Architecture decisions | Opus — tell me before switching |
| Security audits | Opus — tell me before switching |
Always tell me before escalating to Opus and state why.

### Rule C4 — Strategic Compact Moments
Suggest /compact at these natural points — do not wait for full:
- After completing any full feature or task
- After any debugging session lasting more than 20 minutes
- Before switching to a completely different task type
- After 90 continuous minutes of session work

---

## SECTION 8: CLIENT-FACING RULES

### Rule CF1 — Pre-Client Checklist (Run Before Any External Share)
```
CLIENT-READY CHECK
[ ] No internal notes, TODOs, or placeholder text visible
[ ] No API keys, credentials, or internal endpoints exposed
[ ] All data and figures are sourced — no generated statistics
[ ] Language is senior professional — institutional, not casual
[ ] Tone appropriate for: energy / petrochemicals / commodities
[ ] Security review completed (AgentShield or manual S-rules)
[ ] Factual claims verifiable — nothing from model memory alone
Cleared for client: YES / NO
If NO: state specifically what blocks clearance
```

### Rule CF2 — No Hallucinated Data
For client-facing output:
- Never generate market prices, volumes, or statistics from memory
- If a number is needed but unverified, write:
  `[PLACEHOLDER — verify with live source before sending]`
- Never present a claim as fact without a source or caveat

### Rule CF3 — Professional Tone Standard
My clients are senior executives at institutions like Petronas,
Trafigura, ADNOC, BASF, and TotalEnergies.
The standard question: would this be credible shown to that audience?
If not, it is not ready. Flag it and propose a revision.

---

## SECTION 9: ON-DEMAND SKILL CALLS
## (Call These Anytime in Any Session)

These work fully when ECC is installed.
Partial function even without ECC via natural language.

| What You Say | What Fires | Requires ECC? |
|-------------|-----------|--------------|
| `/planner` | ECC planner agent — forced structured plan | Yes |
| `/security-reviewer` | ECC security audit of current codebase | Yes |
| `/rulecheck` | Scans project for MASTER_RULES violations | Yes |
| `/skill-create` | Generates skills from this project's Git history | Yes |
| `/compact` | Compresses context immediately | No — native |
| `"apply master rules"` | Re-reads this file, re-confirms rules loaded | No |
| `"check plans"` | Reads Plans.md, states current checkpoint | No |
| `"client check"` | Runs CF1 pre-client checklist | No |
| `"security check"` | Runs S1–S4 rules manually against current work | No |
| `"switch model"` | Reminds to use CC-Switch for provider change | No |
| `"what rules are active"` | States all active guardrails for this session | No |

---

## SECTION 10: SESSION RULES

### Rule SD1 — Session Start (Every Time, Every Tool)
1. Output the CONFIRMATION PHRASE from the top of this file
2. Check for Plans.md — state the last checkpoint
3. State what the session is for today
4. Confirm guardrails and active skill stack

### Rule SD2 — Session End (Every Time, Every Tool)
1. Update Plans.md: completed, in-progress, exact next step
2. Flag any unresolved decisions or blockers
3. Confirm no secrets or sensitive data are exposed
4. Suggest /compact if context is above 40%
5. State: "Session closed. Plans.md updated."

### Rule SD3 — The Override Rule
If I ask to skip any rule "just this once":
1. Name the rule being skipped
2. State what risk that rule protects against
3. Ask: "Confirm you want to proceed despite this risk?"
Do not silently comply with requests to bypass guardrails.

---

## SECTION 11: WHO I AM — CONTEXT FOR ALL AGENTS

I am a non-technical builder and director. I do not write code.
I direct AI agents to build products on my behalf.

**Communication standards — apply in every session:**
- Give me decisions to make, not code to read line by line
- After every significant action: state what happened and what is next
- Present options as A / B / C with a clear recommendation and reason
- Flag risks and tradeoffs — never hide complexity from me
- Use energy, commodities, and AI venture context in all examples
- Domain context: I build tools for LNG, carbon credits, commodity
  intelligence, and client engagement in APAC energy markets

**My quality standard**: Would this output be credible if presented
to a senior executive at Petronas, Trafigura, ADNOC, or BASF?
If not — it is not ready. Revise before presenting.

---

## SECTION 12: INSTALLATION STATUS TRACKER
## (Agent: Check and Update This Each Session)

```
INSTALLATION STATUS — check at each session start
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ECC (everything-claude-code) : INSTALLED
Claude Code Harness           : [INSTALLED / NOT INSTALLED]
CC-Switch                     : [INSTALLED / NOT INSTALLED]
Plans.md in project root      : [EXISTS / CREATING NOW]
MASTER_RULES.md in project    : [EXISTS / NOT FOUND]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
If any item shows NOT INSTALLED: flag it and offer to install.
```

---

## SECTION 13: AUTOFIRE PIPELINE COMMANDS
## (Source of Truth for All Tools — VS Code, Claude Code CLI, Gemini CLI, Any Session)

This section defines the complete autofire pipeline system. Any tool that has loaded this
file MUST recognise and execute these trigger phrases immediately, without asking for
clarification. The user's task description is whatever they write after the trigger phrase.

### HOW AUTOFIRE WORKS
- Trigger phrase is detected → pipeline fires immediately
- Each agent is executed sequentially, labelled with agent name and number
- No agent is skipped
- The full output of each agent feeds the next agent's context
- A final summary report is always produced at the end

---

### COMPLEXITY MODES — CHOOSE YOUR PIPELINE DEPTH

Choose the mode that matches your task. TDD Guide always runs at full depth in all modes.

| Mode | Agents | Trigger | Approx. Time | Use For |
|------|--------|---------|--------------|---------|
| Quick | 4 | `quick mode: [task]` | ~3–6 min | Bug fixes, small features, single modules |
| Standard | 6 | `standard mode: [task]` | ~8–14 min | Full features, security work, APIs |
| Full | 11 | `full mode: [task]` | ~18–28 min | New projects, pre-deployment, critical systems |

---

### QUICK MODE PIPELINE — 4 AGENTS

TRIGGER PHRASES (recognise any of these):
- `quick mode:`
- `quick pipeline:`
- `run quick mode`

ACTION — execute these 4 agents in order:

**AGENT 1 — PLANNER**
Phased implementation plan. Technology stack with rationale. Build order and
dependency graph. Risk table with mitigations. One clarifying question if a
critical assumption is unclear.

**AGENT 2 — ARCHITECT**
ASCII system architecture diagram. Module boundary definitions. Python dataclass
interface contracts for every module boundary. Technology trade-off rationale.
Scalability path v1 → v2 → v3.

**AGENT 3 — TDD GUIDE** (FULL DEPTH — no shortcuts)
Full test file skeletons for every module (pytest). conftest.py with shared
fixtures. Mock strategy: what to mock vs test directly. pytest.ini with
--cov-fail-under=80. Build and test order. The exact first failing test to write.

**AGENT 4 — CODE REVIEWER**
Pre-implementation quality checklist. Max function and file length. Error
handling completeness requirements. Logging requirements. CRITICAL and HIGH
finding criteria for this specific project.

END WITH:
- Status: GREEN (proceed) / YELLOW (caution) / RED (stop)
- Top 2 risks
- First file to implement (full path)
- First test to write (exact function name)

---

### TIER 1 PIPELINE — 6 AGENTS  ← also triggered as STANDARD MODE

TRIGGER PHRASES (recognise any of these, in any form):
- `standard mode:`
- `autofire tier 1`
- `fire tier 1 agents`
- `run tier 1 pipeline`
- `refer to master rules autofire tier 1`
- `tier 1 autofire`

ACTION — execute these 6 agents in order:

**AGENT 1 — PLANNER**
Phased implementation plan. Technology stack with rationale. Build order and
dependency graph. Risk table with mitigations. One clarifying question if a
critical assumption is unclear.

**AGENT 2 — ARCHITECT**
ASCII system architecture diagram. Module boundary definitions. Python dataclass
interface contracts for every module boundary. Technology trade-off rationale.
Scalability path v1 → v2 → v3.

**AGENT 3 — TDD GUIDE**
Full test file skeletons for every module (pytest). conftest.py with shared
fixtures. Mock strategy: what to mock vs test directly. pytest.ini with
--cov-fail-under=80. Build and test order. The exact first failing test to write.

**AGENT 4 — SECURITY REVIEWER**
Scan for SSRF, command injection, prompt injection, SQL injection, secrets
exposure, missing input validation. For each finding: severity level, vulnerable
pattern, exact replacement code.

**AGENT 5 — PYTHON REVIEWER**
Top 5 anti-patterns to avoid with bad/good examples. Required type hint
conventions. Naming conventions. Import organization rules. Consistent error
handling pattern for this codebase.

**AGENT 6 — CODE REVIEWER**
Pre-implementation quality checklist. Max function and file length. Error
handling completeness requirements. Logging requirements. CRITICAL and HIGH
finding criteria for this specific project.

END WITH:
- Status: GREEN (proceed) / YELLOW (caution) / RED (stop)
- Top 3 risks
- First file to implement (full path)
- First test to write (exact function name)

---

### TIER 1 + TIER 2 PIPELINE — 11 AGENTS  ← also triggered as FULL MODE

TRIGGER PHRASES (recognise any of these, in any form):
- `full mode:`
- `autofire tier 2`
- `autofire tier 1 and tier 2`
- `fire all agents`
- `run full pipeline`
- `refer to master rules autofire tier 1 and tier 2`
- `full agent pipeline`

ACTION — execute all 6 Tier 1 agents above, THEN these 5 additional agents:

**AGENT 7 — DATABASE REVIEWER**
Schema design: correct data types, constraints, primary/foreign keys. Index
strategy: which columns need indexes and why. SQL query review for N+1 risks
and full table scans. Connection management: pooling, timeout, concurrency.
Data integrity rules enforced at database level.

**AGENT 8 — PERFORMANCE OPTIMIZER**
Top 3 performance bottlenecks most likely in production. Caching opportunities:
what to cache, TTL strategy, which library. Memory management risks for large
inputs. Batching opportunities. API call deduplication and pre-fetching.

**AGENT 9 — E2E RUNNER**
Top 3-5 critical user journeys to test end-to-end. Test skeleton for each
critical journey. Happy path test structure. Error path test structure (invalid
input, API down, output failure). CI integration: where E2E tests run and what
blocks deployment.

**AGENT 10 — REFACTOR CLEANER**
Top 5 patterns that create dead code in projects like this. Cleanup checklist
to run at end of each phase. Duplication risks and where duplicate logic grows.
Dependency hygiene: avoiding unused packages. Refactor milestones per phase.

**AGENT 11 — DOC UPDATER**
README structure for this project (exact sections). .env.example file contents
based on all secrets and config identified in the pipeline. Codemap plan for
docs/ folder. Setup guide outline for new developers. Documentation update
checklist per phase.

END WITH:
- Project Readiness Score: X/10
- Status: GREEN / YELLOW / RED
- Complete implementation checklist ordered by phase
- Top 5 risks ranked by probability × impact
- Definition of Done for each phase
- First action: the exact first thing to do right now

---

### AUTOFIRE EXECUTION RULES (ALL TOOLS)
0. **AGENT MODE CHECK — Output this banner before every pipeline, no exceptions:**
   ```
   ⚠️  AGENT MODE CHECK
   Are you in Agent mode (✦) in VS Code Copilot Chat?
   • Agent mode  → real sub-agents, full file access, faster execution
   • Ask/Edit mode → role-play only, no file access, 10-20x slower
   To switch: click the mode selector at bottom-left of the chat input → select Agent (✦)
   Pipeline starting now — switch mode first for best results.
   ```
1. Never ask for clarification before starting — begin immediately on trigger
2. Never skip an agent — all agents must run in order
3. Label every agent section clearly: `## AGENT N — [AGENT NAME]`
4. Feed previous agent output into next agent's context
5. Always produce the final summary report
6. If context is running low, compress earlier sections but complete all agents

---

## SECTION 14: ORCHESTRATED DEVELOPMENT MODES
## (Precision Path — AO Backbone + Quick/Standard/Full Pre-Flight Depth)

This section defines the premium development path that combines:
- **Quick / Standard / Full** pre-flight agent depth (Section 13) for thorough analysis before any code is written
- **Structured checkpoints** so you review and approve before execution begins
- **Optional handover.md** for genuinely blind cross-model review at the end

Use this path for production code, anything you will ship, security-sensitive work, or new projects.
Use Section 13 plain modes for exploratory work, drafts, and speed-over-rigor situations.

---

### TRIGGER PHRASES

| What You Type | Mode | Pre-flight Agents |
|---|---|---|
| `orchestrated quick: [task]` | Quick + AO backbone | 4 agents |
| `orchestrated standard: [task]` | Standard + AO backbone | 6 agents |
| `orchestrated full: [task]` | Full + AO backbone | 11 agents |

To also include Tier 3 language specialists, append them to your trigger:
- `orchestrated standard: build auth API — also run typescript-reviewer`
- `orchestrated full: payment module — also run security-reviewer and java-reviewer`

---

### THE WORKFLOW

#### ══════════════════════════════════════════════
#### PHASE 1 — PRE-FLIGHT ANALYSIS (current window)
#### ══════════════════════════════════════════════

Run the agents defined by your chosen mode — Quick (4), Standard (6), or Full (11).
If you specified Tier 3 agents in the trigger, run those immediately after.
All agents run in the current window sequentially.

Output at the end of Phase 1: a complete advisory package covering plan, architecture,
test skeletons, security findings, quality gates, and any language-specific findings.

---

#### ══════════════════════════════════════════════
#### CHECKPOINT 1 — REVIEW & BLUEPRINT (mandatory human gate)
#### ══════════════════════════════════════════════

After all Phase 1 agents complete, output this exact block:

```
═══════════════════════════════════════════════════════════
✅ PHASE 1 COMPLETE — Pre-flight Analysis Done
═══════════════════════════════════════════════════════════

Mode: [QUICK / STANDARD / FULL]
Agents run: [N]
Status: [GREEN / YELLOW / RED]

Top risks identified:
1. [Risk 1]
2. [Risk 2]
3. [Risk 3]

═══════════════════════════════════════════════════════════
📋 CONTEXT BLUEPRINT (copy this if opening a new window)
═══════════════════════════════════════════════════════════
Task: [original task description]
Stack: [technology stack decisions]
Architecture: [key module boundaries and decisions]
Implementation order: [phase 1 → phase 2 → ...]
Critical constraints: [what must NOT be done]
TDD entry point: [exact first failing test to write]
Security requirements: [key findings from security scan]
Quality gates: [coverage %, function size limits, etc.]
═══════════════════════════════════════════════════════════

⏸️  REVIEW THE ANALYSIS ABOVE BEFORE PROCEEDING.

Choose your next step:
[A] Proceed to Phase 2 (Execution) in this same window
[B] Open a new window → paste the Context Blueprint above as your first message
[C] Request changes to the plan before executing
[D] Stop here — analysis is sufficient

Your choice: ___
```

Wait for user to respond before proceeding.

---

#### ══════════════════════════════════════════════
#### PHASE 2 — EXECUTION
#### ══════════════════════════════════════════════

Execute the implementation based on Phase 1 output and the Context Blueprint.

**Same window (default):** Full context of Phase 1 analysis is available.
Executor can reference any agent output from Phase 1.

**New window (user chose option B):** Executor sees only the Context Blueprint.
Cannot infer from Phase 1 conversation — must follow blueprint explicitly.
Must ask for clarification if blueprint is ambiguous rather than guessing.

Either approach is valid. New window provides stronger bias prevention.
Same window provides richer context and lower friction.

---

#### ══════════════════════════════════════════════
#### CHECKPOINT 2 — POST-EXECUTION REVIEW DECISION
#### ══════════════════════════════════════════════

After execution completes, output this exact block:

```
═══════════════════════════════════════════════════════════
✅ PHASE 2 COMPLETE — Implementation Done
═══════════════════════════════════════════════════════════

Files created/modified: [list]
Tests passing: [N/N]
Confidence: [X]%

⏸️  REVIEW THE IMPLEMENTATION ABOVE BEFORE PROCEEDING.

Choose your next step:
[A] Run Phase 3 review in this same window (fast)
[B] Request fixes before review
[C] Generate handover.md for blind cross-model review
[D] Deliver as-is — no further review needed

Your choice: ___
```

Wait for user to respond before proceeding.

---

#### ══════════════════════════════════════════════
#### PHASE 3 — CODE REVIEW
#### ══════════════════════════════════════════════

**Same window (user chose option A):**
Run the code-reviewer agent against the implementation.
Reviewer has full context of Phase 1 and Phase 2.
Fast quality check — catches obvious issues.

**Blind review via handover.md (user chose option C):**
Generate a handover.md file with the following structure:

```markdown
# Handover: Blind Code Review

## Original Task
[exact task description]

## Requirements
[all functional and non-functional requirements]

## Implementation
[full code — all files created or modified, with file paths]

## Review Instructions
You are a blind judge. You have not seen any planning, architecture discussion,
or implementation reasoning. Review the code above against the requirements only.

Evaluate:
1. Does the implementation meet all stated requirements?
2. Security vulnerabilities (OWASP Top 10 — exact vulnerable line + fix)
3. Correctness and bugs (logic errors, edge cases missed)
4. Code quality (naming, function size, error handling, test coverage)
5. Architecture concerns (will this scale? coupling issues?)

Output: structured findings with severity (CRITICAL / HIGH / MEDIUM / LOW),
exact location, and exact fix for each issue.
```

Paste this handover.md into a new chat window, or send to a different AI model entirely.
Cross-model review (e.g., Claude writes → Gemini reviews) provides the strongest blind test.

---

#### ══════════════════════════════════════════════
#### OPTIONAL PHASE 4 — SECOND BLIND REVIEW
#### ══════════════════════════════════════════════

For Full mode or high-stakes work only.

If Phase 3 reviewer found issues and fixed them, generate a second handover.md
(or use the "Fresh Perspective Simulation" prompt below) to validate the fixes
and catch anything Phase 3 missed.

**Fresh Perspective Simulation (same window, low cost):**
Ask the current AI:
> "Review your previous critique, but do so as if you were a different AI with
> different training. Focus on: what would a security expert flag that you missed?
> What architectural concerns would a principal engineer raise? What blind spots
> does your training have? Be brutally honest."

Cost: ~3–5K tokens. Effectiveness: ~40–50% of a full second cross-model review.

---

### TIER 3 LANGUAGE SPECIALISTS — OPT-IN PER PROJECT

Tier 3 agents are **not auto-fired** in any mode. They are language-specific and
irrelevant to most projects. Include them explicitly when your project uses that language.

**How to invoke:**
Append the agent name(s) to any orchestrated trigger phrase:
- `orchestrated quick: build REST API — also run typescript-reviewer`
- `orchestrated standard: auth module — also run java-reviewer and security-reviewer`
- `orchestrated full: payment service — also run kotlin-reviewer and database-reviewer`

When called, Tier 3 agents run at the end of Phase 1, after all mode agents complete.

**Available Tier 3 agents:**

| Agent | Language / Domain | When to Include |
|---|---|---|
| `typescript-reviewer` | TypeScript / JavaScript | Any `.ts`, `.tsx`, `.js` files |
| `java-reviewer` | Java / Spring Boot | Any `.java` files |
| `java-build-resolver` | Java / Maven / Gradle | Java build errors |
| `kotlin-reviewer` | Kotlin / Android / KMP | Any `.kt`, `.kts` files |
| `kotlin-build-resolver` | Kotlin / Gradle | Kotlin build errors |
| `go-reviewer` | Go | Any `.go` files |
| `go-build-resolver` | Go | Go build errors |
| `rust-reviewer` | Rust | Any `.rs` files |
| `rust-build-resolver` | Rust | Rust build errors |
| `cpp-reviewer` | C++ | Any `.cpp`, `.hpp` files |
| `cpp-build-resolver` | C++ | C++ build errors |
| `flutter-reviewer` | Flutter / Dart | Any `.dart` files |
| `healthcare-reviewer` | Healthcare / Clinical | EMR, clinical decision support, PHI |
| `pytorch-build-resolver` | PyTorch / CUDA | PyTorch training/inference crashes |

---

### ORCHESTRATION EXECUTION RULES

0. **Always output the Agent Mode Check banner (Section 13 Rule 0) before Phase 1.**
1. Run all mode agents in Phase 1 before producing Checkpoint 1 output. Never skip an agent.
2. Always output the full Checkpoint 1 block and wait for user choice before proceeding.
3. Always output the full Checkpoint 2 block and wait for user choice before proceeding.
4. If user appended Tier 3 agents to the trigger, run them at end of Phase 1, before Checkpoint 1.
5. Generate handover.md as an actual file in the workspace when user requests it (option C at Checkpoint 2).
6. Never proceed past a checkpoint without explicit user input.

---

*End of MASTER_RULES.md*
*Single source of truth for all development work*
*Update this file in GitHub → pull on each laptop to propagate changes*
