---
name: competition-jwt-claim-confusion
description: JWT / JWS / JWE 校验链与声明混淆分析。覆盖 header 解析、密钥选择、kid 处理、alg 混淆、audience/issuer 校验、角色派生与 token 到身份的混淆缺陷。当需要检查 JWT header 或 claim、密钥查找、kid 处理、alg:none 混淆、aud/iss 校验、角色 claim，或解释一个 token 如何被接受为身份或权限时使用。
---

# Competition JWT Claim Confusion

Use this skill when the decisive bug is not just "there is a JWT," but how headers, claims, and key selection turn into accepted identity.

Reply in Simplified Chinese unless the user explicitly requests English.

## Quick Start

1. Split the token path into parse, key lookup, signature or decryption, claim validation, and final acceptance.
2. Record header fields, claims, key source, issuer, audience, and role mapping before mutating anything.
3. Separate possession of a token from the exact service that accepts it.
4. Keep parser behavior, trust policy, and resulting app session or privilege in one chain.
5. Reproduce the smallest token-to-acceptance flow that proves the decisive confusion.

## Workflow

### 1. Map Header And Key Selection

- Record header fields such as `alg`, `kid`, `typ`, `cty`, `jku`, or embedded key material when present.
- Note where keys come from: static config, JWKS, local file, cache, or dynamic lookup.
- Keep token parser, key selection path, and validation mode tied together.

### 2. Prove Claim-To-Privilege Acceptance

- Show how subject, audience, issuer, tenant, scope, role, or custom claims become app session, route access, or backend privilege.
- Record expiration, not-before, clock skew, issuer matching, audience matching, and claim normalization behavior.
- Distinguish token parse success from actual authorization success.

### 3. Reduce To The Decisive JWT Path

- Compress the result to the smallest sequence: token supplied -> parser or key path taken -> claim accepted -> resulting capability.
- Keep one canonical accepted token path and one mutated token path if confusion or bypass depends on a delta.
- If the task broadens into a larger OAuth redirect chain, hand back to the tighter OAuth skill.

## Read This Reference

- Load `references/jwt-claim-confusion.md` for the header checklist, claim checklist, and evidence packaging.

## What To Preserve

- Raw headers, claims, key source, JWKS or local key path, and the accepting service
- The exact validation or normalization step that turns the token into accepted identity
- One minimal replayable token-to-acceptance sequence
