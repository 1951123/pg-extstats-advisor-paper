# Strategy B Section 3 self-review v1

This review covers the Section 3 Problem and System Contract draft only.

1. **Is the optimization problem defined without being presented as a new
   optimization contribution?** Yes. The section states the bounded subset
   problem and explicitly identifies resource-constrained statistics
   selection as established prior art; it makes no formulation-novelty or
   global-optimality claim.

2. **Is the meaning of `R` unambiguous?** Yes. `R` is the advisor-derived
   frozen statistics realization reconstructed from a persisted capture sample
   and compatible metadata. It is neither the production capture bundle nor a
   future `ANALYZE` result.

3. **Are payload states explicit?** Yes. `PRESENT(p_s)` and
   `ABSENT_NATIVE` are the two mathematical states, while `UNREGISTERED` is
   explicitly outside the valid domain as an acquisition or contract failure.

4. **Are valid and invalid states separated?** Yes. The payload-state table
   marks the two registered states as valid design states and
   `UNREGISTERED` as invalid; the prose also specifies fail-closed behavior.

5. **Does selected `ABSENT_NATIVE` have the intended semantics?** Yes. It
   remains selected, has no fabricated payload, and still incurs its
   definition-level maintenance cost.

6. **Is activation order distinguished from the optimization variable?** Yes.
   `Y` is membership, while `pi(Y)` is the deterministic order derived from
   unique catalog precedence; arbitrary permutation search is excluded.

7. **Is the estimator described correctly?** Yes. `hat N_q(Y,R)` is obtained
   from native PostgreSQL through the supported `EXPLAIN (FORMAT JSON)` path,
   not from a learned or external CE model.

8. **Is the statistics target correctly scoped?** Yes. `T` is externally
   supplied, defaults to 100, is fixed before capture and search, participates
   in identity/compatibility, and is not an optimization variable.

9. **Are correctness and robustness separated?** Yes. Same-realization
   hypothetical/physical agreement is the correctness contract; independent
   realizations and design changes are described separately as robustness, not
   design invariance.

10. **Does the section avoid overclaiming?** Yes. It limits the contract to
    PostgreSQL 16.14, one base relation, arity-two MCV/FD candidates, fixed
    target, and supported predicates, and explicitly excludes joins, fresh
    sample equivalence, automatic target selection, latency, and global
    optimality.

No residual issue was identified that requires changing Sections 2, 4, 5, 6,
or 7. The notation and boundaries are aligned with the existing technical
core and native-evaluation sections.
