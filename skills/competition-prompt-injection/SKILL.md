---
name: competition-prompt-injection
description: 提示注入与 Agent 链安全分析。覆盖 prompt injection、检索投毒、记忆污染、planner 漂移、MCP/工具边界滥用与 agent 数据外泄。当需要分析提示注入、检索投毒、记忆污染、planner 漂移、工具参数篡改，或由 agent 链导致的密钥泄露时使用。
---

# Competition Prompt Injection

Use this skill when the challenge is primarily about trust boundaries inside an agentic system.

Reply in Simplified Chinese unless the user explicitly requests English.

## Quick Start

1. Identify the first untrusted content that becomes model-visible.
2. Map the chain from retrieval, memory, or transcript into planner or executor behavior.
3. Record the exact point where text becomes a tool argument, file path, network target, or secret request.
4. Prove one minimal exploit chain before exploring variants.
5. Keep prompt snippets and tool transitions in compact evidence blocks.

## Workflow

### 1. Map The Control Stack

- Track system, developer, user, retrieved, memory, planner, and tool-response layers separately.
- Distinguish claimed capability from runtime-exposed capability.
- Note what the model can actually call, read, or mutate.

### 2. Prove The Boundary Crossing

- Reproduce one chain from untrusted text to changed planner behavior, changed tool args, or secret exposure.
- Keep the decisive transcript compact: source chunk, rewritten planner state, final tool invocation.
- Prefer the smallest transcript that still demonstrates the bug.

### 3. Report By Boundary

- State which layer failed: retrieval, summarizer, planner, executor, tool normalization, or output post-processing.
- Separate instruction drift from actual side effect.

## Read This Reference

- Load `references/prompt-injection.md` for the checklist, evidence layout, and common prompt-boundary pitfalls.

## What To Preserve

- Original malicious chunk or prompt
- Intermediate summary or planner drift if it matters
- Final tool args, file paths, or exposed secret surface
