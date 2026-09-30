# Reviewer risks retained for Strategy B drafting

## R1 — Existing hypothetical-statistics overlap

HypoPG establishes backend-local planner-visible hypothetical objects, and
AutoAdmin/DTA establish workload-driven what-if configuration analysis. The
analogy to “HypoPG, but for extended statistics” remains serious. The paper
must acknowledge that pattern and limit its distinction to native PG MCV/FD
payload state, `ABSENT_NATIVE`, ordered activation, and native CE consumption;
current artifacts do not establish priority over hypothetical-object systems.

## R2 — Existing statistics advisors, pending statistics, and test-server tuning

MNSA, StatAdvisor/DB2 statistical views, Oracle pending/imported statistics,
PG19 extended-statistics restore, offline advisors, and private test servers
establish the selection, testing, import, and lifecycle premises. The paper
must not claim those premises as novel. The bounded distinction is the
PostgreSQL-native backend-local extstats subset overlay and its same-realization
validation; direct apples-to-apples competitor measurements remain absent.

## R3 — Patch plus conventional search

The PostgreSQL patch and deterministic ADD-only search are engineering and
algorithmic scaffolding. Do not claim search novelty or a new CE algorithm;
make the substrate/interface the primary mechanism claim.

## R4 — “Just cache payloads” reduction

Caching alone does not express ordered activation, native catalog precedence,
ABSENT_NATIVE behavior, or native CE consumption. These details must be shown
as the tested interface, while avoiding an unsupported claim of general
semantic theory.

## R5 — No speedup baseline

Operation counts and no per-move `ANALYZE` do not imply wall-clock speedup. The
paper must state that a physical-per-design baseline was not measured.

## R6 — Scope narrowness

The supported scope is PostgreSQL 16.14, one base relation, fixed target,
arity-two MCV/FD, and bounded predicates. “Arbitrary configurations” means
only representable subsets/orderings of this catalog.

## R7 — Search and incrementality boundaries

The release-qualified advisor is ADD-only. Query-level incidence reuse is
conservative; query-internal semantic incremental replay was not migrated.

## R8 — Maintenance and realization uncertainty

Maintenance costs are target- and environment-specific proxies. Independent
realizations may select different designs with near-equivalent outcomes;
frozen payloads are not native-sample equivalence.

## R9 — Portability and operations

Fail-closed PG16.14 compatibility, DBA-controlled deployment, security caveats,
and no byte-level Docker reproducibility are explicit limitations.
