# Strategy B abstract audit v1

| Sentence | Assessment | Action |
|---|---|---|
| “PostgreSQL extended statistics can improve cardinality estimates for correlated predicates, but choosing a useful subset requires evaluating many configurations.” | Accurate motivation; no novelty or optimality claim. | KEEP |
| “MCV and functional-dependency payloads are data-dependent products of `ANALYZE` coupled to PostgreSQL catalog state.” | Correctly identifies the definition/payload boundary. | KEEP |
| “Materializing every design repeats this physical step, while an external estimator risks semantic drift.” | Structural contrast; does not claim wall-clock savings. | KEEP |
| “We present `pg-extstats-advisor`, a backend-local what-if substrate for the supported PostgreSQL 16.14 extended-statistics fragment.” | Correctly bounded to PG16.14 and the supported fragment; not a general advisor claim. | KEEP |
| “The private advisor derives native candidate payloads under one frozen realization, stores them in a repository, registers a payload or `ABSENT_NATIVE`, and transiently activates representable subsets in a backend-local overlay.” | Clearly states state virtualization and its representability limitation. | KEEP |
| “PostgreSQL itself performs applicability, precedence, consumption, deserialization, MCV/FD composition, and cardinality estimation through native `EXPLAIN`; the search loop performs no per-design `ANALYZE` or physical deployment.” | States native semantic authority and the precise no-per-design qualifier. | KEEP |
| “Production PostgreSQL remains stock: read-only capture exports the persisted sample and metadata, while the private advisor reconstructs the repository and returns ordinary DBA-controlled statistics DDL.” | Correct production/advisor separation; no automatic deployment claim. | KEEP |
| “We report same-realization hypothetical/physical fidelity, contextual candidate behavior, operation counts and query-level reuse, lifecycle closure, and bounded DMV independent-realization robustness.” | Evidence categories match RQ1–RQ5 and explicitly bounds robustness to DMV. | KEEP |
| “The scope is one base relation, a fixed target, and arity-two MCV/FD statistics; no new CE, search novelty, global-optimum, latency, or physical-evaluation speedup claim is made.” | Strong closing scope/non-claim sentence. | KEEP |

**Abstract assessment:** All required concepts appear: statistics-state virtualization, native PostgreSQL estimator semantics, bounded substrate scope, and evidence categories. No global optimization, speedup, general PostgreSQL, firstness, or automatic-production-deployment implication was found.
