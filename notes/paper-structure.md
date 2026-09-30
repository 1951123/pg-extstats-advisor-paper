# Paper structure (Strategy B planning outline)

This is a planning artifact, not manuscript prose. The structure is
re-centered on native extended-statistics state virtualization; the old
CE-Replay centerpiece becomes historical context and a comparison point.

| Section | Purpose | Central claim | Evidence |
|---|---|---|---|
| 1 Introduction | Motivate statistics-sensitive physical design | A native-semantic what-if substrate avoids per-design materialization within a bounded scope | thesis, claims matrix |
| 2 Background | Establish extstats, native CE, and physical-design context | Problem and prior-art boundaries are explicit | supported scope, related work |
| 3 Problem and System Contract | Define fixed target, realization, budget, and capture contract | Inputs and non-claims are reproducible | contract/docs |
| 4 Hypothetical ExtStats Substrate | Explain backend-local registration/activation and native hooks | Statistics state is virtualized while CE semantics remain in PostgreSQL | patch, adapter |
| 5 Native-Semantic What-If Evaluation | Define acquisition/cache, activation, EXPLAIN, and query-level reuse | One repository supports many supported configurations without per-move ANALYZE | E1/E3 |
| 6 Advisor Search and Maintenance Constraint | Treat search as a replaceable client | Contextual local design is evaluated under fixed maintenance scope | E2, Census search |
| 7 Production-Separated Architecture | Explain capture/advice/deployment lifecycle | Stock production can be separated from offline advice | E4 |
| 8 Evaluation | Answer RQ1–RQ5 | Fidelity, bounded work, contextuality, closure, and robustness are separately evidenced | E1–E5 |
| 9 Related Work | Position the mechanism honestly | Distinction is native-state virtualization, not generic theory or search novelty | reviewer risks |
| 10 Discussion and Conclusion | State limits and implications | Claims remain within PG16.14 validated scope | non-claims/gaps |

## Evaluation layout

### 8.1 Setup and scope

Workloads, PostgreSQL 16.14, fixed target, candidate/payload states, metrics,
and realization terminology.

### 8.2 RQ1 — Native-semantic fidelity

Same-realization hypothetical/physical fidelity; separate payload drift from
semantic mismatch.

### 8.3 RQ2 — State virtualization and bounded work

One acquisition/cache, no per-move `ANALYZE`, incidence reuse, operation
counts, and exact repeatability. No speedup claim without a physical baseline.

### 8.4 RQ3 — Contextual design

Singleton signs, contextual rescues, non-monotone utility, and one
maintenance-constrained design result.

### 8.5 RQ4 — Production closure

Capture, unavailable production, offline advice, preflight, deployment,
`ANALYZE`, verification, rollback, and clean-room lifecycle.

### 8.6 RQ5 — Realization robustness

DMV M2.19/M2.20 fixed-design and design-selection evidence; robustness is not
design invariance.

## Historical material

Legacy CE-Replay IR, GreedyCover, semantic dependency machinery, old search,
and old fidelity tables remain linked evidence or appendix material. They must
not be described as the current product implementation.
