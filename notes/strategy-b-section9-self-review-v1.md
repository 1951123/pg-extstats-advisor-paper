# Strategy B Section 9 self-review v1

1. Statistics selection explicitly identified as prior art: **Yes**.  The
   section says the statistics-selection problem itself is not a contribution.
2. What-if physical design explicitly identified as prior art: **Yes**.
3. HypoPG's backend-local hypothetical-object pattern acknowledged: **Yes**.
4. Oracle pending/imported statistics acknowledged: **Yes**.
5. DB2 statistical views/column groups acknowledged: **Yes**.
6. PostgreSQL 19 extended-statistics restore acknowledged: **Yes**, with both
   documentation and commit-material citations.
7. Statistics injection/restore novelty avoided: **Yes**.
8. Offline/test-server tuning novelty avoided: **Yes**.
9. Contextual-interaction novelty avoided: **Yes**; RQ3 is framed as a
   PostgreSQL MCV/FD configuration-space characterization.
10. Bounded PG16.14 MCV/FD distinction preserved: **Yes**.
11. “HypoPG for extended statistics” analogy hidden: **No**.  The analogy is
    stated directly and the distinction is limited to payload realization,
    ABSENT_NATIVE, ordered activation, and native MCV/FD consumption.
12. First/unique/unprecedented priority language: **No**.
13. CE-Replay role: **Historical only**, one compact paragraph; it is not
    current runtime or a current contribution.
14. Literature claims match frozen boundary audit: **Yes**; only existing
    bibliography keys are used.

## Page-budget note

Section 9 is 788 words by a simple source-word count and uses four subsections
without a comparison table.  It is intended to remain approximately within
the requested 1.25--1.75 PVLDB pages.  If later compression is required, the
lowest-risk targets are repeated “not a novelty” clauses and the final
positioning paragraph's inherited-prior-art list; the HypoPG, Oracle, DB2, and
PG19 distinctions should remain explicit.
