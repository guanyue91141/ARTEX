---
name: competition-race-condition-state-drift
description: 竞态条件与状态漂移分析。覆盖竞态窗口、时序缺陷、幂等性失效、锁缺口、并发 worker 漂移与产生关键效果的状态不一致。当需要复现时序敏感缺陷、并发状态损坏、重复操作、陈旧读取，或由请求顺序引发的权限/余额漂移时使用。
---

# Competition Race Condition State Drift

Use this skill when the decisive behavior depends on request timing, async ordering, lock gaps, or stale state.

Reply in Simplified Chinese unless the user explicitly requests English.

## Quick Start

1. Identify mutable state first: rows, cache keys, queue payloads, session fields, counters, or files.
2. Reproduce with smallest concurrent sequence and fixed timing assumptions.
3. Capture one baseline run and one racing run with only one variable changed.
4. Track read, check, write, enqueue, and commit boundaries separately.
5. Prove final state drift from a clean reset.

## Workflow

### 1. Map Mutable Boundaries

- Record transaction scope, lock behavior, retry logic, idempotency keys, cache invalidation, and queue handoff.
- Note where read-check-write is split across requests, workers, or services.
- Keep each boundary tied to exact timestamps or sequence numbers.

### 2. Reproduce Timing Window

- Build deterministic concurrent inputs with controlled delay, duplicate requests, or reordered worker execution.
- Compare accepted and rejected paths under identical payloads.
- Record which condition flips when ordering changes.

### 3. Reduce To Decisive Race Chain

- Compress to: request A and B ordering -> stale check or lock gap -> conflicting writes -> resulting capability or artifact.
- State whether root cause is missing lock, weak idempotency, stale cache read, delayed async commit, or retry side effect.
- If the path becomes queue-dominant, hand off to queue worker drift skill.

## Read This Reference

- Load `references/race-condition-state-drift.md` for race harness ideas, evidence blocks, and parity checks.

## What To Preserve

- Mutable keys, transaction boundaries, lock behavior, and idempotency markers
- Timestamped or sequenced traces for baseline and race runs
- One minimal replayable concurrent sequence proving drift
