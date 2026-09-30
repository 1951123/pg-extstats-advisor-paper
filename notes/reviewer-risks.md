# Reviewer risks retained for Strategy B drafting

## R1 — Existing hypothetical-statistics overlap

A reviewer may identify HypoPG-like or other hypothetical extended-statistics
support. The paper must compare the interfaces directly if making a novelty
claim; current artifacts alone do not defeat this objection.

## R2 — Existing statistics advisors and test-server tuning

Offline advice, candidate selection, and private test servers are established
patterns. The bounded distinction is the backend-local native MCV/FD state
overlay and its same-realization validation, not the existence of an advisor
lifecycle.

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
