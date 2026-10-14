---
name: competition-k8s-control-plane
description: Kubernetes 控制面安全分析。覆盖 K8s API 权限、ServiceAccount 信任、RBAC 边、admission 与 controller 行为、集群密钥、工作负载变更与 namespace 范围漂移。当需要检查 kube API 权限、service-account token、RoleBinding/ClusterRoleBinding 边、admission webhook、controller 创建的 pod、密钥暴露，或解释线上工作负载为何与 manifest 不一致时使用。
---

# Competition K8s Control Plane

Use this skill when the decisive path runs through Kubernetes control-plane state, API permissions, or controller behavior rather than a single container's runtime alone.

Reply in Simplified Chinese unless the user explicitly requests English.

## Quick Start

1. Separate manifest intent from live cluster state: API objects, mutations, controllers, secrets, and resulting workloads.
2. Identify the active principal first: service account, kubeconfig identity, node credential, webhook, or controller.
3. Map the smallest control-plane edge to its workload effect.
4. Keep RBAC, service accounts, owner references, namespace boundaries, and secret consumers in compact evidence blocks.
5. Reproduce the smallest cluster action that yields the decisive workload or secret effect.

## Workflow

### 1. Map The API Trust Path

- Record namespaces, service accounts, Roles, ClusterRoles, bindings, admission hooks, controllers, and the resources they can mutate.
- Distinguish read access, create access, patch access, exec access, and secret access.
- Keep principal, verb, resource, namespace, and resulting object in one chain.

### 2. Trace Mutation To Workload State

- Show how an API action becomes a pod, volume mount, secret exposure, env injection, job run, or controller-created artifact.
- Compare checked-in YAML against live objects after defaulting, admission mutation, or controller reconciliation.
- Distinguish pod-runtime behavior from cluster-level mutation logic.

### 3. Reduce To The Decisive Cluster Path

- Compress the result to the smallest chain: principal -> API permission -> mutated object -> resulting workload, secret, or route effect.
- Keep kube objects, live describes, and consumed secret or config paths tied to the same namespace and controller.
- If the problem narrows down to one container's mount or runtime deviation, switch back to the tighter container-runtime skill.

## Read This Reference

- Load `references/k8s-control-plane.md` for the RBAC checklist, controller checklist, and evidence packaging.
- If the hard part is metadata-service reachability, workload identity, instance credentials, or metadata-derived privilege, prefer `$competition-cloud-metadata-path`.

## What To Preserve

- Namespace, service account, verb, resource kind, RoleBinding or ClusterRoleBinding, and owner reference chains
- Admission mutations, generated workloads, mounted secrets, and controller-produced drift
- The exact API action or object diff that creates the decisive effect
