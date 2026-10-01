# Frozen contribution plan — Strategy B

## Contribution 1 — Backend-local native extended-statistics what-if substrate

Provide a PostgreSQL 16.14 backend-local overlay that registers native MCV/FD
payloads (or explicit `ABSENT_NATIVE` states), activates an ordered
hypothetical subset, and lets PostgreSQL's own estimator consume that state.
This is the primary novelty candidate, bounded to one base relation, fixed
target, arity-two MCV/FD, and the supported predicate fragment. It is not a
generic HypoPG replacement or a new cardinality estimator.

## Contribution 2 — Native-semantic design evaluation interface

Build the evaluator and deterministic search client around the substrate:
fixed payload acquisition/cache, native `EXPLAIN`, exact q-error objective,
and conservative candidate-to-query reuse. This is a systems method and
interface contribution, not a generic semantic dependency oracle or a new
search algorithm. The release-qualified advisor uses ADD-only local search;
the library's ADD/DROP/SWAP mode remains a development interface.

## Contribution 3 — Production-separated advisor architecture

Separate stock PostgreSQL read-only capture, a sealed fixed-T bundle, private
advisor reconstruction, offline recommendation, DBA-controlled standard DDL,
deployment verification, rollback verification, and clean-room lifecycle.
Docker and the maintenance model are enabling engineering, not independent
novelty claims.

## Contribution 4 — Evidence and boundaries

Validate same-realization hypothetical/physical fidelity, contextual utility,
operation-count/repeatability, a bounded DMV materialization-cost pilot,
production closure, and bounded DMV realization robustness. State explicitly
that no general physical-per-design speedup, native-sample equivalence,
global-optimality guarantee, or universal maintenance law is claimed.

## Superseded contribution hierarchy

The former “executable CE-Replay representation plus dual objective and
semantic-dependency oracles” was the Strategy-A framing. Legacy CE-Replay is
retained as a historical external-semantic design alternative and evidence
source; it is not the implementation mechanism of the current advisor.
