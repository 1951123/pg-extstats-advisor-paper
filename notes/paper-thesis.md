# Frozen paper thesis — Strategy B

## Current thesis

PostgreSQL extended-statistics physical design needs a way to evaluate many
hypothetical configurations without repeatedly materializing and analyzing
each design, while keeping the database's own cardinality-estimator semantics
authoritative. CE-Replay is the superseded historical external-semantic line;
the current `pg-extstats-advisor` product instead virtualizes native MCV/FD
statistics state in a backend-local PostgreSQL 16.14 overlay. One fixed-target
payload realization can therefore be registered, ordered, and activated for
many hypothetical designs while native PostgreSQL computes the CE.

The resulting bounded method supports same-realization fidelity, contextual
maintenance-constrained selection, conservative query-level reuse, and a
production-separated capture/advice/deployment lifecycle. The claim is a
native-semantic what-if substrate for the validated fragment, not a new CE
algorithm, generic partial-evaluation theory, global optimizer, or universal
maintenance model.

## Superseded Strategy-A thesis (retained for provenance)

The prior thesis stated that CE-Replay preserved PostgreSQL estimator
transitions as a workload-specialized executable representation and that this
representation was the core mechanism of `pg-extstats-advisor`. That wording
describes the legacy research repository, not the current product path. It is
retained here to document why the paper framing changed; it must not be
silently reused in the manuscript.
