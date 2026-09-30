# Frozen research questions and evidence map — Strategy B

Paths point to authoritative tracked artifacts in the system repository; this
paper repository does not copy experiment trees.

## RQ1 — Native-semantic what-if fidelity

**Question.** Within the fixed PostgreSQL 16.14 single-relation MCV/FD
fragment, does the backend-local substrate reproduce native hypothetical and
physical estimates under one persisted realization?

**Evidence.** DMV M2.18
`experiments/dmv-m2-18-frozen-hyp-vs-physical/` and Census M2.21
`physical-validation.json`/`replay-determinism.json`: exact payload,
ordinary-statistics, estimate-vector, and q-error gates for the tested states.

**Limitations.** Same-realization fidelity only; no joins, arbitrary
mechanisms, arbitrary PostgreSQL versions, or future native-`ANALYZE` payload
equality.

## RQ2 — State virtualization and bounded evaluation work

**Question.** Can one fixed native payload realization evaluate many supported
hypothetical configurations without per-design `ANALYZE`, while conservative
query-level incidence reuse preserves exact move outcomes?

**Evidence.** Census M2.21 search/repeat artifacts and the native adapter,
evaluator, and overlay code. The authoritative run records 19,210 conceptual
and feasible moves, 16,769 native evaluations, 88,654 planner calls, and an
exact repeated trajectory.

**Limitations.** These are operation counts and correctness evidence, not a
physical-per-design wall-clock speedup. Reuse stops at query granularity.

## RQ3 — Contextual physical design

**Question.** Do native statistics interactions make singleton utility
insufficient, and can contextual evaluation find a maintenance-feasible local
design?

**Evidence.** Census M2.21 singleton/search artifacts and DMV M2.20
contextual-rescue evidence, with fixed target and bounded deterministic
ADD-only product search.

**Limitations.** Fixed workload/target, supported catalog, and local search;
no global-optimality or universal pruning theorem.

## RQ4 — Production-separated closure

**Question.** Can stock PostgreSQL capture a sealed bundle that supports
offline advice, DBA-controlled deployment, and post-deployment/rollback
verification?

**Evidence.** M2.31/M2.32 lifecycle artifacts and M2.33 clean-room
`build-provenance.json`/`lifecycle-summary.json`.

**Limitations.** Capture bundles do not contain payload bytes; security,
automatic deployment, byte reproducibility, and universal portability are not
claimed.

## RQ5 — Statistics-realization robustness

**Question.** How do fixed designs and selected designs behave across
independent persisted/native statistics realizations?

**Evidence.** DMV M2.19 (ten fresh native realizations for one fixed design)
and M2.20 (five persisted samples and complete cross-evaluation matrix).

**Limitations.** DMV-only robustness evidence; not native-sample equivalence,
temporal/schema drift robustness, or invariant selected identities.

## Superseded RQ mapping

The former RQ1–RQ4 map centered CE-Replay objective/dependency oracles and
query-internal semantic incrementality. That map is retained in repository
history; the current map reassigns the primary question to native-state
virtualization and treats query-level reuse as a bounded implementation
question.
