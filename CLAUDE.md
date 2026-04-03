# CLAUDE.md
# Auto-fire file for Claude Code terminal
# This file is automatically read by Claude Code at every session start.
# It points to MASTER_RULES.md as the single source of truth.
#
# PLACEMENT: Copy this file to ~/.claude/CLAUDE.md (global)
# This makes it fire for EVERY project on this laptop automatically.

---

Read MASTER_RULES.md from the current project root before doing anything.

If MASTER_RULES.md is not present in the current project root,
read it from: ~/master-rules/MASTER_RULES.md

After reading, output the CONFIRMATION PHRASE defined at the top
of MASTER_RULES.md before responding to any task.

Apply all rules in MASTER_RULES.md for the entire duration of this session.
Do not wait to be reminded. Do not skip rules because a task seems small.

AUTOFIRE PIPELINE: When the user invokes any autofire tier 1 or tier 2 trigger
phrase, execute the pipeline exactly as defined in SECTION 13 of MASTER_RULES.md.
Do not ask for clarification. Begin immediately.

In Claude Code CLI, agents (planner, architect, tdd-guide, security-reviewer,
python-reviewer, code-reviewer, database-reviewer, performance-optimizer,
e2e-runner, refactor-cleaner, doc-updater) are available as real subagents via
the Task tool. When autofiring, spawn them as parallel Task calls where possible
for maximum speed. Fall back to sequential if parallel is not available.
