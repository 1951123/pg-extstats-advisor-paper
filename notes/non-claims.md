# Explicit non-claims — Strategy B

The paper must not claim:

- a new cardinality-estimation algorithm or full PostgreSQL CE reproduction;
- a generic partial-evaluation, dependency-oracle, or incremental-computation
  theory;
- a global optimum, approximation guarantee, or search novelty;
- general speedup or quantified production time savings; M2.36 is only a
  bounded DMV physical-materialization cost characterization;
- arbitrary PostgreSQL statistics mechanisms, joins, versions, expressions,
  or DBMS portability;
- that the capture bundle contains native payload bytes or that its sample is
  native-`ANALYZE` equivalent;
- invariant designs across realization samples or universal robustness;
- universal PostgreSQL maintenance coefficients or a causal per-candidate
  `ANALYZE` cost law;
- automatic production deployment, rollback repair, byte-reproducible Docker,
  or a complete security boundary.

“Arbitrary hypothetical configurations” means representable ordered subsets of
the frozen supported candidate catalog only. “Without `ANALYZE`” means without
per-design/per-move search-time `ANALYZE`; acquisition or shell recreation may
perform the required pre-search analyze step.

The legacy CE-Replay IR and its semantic oracle remain historical evidence and
are not the current advisor implementation.
