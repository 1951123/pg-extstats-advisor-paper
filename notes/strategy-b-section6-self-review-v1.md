# Strategy B Section 6 self-review v1

This review covers the Advisor Search and Maintenance Constraint draft only.

1. **Is search visibly secondary to the substrate?** Yes. The section opens
   by describing search as a replaceable client of the native what-if
   substrate and explicitly denies search novelty.

2. **Is the product path correctly ADD-only?** Yes. The text names the
   release-qualified `add_only` configuration and describes only contextual
   ADD enumeration and acceptance.

3. **Does any sentence imply ADD/DROP/SWAP product search?** No. ADD/DROP/SWAP
   appears once as a development/library capability explicitly excluded from
   the release-qualified product path.

4. **Is contextual utility explicitly design-dependent?** Yes. The section
   defines `Delta(s | Y,R)` and explains why singleton utility is not a fixed
   score independent of the current design.

5. **Is deterministic tie-breaking accurately described?** Yes. The stated
   order is objective, maintenance cost, then the move rank key; ADD rank is
   precedence rank followed by candidate ID. Enumeration and activation use
   the same precedence discipline.

6. **Is maintenance cost clearly scoped?** Yes. It is a fixed empirical
   mechanism-count model for the supported arity-two MCV/FD catalog, validated
   against the fixed target and calibration environment, not a universal
   PostgreSQL law or causal per-candidate `ANALYZE` model.

7. **Does `ABSENT_NATIVE` remain selectable and budget-consuming?** Yes. The
   section preserves it as a registered candidate state and assigns it the
   same definition-level cost as `PRESENT`.

8. **Is query-level reuse consistent with Section 5?** Yes. The text uses
   endpoint-to-incidence-to-affected-query replan plus reuse of `Q \\ A`, and
   states that false positives cost work while false negatives threaten
   correctness.

9. **Is safe pruning exact but secondary?** Yes. The section refers to the
   Section 5 lower bound, limits pruning to certified no-improvement cases, and
   calls it a bounded search-client optimization rather than a new algorithm.

10. **Is `add-local-optimum` defined without global-optimum implication?**
    Yes. It means that no feasible single ADD move gives a strict improvement
    for the current budget and frozen realization; global optimality and
    approximation guarantees are explicitly excluded.

11. **Does any sentence suggest singleton-negative candidates can always be
    discarded?** No. The release-qualified path uses the full candidate
    catalog, and any explicit restricted visible set is described as an input,
    not as a universally safe singleton theorem.

12. **Are all algorithm claims traceable to current code/evidence?** Yes. The
    product mode, ordering, strict comparison, cost feasibility, incidence
    reuse, lower-bound pruning, and termination label are taken from the
    frozen search implementation and workflow. No runtime or speedup claim is
    added.

No residual issue was identified that requires changing Sections 2, 3, 4, 5,
7, 8, 9, or 10.
