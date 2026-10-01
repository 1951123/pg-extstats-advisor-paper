# Strategy B evidence gaps

Only gaps confirmed by the independent audit are listed here.

1. **Bounded physical-per-design evidence only.** M2.36 adds a controlled
   six-design DMV timing comparison against batched creation/analysis, but not
   a Census-scale or general wall-clock baseline. Therefore the paper must not
   claim universal speedup or production-wide avoided time.
2. **Subset coverage is API-bounded, not exhaustive.** The overlay accepts
   arbitrary ordered subsets of the frozen candidate catalog, and the
   authoritative searches exercise many states, but no artifact enumerates
   every subset.  Say “representable supported configurations,” not “all
   configurations.”
3. **Product search-mode evidence is narrow.** The release-qualified workflow
   is deterministic ADD-only; full ADD/DROP/SWAP exists as a library/development
   mode.  Do not present the development mode as the production advisor
   algorithm or as a search contribution.
4. **Query reuse is an implementation boundary.** Incidence-based reuse is
   exact and conservative at query granularity, but query-internal semantic
   reuse was rejected.  It should support an evaluator-work question, not be
   promoted to a general incremental-computation RQ.
5. **Maintenance model is scoped.** The empirical maintenance model is a
   fixed-target, environment-specific resource constraint.  It is not a
   universal PostgreSQL cost law, a per-candidate causal ANALYZE model, or the
   primary novelty claim.
6. **Direct competitor comparisons are absent.** Existing artifacts do not
   contain an apples-to-apples comparison with HypoPG-like extstats support,
   a test-server-per-design baseline, or a prior statistics advisor.  The
   related-work section must state this boundary without claiming those systems
   are defeated.
7. **Capture/repository distinction needs prose discipline.** The production
   capture bundle contains sample and metadata; payload bytes are derived and
   cached in the private advisor.  “Capture retains native payloads” would be
   inaccurate.
8. **Realization scope remains bounded.** M2.19/M2.20 are DMV evidence, and
   M2.21 is Census same-sample evidence.  Neither establishes native-sample
   equivalence, temporal/schema drift robustness, or cross-version portability.

These gaps do not require a new experiment for the Strategy B decision.  They
must be reflected in claims, RQs, non-claims, and the evaluation plan.
