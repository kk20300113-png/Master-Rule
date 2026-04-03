# MASTER_RULES.md
# Universal Development Standard â€” All Projects, All Tools, All Laptops
# GitHub Repository: github.com/[your-username]/master-rules
# Last Updated: March 2026
# Owner: Koo â€” Non-technical AI venture builder, Singapore
#
# VS Code: auto-loaded via settings.json codeGeneration.instructions
# Claude Code: auto-loaded via CLAUDE.md
# Gemini CLI: auto-loaded via GEMINI.md
# On-demand (any tool): type "apply master rules" to re-activate

---

## â–¶ CONFIRMATION PHRASE (Mandatory â€” No Exceptions)

When you have finished reading this entire file, your FIRST response
must begin with exactly this block before addressing any task:

```
â•”â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—
â•‘  MASTER_RULES LOADED                         â•‘
â•‘  Project    : [project name or directory]    â•‘
â•‘  Checkpoint : [last Plans.md entry, or       â•‘
â•‘               "No Plans.md â€” creating now"]  â•‘
â•‘  Guardrails : Planning | Security |          â•‘
â•‘               Context | Client-Safety        â•‘
â•‘  ECC Skills : [installed / not installed]    â•‘
â•‘  Agent Mode : [Agent âœ¦ / Ask / Edit]         â•‘
â•‘  Status     : READY                          â•‘
â•šâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
```

âš ï¸  If Agent Mode shows Ask or Edit â€” remind the user:
"Switch to Agent mode (âœ¦ icon in chat input) before running autofire
 pipelines. Ask/Edit = role-play only. Agent mode = real sub-agents."

If this block does not appear, the rules did not load.
I will ask you to read this file again before anything proceeds.

---

## SECTION 2: MANDATORY TASK LIFECYCLE
## (Every Task, Every Session, Every Tool)

Every piece of work â€” no matter how small â€” follows this sequence.
This is not optional. This is the operating standard.

```
â”Œâ”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”
â”‚  TASK LIFECYCLE (apply to everything)               â”‚
â”‚                                                     â”‚
â”‚  1. PLAN      â†’ Write plan, wait for confirmation  â”‚
â”‚  2. BUILD     â†’ Execute only what plan specifies   â”‚
â”‚  3. REVIEW    â†’ Code review + security check       â”‚
â”‚  4. VERIFY    â†’ Test, validate, confirm it works   â”‚
â”‚  5. RELEASE   â†’ Client check if going external     â”‚
â”‚  6. CLOSE     â†’ Update Plans.md, end session clean â”‚
â””â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”˜
```

---

## SECTION 3: PLANNING RULES (No Code Without a Plan)

### Rule P1 â€” Mandatory Plan Block
Before writing any code, creating any file, or making any structural
change â€” output this block and wait for my confirmation:

```
â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”
PLAN
Task        : [what we are building]
Why         : [what problem this solves]
Approach    : [3 sentences on how]
Files       : [which files created or changed]
Reversible  : [YES / NO â€” if NO, explain and wait]
Steps       : [estimated number of steps]
Risk        : [any flag â€” security, data loss, client impact]
â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”
Proceed? (waiting for confirmation)
```

I must say "proceed" or "yes" before any work begins.
If I say "just do it" â€” remind me of this rule once, then ask again.
This rule exists because planning prevents rebuilding.

### Rule P2 â€” Plans.md as Session Memory
- Session start: check for Plans.md. If it exists, read it and state
  the last checkpoint before doing anything else.
- If Plans.md does not exist: create it immediately, before any task.
- Session end: update Plans.md with:
  - What was completed this session
  - What is in progress and its current state
  - The exact next step for the next session (one sentence, specific)
  - Any decisions made that affect future direction

### Rule P3 â€” Ask, Do Not Assume
If direction, architecture, or intent is unclear â€” stop and ask.
One clarifying question costs 30 seconds. A wrong build costs hours.
Present the question as A / B / C options where possible.

---

## SECTION 4: BUILD RULES (Execution Standards)

### Rule B2 â€” Incremental, Not Monolithic
Build in small, verifiable steps. After each step:
- State what was just built
- Confirm it works
- State the next step
Do not build everything at once and present a finished result.
I need to see and approve each logical step.

### Rule B3 â€” No Silent Deviations
If the build reveals the plan needs to change â€” stop, state what
changed and why, propose the revised approach, and wait for
confirmation before proceeding differently.

---

## SECTION 8: CLIENT-FACING RULES

### Rule CF1 â€” Pre-Client Checklist (Run Before Any External Share)
```
CLIENT-READY CHECK
[ ] No internal notes, TODOs, or placeholder text visible
[ ] No API keys, credentials, or internal endpoints exposed
[ ] All data and figures are sourced â€” no generated statistics
[ ] Language is senior professional â€” institutional, not casual
[ ] Tone appropriate for: energy / petrochemicals / commodities
[ ] Security review completed (AgentShield or manual S-rules)
[ ] Factual claims verifiable â€” nothing from model memory alone
Cleared for client: YES / NO
If NO: state specifically what blocks clearance
```

### Rule CF2 â€” No Hallucinated Data
For client-facing output:
- Never generate market prices, volumes, or statistics from memory
- If a number is needed but unverified, write:
  `[PLACEHOLDER â€” verify with live source before sending]`
- Never present a claim as fact without a source or caveat

### Rule CF3 â€” Professional Tone Standard
My clients are senior executives at institutions like Petronas,
Trafigura, ADNOC, BASF, and TotalEnergies.
The standard question: would this be credible shown to that audience?
If not, it is not ready. Flag it and propose a revision.

---

## SECTION 10: SESSION RULES

### Rule SD1 â€” Session Start (Every Time, Every Tool)
1. Output the CONFIRMATION PHRASE from the top of this file
2. Check for Plans.md â€” state the last checkpoint
3. State what the session is for today
4. Confirm guardrails and active skill stack

### Rule SD2 â€” Session End (Every Time, Every Tool)
1. Update Plans.md: completed, in-progress, exact next step
2. Flag any unresolved decisions or blockers
3. Confirm no secrets or sensitive data are exposed
4. Suggest /compact if context is above 40%
5. State: "Session closed. Plans.md updated."

### Rule SD3 â€” The Override Rule
If I ask to skip any rule "just this once":
1. Name the rule being skipped
2. State what risk that rule protects against
3. Ask: "Confirm you want to proceed despite this risk?"
Do not silently comply with requests to bypass guardrails.

---

## SECTION 11: WHO I AM â€” CONTEXT FOR ALL AGENTS

I am a non-technical builder and director. I do not write code.
I direct AI agents to build products on my behalf.

**Communication standards â€” apply in every session:**
- Give me decisions to make, not code to read line by line
- After every significant action: state what happened and what is next
- Present options as A / B / C with a clear recommendation and reason
- Flag risks and tradeoffs â€” never hide complexity from me
- Use energy, commodities, and AI venture context in all examples
- Domain context: I build tools for LNG, carbon credits, commodity
  intelligence, and client engagement in APAC energy markets

**My quality standard**: Would this output be credible if presented
to a senior executive at Petronas, Trafigura, ADNOC, or BASF?
If not â€” it is not ready. Revise before presenting.

---

## SECTION 13: AUTOFIRE PIPELINE COMMANDS
## (Source of Truth for All Tools â€” VS Code, Claude Code CLI, Gemini CLI, Any Session)

This section defines the complete autofire pipeline system. Any tool that has loaded this
file MUST recognise and execute these trigger phrases immediately, without asking for
clarification. The user's task description is whatever they write after the trigger phrase.

### HOW AUTOFIRE WORKS
- Trigger phrase is detected â†’ pipeline fires immediately
- Each agent is executed sequentially, labelled with agent name and number
- No agent is skipped
- The full output of each agent feeds the next agent's context
- A final summary report is always produced at the end

---

### COMPLEXITY MODES â€” CHOOSE YOUR PIPELINE DEPTH

Choose the mode that matches your task. TDD Guide always runs at full depth in all modes.

| Mode | Agents | Trigger | Approx. Time | Use For |
|------|--------|---------|--------------|---------|
| Quick | 4 | `quick mode: [task]` | ~3â€“6 min | Bug fixes, small features, single modules |
| Standard | 6 | `standard mode: [task]` | ~8â€“14 min | Full features, security work, APIs |
| Full | 11 | `full mode: [task]` | ~18â€“28 min | New projects, pre-deployment, critical systems |

---

### QUICK MODE PIPELINE â€” 4 AGENTS

TRIGGER PHRASES (recognise any of these):
- `quick mode:`
- `quick pipeline:`
- `run quick mode`

ACTION â€” execute these 4 agents in order:

**AGENT 1 â€” PLANNER**
Phased implementation plan. Technology stack with rationale. Build order and
dependency graph. Risk table with mitigations. One clarifying question if a
critical assumption is unclear.

**AGENT 2 â€” ARCHITECT**
ASCII system architecture diagram. Module boundary definitions. Python dataclass
interface contracts for every module boundary. Technology trade-off rationale.
Scalability path v1 â†’ v2 â†’ v3.

**AGENT 3 â€” TDD GUIDE** (FULL DEPTH â€” no shortcuts)
Full test file skeletons for every module (pytest). conftest.py with shared
fixtures. Mock strategy: what to mock vs test directly. pytest.ini with
--cov-fail-under=80. Build and test order. The exact first failing test to write.

**AGENT 4 â€” CODE REVIEWER**
Pre-implementation quality checklist. Max function and file length. Error
handling completeness requirements. Logging requirements. CRITICAL and HIGH
finding criteria for this specific project.

END WITH:
- Status: GREEN (proceed) / YELLOW (caution) / RED (stop)
- Top 2 risks
- First file to implement (full path)
- First test to write (exact function name)

---

### TIER 1 PIPELINE â€” 6 AGENTS  â† also triggered as STANDARD MODE

TRIGGER PHRASES (recognise any of these, in any form):
- `standard mode:`
- `autofire tier 1`
- `fire tier 1 agents`
- `run tier 1 pipeline`
- `refer to master rules autofire tier 1`
- `tier 1 autofire`

ACTION â€” execute these 6 agents in order:

**AGENT 1 â€” PLANNER**
Phased implementation plan. Technology stack with rationale. Build order and
dependency graph. Risk table with mitigations. One clarifying question if a
critical assumption is unclear.

**AGENT 2 â€” ARCHITECT**
ASCII system architecture diagram. Module boundary definitions. Python dataclass
interface contracts for every module boundary. Technology trade-off rationale.
Scalability path v1 â†’ v2 â†’ v3.

**AGENT 3 â€” TDD GUIDE**
Full test file skeletons for every module (pytest). conftest.py with shared
fixtures. Mock strategy: what to mock vs test directly. pytest.ini with
--cov-fail-under=80. Build and test order. The exact first failing test to write.

**AGENT 4 â€” SECURITY REVIEWER**
Scan for SSRF, command injection, prompt injection, SQL injection, secrets
exposure, missing input validation. For each finding: severity level, vulnerable
pattern, exact replacement code.

**AGENT 5 â€” PYTHON REVIEWER**
Top 5 anti-patterns to avoid with bad/good examples. Required type hint
conventions. Naming conventions. Import organization rules. Consistent error
handling pattern for this codebase.

**AGENT 6 â€” CODE REVIEWER**
Pre-implementation quality checklist. Max function and file length. Error
handling completeness requirements. Logging requirements. CRITICAL and HIGH
finding criteria for this specific project.

END WITH:
- Status: GREEN (proceed) / YELLOW (caution) / RED (stop)
- Top 3 risks
- First file to implement (full path)
- First test to write (exact function name)

---

### TIER 1 + TIER 2 PIPELINE â€” 11 AGENTS  â† also triggered as FULL MODE

TRIGGER PHRASES (recognise any of these, in any form):
- `full mode:`
- `autofire tier 2`
- `autofire tier 1 and tier 2`
- `fire all agents`
- `run full pipeline`
- `refer to master rules autofire tier 1 and tier 2`
- `full agent pipeline`

ACTION â€” execute all 6 Tier 1 agents above, THEN these 5 additional agents:

**AGENT 7 â€” DATABASE REVIEWER**
Schema design: correct data types, constraints, primary/foreign keys. Index
strategy: which columns need indexes and why. SQL query review for N+1 risks
and full table scans. Connection management: pooling, timeout, concurrency.
Data integrity rules enforced at database level.

**AGENT 8 â€” PERFORMANCE OPTIMIZER**
Top 3 performance bottlenecks most likely in production. Caching opportunities:
what to cache, TTL strategy, which library. Memory management risks for large
inputs. Batching opportunities. API call deduplication and pre-fetching.

**AGENT 9 â€” E2E RUNNER**
Top 3-5 critical user journeys to test end-to-end. Test skeleton for each
critical journey. Happy path test structure. Error path test structure (invalid
input, API down, output failure). CI integration: where E2E tests run and what
blocks deployment.

**AGENT 10 â€” REFACTOR CLEANER**
Top 5 patterns that create dead code in projects like this. Cleanup checklist
to run at end of each phase. Duplication risks and where duplicate logic grows.
Dependency hygiene: avoiding unused packages. Refactor milestones per phase.

**AGENT 11 â€” DOC UPDATER**
README structure for this project (exact sections). .env.example file contents
based on all secrets and config identified in the pipeline. Codemap plan for
docs/ folder. Setup guide outline for new developers. Documentation update
checklist per phase.

END WITH:
- Project Readiness Score: X/10
- Status: GREEN / YELLOW / RED
- Complete implementation checklist ordered by phase
- Top 5 risks ranked by probability Ã— impact
- Definition of Done for each phase
- First action: the exact first thing to do right now

---

### AUTOFIRE EXECUTION RULES (ALL TOOLS)
0. **AGENT MODE CHECK â€” Output this banner before every pipeline, no exceptions:**
   ```
   âš ï¸  AGENT MODE CHECK
   Are you in Agent mode (âœ¦) in VS Code Copilot Chat?
   â€¢ Agent mode  â†’ real sub-agents, full file access, faster execution
   â€¢ Ask/Edit mode â†’ role-play only, no file access, 10-20x slower
   To switch: click the mode selector at bottom-left of the chat input â†’ select Agent (âœ¦)
   Pipeline starting now â€” switch mode first for best results.
   ```
1. Never ask for clarification before starting â€” begin immediately on trigger
2. Never skip an agent â€” all agents must run in order
3. Label every agent section clearly: `## AGENT N â€” [AGENT NAME]`
4. Feed previous agent output into next agent's context
5. Always produce the final summary report
6. If context is running low, compress earlier sections but complete all agents

---

## SECTION 14: ORCHESTRATED DEVELOPMENT MODES
## (Precision Path â€” AO Backbone + Quick/Standard/Full Pre-Flight Depth)

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
- `orchestrated standard: build auth API â€” also run typescript-reviewer`
- `orchestrated full: payment module â€” also run security-reviewer and java-reviewer`

---

### THE WORKFLOW

#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
#### PHASE 1 â€” PRE-FLIGHT ANALYSIS (current window)
#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

Run the agents defined by your chosen mode â€” Quick (4), Standard (6), or Full (11).
If you specified Tier 3 agents in the trigger, run those immediately after.
All agents run in the current window sequentially.

Output at the end of Phase 1: a complete advisory package covering plan, architecture,
test skeletons, security findings, quality gates, and any language-specific findings.

---

#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
#### CHECKPOINT 1 â€” REVIEW & BLUEPRINT (mandatory human gate)
#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

After all Phase 1 agents complete, output this exact block:

```
â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
âœ… PHASE 1 COMPLETE â€” Pre-flight Analysis Done
â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

Mode: [QUICK / STANDARD / FULL]
Agents run: [N]
Status: [GREEN / YELLOW / RED]

Top risks identified:
1. [Risk 1]
2. [Risk 2]
3. [Risk 3]

â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
ðŸ“‹ CONTEXT BLUEPRINT (copy this if opening a new window)
â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
Task: [original task description]
Stack: [technology stack decisions]
Architecture: [key module boundaries and decisions]
Implementation order: [phase 1 â†’ phase 2 â†’ ...]
Critical constraints: [what must NOT be done]
TDD entry point: [exact first failing test to write]
Security requirements: [key findings from security scan]
Quality gates: [coverage %, function size limits, etc.]
â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

â¸ï¸  REVIEW THE ANALYSIS ABOVE BEFORE PROCEEDING.

Choose your next step:
[A] Proceed to Phase 2 (Execution) in this same window
[B] Open a new window â†’ paste the Context Blueprint above as your first message
[C] Request changes to the plan before executing
[D] Stop here â€” analysis is sufficient

Your choice: ___
```

Wait for user to respond before proceeding.

---

#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
#### PHASE 2 â€” EXECUTION
#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

Execute the implementation based on Phase 1 output and the Context Blueprint.

**Same window (default):** Full context of Phase 1 analysis is available.
Executor can reference any agent output from Phase 1.

**New window (user chose option B):** Executor sees only the Context Blueprint.
Cannot infer from Phase 1 conversation â€” must follow blueprint explicitly.
Must ask for clarification if blueprint is ambiguous rather than guessing.

Either approach is valid. New window provides stronger bias prevention.
Same window provides richer context and lower friction.

---

#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
#### CHECKPOINT 2 â€” POST-EXECUTION REVIEW DECISION
#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

After execution completes, output this exact block:

```
â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
âœ… PHASE 2 COMPLETE â€” Implementation Done
â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

Files created/modified: [list]
Tests passing: [N/N]
Confidence: [X]%

â¸ï¸  REVIEW THE IMPLEMENTATION ABOVE BEFORE PROCEEDING.

Choose your next step:
[A] Run Phase 3 review in this same window (fast)
[B] Request fixes before review
[C] Generate handover.md for blind cross-model review
[D] Deliver as-is â€” no further review needed

Your choice: ___
```

Wait for user to respond before proceeding.

---

#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
#### PHASE 3 â€” CODE REVIEW
#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

**Same window (user chose option A):**
Run the code-reviewer agent against the implementation.
Reviewer has full context of Phase 1 and Phase 2.
Fast quality check â€” catches obvious issues.

**Blind review via handover.md (user chose option C):**
Generate a handover.md file with the following structure:

```markdown
# Handover: Blind Code Review

## Original Task
[exact task description]

## Requirements
[all functional and non-functional requirements]

## Implementation
[full code â€” all files created or modified, with file paths]

## Review Instructions
You are a blind judge. You have not seen any planning, architecture discussion,
or implementation reasoning. Review the code above against the requirements only.

Evaluate:
1. Does the implementation meet all stated requirements?
2. Security vulnerabilities (OWASP Top 10 â€” exact vulnerable line + fix)
3. Correctness and bugs (logic errors, edge cases missed)
4. Code quality (naming, function size, error handling, test coverage)
5. Architecture concerns (will this scale? coupling issues?)

Output: structured findings with severity (CRITICAL / HIGH / MEDIUM / LOW),
exact location, and exact fix for each issue.
```

Paste this handover.md into a new chat window, or send to a different AI model entirely.
Cross-model review (e.g., Claude writes â†’ Gemini reviews) provides the strongest blind test.

---

#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
#### OPTIONAL PHASE 4 â€” SECOND BLIND REVIEW
#### â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

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

Cost: ~3â€“5K tokens. Effectiveness: ~40â€“50% of a full second cross-model review.

---

### TIER 3 LANGUAGE SPECIALISTS â€” OPT-IN PER PROJECT

Tier 3 agents are **not auto-fired** in any mode. They are language-specific and
irrelevant to most projects. Include them explicitly when your project uses that language.

**How to invoke:**
Append the agent name(s) to any orchestrated trigger phrase:
- `orchestrated quick: build REST API â€” also run typescript-reviewer`
- `orchestrated standard: auth module â€” also run java-reviewer and security-reviewer`
- `orchestrated full: payment service â€” also run kotlin-reviewer and database-reviewer`

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
*Update this file in GitHub â†’ pull on each laptop to propagate changes*
