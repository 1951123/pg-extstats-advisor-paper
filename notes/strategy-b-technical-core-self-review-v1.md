# Strategy B technical-core self-review v1

1. **Implementability from Section 4.** A reviewer can reconstruct a rough
   equivalent: the section identifies the candidate definition/shell/payload
   distinction, the repository states, the actual registration and activation
   functions, relation and mechanism validation, backend-local memory lifetime,
   ordered OID filtering, and the native MCV/dependency loader hooks. It does
   not pretend to specify unsupported catalog or planner internals.

2. **State placement.** The boundary is explicit. Production capture contains
   the persisted sample and workload/truth/schema/compatibility metadata; the
   advisor repository contains derived native payload bytes or
   `ABSENT_NATIVE` plus provenance; the backend-local overlay contains
   registration and the active ordered subset; persistent PostgreSQL catalogs
   contain only private advisor shells or ordinary production definitions, not
   overlay registrations.

3. **ABSENT_NATIVE.** It is described as a legitimate registered candidate
   state produced when PostgreSQL returns a null requested native payload. It
   is separated from `UNREGISTERED`, which is an acquisition/validation
   failure.

4. **Ordering and precedence.** CandidateCatalog normalizes designs by unique
   precedence rank; the adapter passes that order as an OID array; the patch
   stores the order and filters/reorders the targeted relation's statistics
   list before native planner processing. The text limits this to
   representable frozen-catalog configurations.

5. **Native CE authority.** The text explicitly assigns applicability,
   lookup, selection/precedence, clause consumption, deserialization,
   MCV/FD composition, and numerical estimation to PostgreSQL.

6. **Python semantic reimplementation check.** No sentence assigns MCV/FD
   matching, dependency degrees, residual clauses, or replacement estimates to
   Python. The adapter supplies state and extracts native `EXPLAIN` output.

7. **ANALYZE wording.** The draft never claims that the advisor never runs
   `ANALYZE`. It states that acquisition/cache reconstruction may run it before
   search and that the excluded operation is per-design search-loop
   `CREATE`/`DROP`/`ANALYZE`.

8. **Reuse boundary.** Reuse is explicitly candidate-move to conservative
   affected-query incidence, followed by native replanning of affected
   queries and reuse of unaffected query evaluations. Incrementality stops at
   query granularity; planner-internal and semantic dependency reuse are not
   claimed.

9. **Lower-bound pruning.** The q-error lower bound is derived exactly from
   each contribution being at least one, and both pruning tests are stated.
   It is presented as a secondary search-client optimization, not a new search
   theory or optimality guarantee.

10. **Speedup check.** The prose reports an operation-placement distinction and
    explicitly disclaims a measured wall-clock speedup against a
    physical-per-design baseline.

11. **CE-Replay disposition.** In the new technical core it appears only in
    the evaluation-alternative comparison as the historical external-CE line;
    it is explicitly not the current runtime mechanism. The existing
    introduction and Section 2 planning skeleton retain the same historical
    boundary.

12. **Traceability.** Technical claims were checked against
    `workflow.py`, `evaluator/native.py`, `postgres/adapter.py`,
    `prepare/acquisition.py`, `payloads/repository.py`, `incidence/index.py`,
    `search/deterministic.py`, the tracked PostgreSQL patch, and the frozen
    architecture/scope/artifact-contract documents. No experiment or legacy
    repository was used as an unverified implementation source.

