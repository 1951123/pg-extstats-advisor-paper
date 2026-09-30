# Frozen research questions and evidence map

The paper freezes four questions. Paths below point to authoritative tracked
artifacts; this repository does not copy the experiment directories.

## RQ1 — Semantic fidelity

**Question.** Does CE-Replay reproduce PostgreSQL's statistics-sensitive
cardinality estimates within the supported fragment?

**Evidence.** System repository `pg-extstats-advisor` at
`88797e4b82ff1d5c8bbba28dc27987af78ce78ad`; Census lineage
`experiments/census-m2-21-frozen-authoritative/physical-validation.json` and
`replay-determinism.json`; DMV physical/hypothetical validation under
`experiments/dmv-m2-18-frozen-hyp-vs-physical/`.

**Candidate presentation.** Semantic-fidelity table and replay pipeline figure.

**Limitations / missing work.** Same persisted realization and the supported
PG16.14 base-relation MCV/FD fragment only; no joins or arbitrary PostgreSQL
CE reproduction.

## RQ2 — Contextual physical design

**Question.** Do extended-statistics interactions make independent candidate
utility insufficient, and can contextual evaluation identify better feasible
designs?

**Evidence.** Census authoritative search under
`experiments/census-m2-21-frozen-authoritative/search/` and singleton/context
evidence retained in the system repository; claims matrix C4 and C9 provide
the current scope and caveats.

**Candidate presentation.** Contextual-loss and maintenance-budget tables.

**Limitations / missing work.** Fixed workload, fixed target, bounded local
search, and no global-optimality claim.

## RQ3 — Incremental evaluation

**Question.** Can semantic dependencies avoid unnecessary move recomputation
without changing evaluated move outcomes?

**Evidence.** System repository M2.21 replay/search artifacts and the tracked
incremental replay implementation; the legacy audit commit
`77c5eae371870536ae11002cfc613b95da008447` identifies the reviewed timing
presentation.

**Candidate presentation.** Full-vs-incremental exactness and controlled
evaluator-cost table.

**Limitations / missing work.** Query-granularity invalidation within the
supported evaluator; no planner-internal incremental mutation claim.

## RQ4 — System closure and realization robustness

**Question.** Can CE-Replay support a reproducible production-separated
advisor workflow, and how robust are recommendations across independent
statistics realizations?

**Evidence.** M2.19 and M2.20 DMV artifacts for bounded realization evidence;
M2.31/M2.32 deployment lifecycle artifacts; M2.33
`experiments/m2-33-docker-cleanroom/build-provenance.json` and
`lifecycle-summary.json` for clean-room closure.

**Candidate presentation.** Lifecycle diagram and bounded cross-realization
stability table.

**Limitations / missing work.** Realization uncertainty is accepted; no
native-sample equivalence, automatic deployment, or universal robustness
claim.

