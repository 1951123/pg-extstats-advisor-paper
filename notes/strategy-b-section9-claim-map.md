# Strategy B Section 9 claim map

This map constrains the Related Work section to the frozen Strategy B claim
matrix.  It is a positioning map, not a new literature survey.

| Related-work topic | Claims constrained | Prior art established | Surviving paper distinction |
|---|---|---|---|
| Automated statistics management (MNSA) | C6, C7, C10 | Workload/optimizer/data-driven statistics selection, maintenance overhead, and reduction of unnecessary statistics | PostgreSQL-native state virtualization, not the statistics-selection problem |
| StatAdvisor and DB2 statistical views/column groups | C6, C7, C8 | Interacting statistical views, multivariate/column-group objects, optimizer matching, workload recommendation | PG16.14 base-table MCV/FD payload state and ordered transient activation |
| AutoAdmin What-If and SQL Server DTA | C1, C4, C7 | Hypothetical physical configurations, optimizer-backed workload evaluation, avoiding per-index materialization | Native PostgreSQL MCV/FD state in the bounded extstats fragment |
| HypoPG | C1, C2, C4 | Backend-local planner-visible hypothetical objects and transient state | MCV/FD payload derivation, ABSENT_NATIVE, ordered extstats subset, native extstats consumption |
| Oracle pending/imported statistics | C1, C4, C8 | Session-selected pending statistics, pre-gathered statistics testing, statistics transport/import | Advisor-side candidate repository and transient representable subset search; no priority claim |
| PostgreSQL 19 `pg_restore_extended_stats()` | C1, C2, C4 | Persistent/catalog-oriented restored extstats values without immediate recollection | Workflow/state lifetime: repeated transient candidate-subset evaluation in PG16.14 |
| Offline/test-server tuning and deployment lifecycle | C8 | Production/test-server separation, offline advice, recommendation and DBA deployment patterns | Patch confined to private advisor while validated production target remains stock |
| Legacy CE-Replay line | C2 | Historical externalized bounded estimator representation | Current system keeps PostgreSQL CE native and virtualizes consumed statistics state |
| Final positioning | C1, C2, C4, C6, C8 | All listed premises are inherited prior art | Bounded backend-local PG16.14 native MCV/FD state virtualization |

The section deliberately does not claim firstness, uniqueness, generic
PostgreSQL support, or novelty for statistics selection, what-if objects,
statistics restoration, contextuality, or offline tuning.
