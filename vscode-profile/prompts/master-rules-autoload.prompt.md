---
name: MASTER_RULES Session Init
description: "Manual session initialization helper. Use when you want to read MASTER_RULES.md and print the confirmation block at the start of a chat."
agent: agent
argument-hint: "Optional session note"
---

Read and apply `C:\Users\kahye\master-rules\MASTER_RULES.md`.

After reading, output the confirmation phrase defined at the top of that file.

Then confirm:
- MASTER_RULES are active for this chat.
- The user-profile orchestration router is installed.
- Real subagent pipelines are available in Agent mode only.

Optional note from the user:

{{task}}

