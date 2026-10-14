---
name: competition-file-parser-chain
description: 文件上传/导入/解析链分析。覆盖上传、导入、预览、解压、格式转换、解析器调用与反序列化链。当需要检查上传或导入路径、追踪压缩包解压、预览或转换行为、解释文件如何抵达解析器或反序列化点，或把单个上传物连到后端关键效果时使用。
---

# Competition File Parser Chain

Use this skill when the hard part is following a file from ingress through every parser, extractor, converter, or deserializer boundary that matters.

Reply in Simplified Chinese unless the user explicitly requests English.

## Quick Start

1. Preserve the original upload and every derived artifact separately.
2. Map the chain in order: ingress, temp storage, archive extraction, format conversion, parser call, deserialization, and final consumer.
3. Record filenames, MIME guesses, extensions, temp paths, and parser choices before mutating anything.
4. Separate client-visible validation from backend parser behavior.
5. Reproduce the smallest file-processing chain that yields the decisive branch or artifact.

## Workflow

### 1. Map File Ingress And Derivation

- Record request shape, multipart names, content type, filename, temp paths, upload staging, and storage keys.
- Note every derived artifact: extracted archive member, converted preview, generated thumbnail, temp document, or deserialized object.
- Keep original file and each derivative labeled separately.

### 2. Trace Parser And Conversion Boundaries

- Show which parser, converter, extractor, or deserializer runs at each step.
- Record parser-specific decisions driven by extension, MIME, magic bytes, schema, archive member names, or embedded metadata.
- Distinguish parsing success, preview success, conversion success, and business-logic acceptance.

### 3. Reduce To The Decisive File Chain

- Compress the result to the smallest sequence: upload -> derived artifact -> parser boundary -> resulting effect.
- State clearly whether the decisive weakness lives in archive handling, MIME inference, file conversion, path resolution, or deserialization.
- If the chain becomes mostly a generic async worker problem after enqueue, hand off to the tighter queue or worker skill.

## Read This Reference

- Load `references/file-parser-chain.md` for the ingress checklist, parser checklist, and evidence packaging.

## What To Preserve

- Original uploads, derived files, temp paths, storage keys, parser names, and conversion steps
- The exact boundary where backend behavior diverges from user-visible validation
- One minimal replayable file-processing sequence that reaches the decisive effect
