---
name: competition-ssrf-metadata-pivot
description: SSRF 可达性与云凭据枢轴分析。覆盖 SSRF 触达性、内网路由探测、元数据服务访问、凭据枢轴与 token 到权限的信任链。当需要追踪 SSRF 来源、内网主机、元数据端点、link-local token、服务账号凭据，或解释服务端取数边如何转化为可接受的访问时使用。
---

# Competition SSRF Metadata Pivot

Use this skill when the decisive path runs through server-side request capability, internal service reachability, or metadata-derived credentials.

Reply in Simplified Chinese unless the user explicitly requests English.

## Quick Start

1. Separate the SSRF source, forwarding layer, reachable target, and accepted downstream credential edge.
2. Record request method, URL construction, header behavior, redirects, DNS or host overrides, and response shaping before mutation.
3. Map internal host, metadata endpoint, token extraction, and accepting service as one chain.
4. Distinguish read-only reachability from credential-bearing access.
5. Reproduce the smallest SSRF-to-accepted-access path.

## Workflow

### 1. Map SSRF Reachability

- Record source primitive: URL parameter, webhook, image fetcher, importer, proxy endpoint, or backend callback.
- Note normalization steps: scheme filtering, host allowlists, redirects, DNS resolution, path rewrite, and header injection.
- Keep target host, protocol, and response behavior tied to the exact SSRF source.

### 2. Trace Metadata And Credential Pivot

- Show whether metadata endpoints, internal control APIs, or workload identity services are reachable.
- Record token fields, role scope, service account, expiration, and where the token is accepted.
- Distinguish credential extraction success from accepted privilege at a downstream service.

### 3. Reduce To Decisive SSRF Chain

- Compress to: SSRF source -> internal or metadata target -> credential or sensitive response -> accepted replay or API access.
- State whether the decisive edge is parser bypass, allowlist bypass, redirect abuse, header confusion, or metadata trust.
- If the task becomes mostly cloud identity policy analysis, hand off to the tighter cloud metadata skill.

## Read This Reference

- Load `references/ssrf-metadata-pivot.md` for SSRF checklists, metadata pivots, and evidence packaging.

## What To Preserve

- SSRF source point, URL construction rules, reachable hosts, and response deltas
- Extracted token or credential fields, scope, and accepting service
- One minimal SSRF-to-accepted-access replay path
