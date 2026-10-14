---
name: competition-supply-chain
description: CI/CD 与软件供应链安全分析。覆盖流水线、制品库、依赖漂移、制品溯源、镜像构建、发布流程与运行时消费方。当需要追踪依赖漂移、registry 拉取、恶意包、构建或发布篡改、CI 执行、制品签名，或确认线上实际消费的是哪个出厂制品时使用。
---

# Competition Supply Chain

Use this skill when the challenge is really about provenance, dependency drift, build output, release flow, or what runtime artifact actually got shipped.

Reply in Simplified Chinese unless the user explicitly requests English.

## Quick Start

1. Split the problem into source, dependency resolution, build, packaging, publish, and runtime consumption.
2. Decide where the first divergence occurs between intended artifact and runtime artifact.
3. Keep provenance as a compact chain, not a scattered set of observations.
4. Reproduce the smallest possible build or package path that still shows the issue.
5. Separate checked-in intent from what the pipeline actually emitted.

## Workflow

### 1. Trace Provenance End-To-End

- Map source checkout, lockfiles, dependency fetch, pre/post-install steps, build scripts, packaging, publish target, and runtime consumer.
- Compare declared version, resolved version, and shipped artifact.
- Note registry, cache, mirror, or CI environment differences.

### 2. Reconcile Build-Time And Runtime

- Compare manifests with image layers, mounted secrets, generated files, and runtime hooks.
- Identify whether the decisive mutation happens in dependency install, build step, publish step, or runtime bootstrap.

### 3. Report The Break Point

- State the earliest point where provenance diverges.
- Keep evidence in one short chain from source to runtime consumer.

## Read This Reference

- Load `references/supply-chain.md` for the provenance checklist, evidence packaging, and common pipeline failure modes.

## What To Preserve

- Declared dependency, resolved dependency, and runtime artifact versions
- CI step names, registry pulls, artifact hashes, and image or package layers
- The runtime consumer that actually accepts or executes the artifact
