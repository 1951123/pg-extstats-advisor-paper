# Reviewer risks retained for drafting

## R1 — Novelty versus specialization

A reviewer may view CE-Replay as PostgreSQL-specific partial evaluation or
manual specialization. The paper must state the represented computation and
avoid implying a general source compiler.

## R2 — Scope narrowness

The supported scope is PostgreSQL 16.14, one base relation, arity-two MCV and
functional dependencies, and bounded predicate forms.

## R3 — Search not novel

Search is a deterministic constrained use of the semantic oracles, not a new
global optimizer.

## R4 — Maintenance model is scoped

Maintenance costs are target- and environment-specific empirical proxies, not
universal PostgreSQL costs.

## R5 — Sampling realization uncertainty

Independent native realizations can select different designs while retaining
bounded near-equivalent outcomes. This is accepted uncertainty, not a replay
correctness failure.

## R6 — CE quality does not imply runtime improvement

Q-error and evaluator-cost evidence must not be presented as query-latency
improvement.

The production-capture separation, deployment lifecycle, and Docker clean-room
artifacts mitigate earlier concerns about practical pipeline completeness, but
they do not remove the scientific scope boundaries above.

