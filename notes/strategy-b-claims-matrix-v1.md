# Strategy B claims matrix v1

This matrix is the drafting authority for later Sections 9--10.  It records
the surviving claims after the v1 consistency audit; forbidden extensions are
deliberate non-claims.

| Claim ID | Manuscript claim | Scope | Evidence | RQ | Allowed wording | Forbidden extension |
|---|---|---|---|---|---|---|
| C1 | Backend-local native extended-statistics substrate | PG16.14, one relation, arity-two MCV/FD, fixed target | Sections 4--5; patch/adapter | RQ1/RQ2 | “backend-local what-if substrate virtualizes supported native MCV/FD state” | generic virtualization theory; generic PostgreSQL |
| C2 | Native PostgreSQL CE remains authoritative | supported native lookup/deserialization/composition path | Sections 4--5; M2.18 | RQ1 | “PostgreSQL performs supported applicability and CE semantics” | new/external CE; full PG CE fidelity |
| C3 | Same-realization hypothetical/physical fidelity | same ordinary stats, payload, order, design, PG16.14 | DMV M2.18; Census validation | RQ1 | exact vectors/objective/payload gates under one realization | future ANALYZE equality; joins; cross-version |
| C4 | No per-design search-loop materialization | acquisition/reconstruction may ANALYZE before search; M2.36 measures the avoided materialization component in a bounded DMV pilot | Sections 4--5; M2.21; M2.36 | RQ2 | “no per-design/per-move CREATE/DROP/ANALYZE”; bounded materialization-cost characterization | eliminates ANALYZE; universal faster/cheaper claim |
| C5 | Bounded work and query-level reuse | Census M2.21 recorded move/evaluation/planner counts; M2.36 adds a bounded DMV timing decomposition | M2.21 report/repeat/validation; M2.36 report | RQ2 | report operation counts, exact repeat, and bounded materialization-cost evidence | general wall-clock speedup; quantified production savings |
| C6 | Contextual utility | observed DMV/Census contextual moves under fixed workloads | M2.17d interaction; M2.20; M2.21 | RQ3 | singleton utility can be insufficient in observed runs | contextuality novelty; non-submodularity theorem; universal failure |
| C7 | ADD-only maintenance-constrained local design | deterministic product search, fixed target/model, current budget | Section 6; M2.17d/M2.21 | RQ3 | “ADD-local optimum under current frozen realization/budget” | global optimum; DROP/SWAP product; approximation guarantee |
| C8 | Production-separated lifecycle | stock production/capture, private patched advisor, DBA deployment | M2.31/M2.32/M2.33 | RQ4 | offline advice and lifecycle PASS in supported contract | patched production; automatic deployment; security guarantee |
| C9 | Independent-realization robustness | DMV M2.19/M2.20 only | ten fresh/five persisted DMV samples | RQ5 | fixed design positive and selected designs near-equivalent in tested DMV samples | universal/Census robustness; invariance; drift/cross-version |
| C10 | Fixed target | external configuration identity, default T=100, not searched | target docs/tests; M2.33 | all | “fixed target; model target-specific” | target optimization; universal T=100 optimum |

The matrix intentionally distinguishes mechanism facts, same-realization
correctness, measured operation counts, contextual behavior, lifecycle scope,
and independent-realization robustness.
