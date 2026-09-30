# pg-extstats-advisor paper

This repository contains the manuscript and paper-specific provenance for
[`pg-extstats-advisor`](https://github.com/1951123/pg-extstats-advisor).

This is the paper repository, not the system implementation repository. The
system code, authoritative experiments, Docker runtime, capture bundles, and
production artifacts remain in the system repository. The supported system
baseline is PostgreSQL 16.14 and system commit
`88797e4b82ff1d5c8bbba28dc27987af78ce78ad`.

The current manuscript is only a compilable planning skeleton. Technical
prose, figures, and evaluation tables will be imported from tracked source
material after the evidence map and section plan are reviewed.

Build the skeleton with:

```sh
make
```

The provenance and claim-to-evidence policy is documented in `provenance/` and
`notes/`. Numerical claims must resolve to tracked artifacts in the system or
legacy research repositories; this repository does not become an experiment
artifact store.

