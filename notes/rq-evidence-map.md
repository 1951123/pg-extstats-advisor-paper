# Frozen research questions and evidence map

The paper freezes four top-level questions and the substructure below. Paths
point to authoritative tracked artifacts; this repository does not copy the
experiment directories.

## RQ1 — Semantic fidelity

**Question.** Does CE-Replay reproduce PostgreSQL's statistics-sensitive
cardinality estimates within the supported fragment?

### RQ1a — Frozen-realization correctness

Replay is compared with authoritative supported semantics and
hypothetical/physical checks under the same persisted frozen realization.

**Evidence.** System repository `pg-extstats-advisor` at
`88797e4b82ff1d5c8bbba28dc27987af78ce78ad`; Census lineage
`experiments/census-m2-21-frozen-authoritative/physical-validation.json` and
`replay-determinism.json`; DMV physical/hypothetical validation under
`experiments/dmv-m2-18-frozen-hyp-vs-physical/`.

### RQ1b — Fresh-realization fidelity

After physical deployment and fresh `ANALYZE`, the fresh realization is
ingested and CE-Replay is compared with native PostgreSQL on that same fresh
realization. Frozen payload and fresh payload equality is not required and no
future `ANALYZE` sample identity is claimed.

**Candidate presentation.** A semantic-fidelity table separating frozen and
fresh regimes.

**Limitations / missing work.** Same-realization fidelity within the supported
PG16.14 base-relation MCV/FD fragment only; no joins or arbitrary PostgreSQL
CE reproduction.

## RQ2 — Contextual physical design

**Question.** Do extended-statistics interactions make independent candidate
utility insufficient, and can contextual evaluation identify better feasible
designs?

**Evidence classes.** Singleton-positive, zero, and negative candidates;
contextual rescues; non-monotone design utility; and maintenance-feasible
contextual search. The primary artifacts are the Census authoritative search
under `experiments/census-m2-21-frozen-authoritative/search/` and the
singleton/context evidence retained in the system repository.

**Candidate presentation.** Contextual-loss and maintenance-budget tables.

**Limitations / missing work.** Fixed workload and target, bounded local
search, and no global-optimality claim.

## RQ3 — Incremental evaluation

**Question.** Can semantic dependencies avoid unnecessary move recomputation
without changing evaluated move outcomes?

**Evidence classes.** Semantic work reduction; exact move-value and
move-decision preservation; and operation-level timing where the measurement
boundary is valid. Evidence is in the system repository M2.21 replay/search
artifacts and tracked incremental replay implementation; the legacy audit
commit `77c5eae371870536ae11002cfc613b95da008447` identifies the reviewed
timing presentation.

**Candidate presentation.** Full-vs-incremental exactness, work reduction,
and bounded evaluator-cost table.

**Limitations / missing work.** Less semantic work does not imply lower
end-to-end optimizer wall time; invalidation is query-granularity within the
supported evaluator, not planner-internal incremental mutation.

## RQ4 — System closure and realization robustness

**Question.** Can CE-Replay support a reproducible production-separated
advisor workflow, and how robust are recommendations across independent
statistics realizations?

### RQ4a — System closure

**Evidence.** Capture, production-unavailable operation, offline advise,
preflight, stock PostgreSQL deployment, `ANALYZE`, deployment verification,
rollback, rollback verification, and Docker clean-room reproduction. Primary
artifacts are M2.31/M2.32 lifecycle artifacts and M2.33
`experiments/m2-33-docker-cleanroom/build-provenance.json` plus
`lifecycle-summary.json`.

### RQ4b — Realization robustness

**Evidence.** DMV M2.19 and M2.20 artifacts under the system repository.
Correctness means same-realization replay fidelity; robustness means behavior
across independent realizations; robustness is not design invariance.

**Candidate presentation.** Lifecycle diagram and concise cross-realization
stability table.

**Limitations / missing work.** No native-sample equivalence, automatic
deployment, universal robustness, or claim that independently selected designs
must be identical.

