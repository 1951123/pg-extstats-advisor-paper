# Strategy B Section 8 self-review v1

1. **Are all five frozen RQs represented?** Yes: RQ1 fidelity, RQ2 bounded
   work, RQ3 contextual design, RQ4 production-separated closure, and RQ5
   realization robustness each have a subsection.
2. **Are populations kept distinct?** Yes. DMV M2.18, M2.17d, M2.19, M2.20,
   Census M2.21, and M2.33 are named separately; no result is transferred
   between populations without an explicit qualification.
3. **Are setup, metric, result, interpretation, and limitation present?** Yes,
   each subsection uses question/setup, metric/result, and an explicit
   interpretation/limitation paragraph.
4. **Are numerical values artifact-grounded?** Yes; the companion evidence
   ledger records every reported count, objective, percentage, overlap, and
   derivation with a tracked source path.
5. **Are rounded values used in the manuscript?** Yes, except one RQ1 table
   retains the exact objective to make the equality gate auditable.
6. **Is there a speedup claim?** No. The RQ2 paragraph explicitly says that
   operation counts do not establish a wall-clock speedup.
7. **Is a physical-per-design baseline invented?** No; its absence is stated.
8. **Is RQ1 overstated?** No. The result is limited to the validated fragment,
   one fixed realization, one relation, and PostgreSQL 16.14.
9. **Is RQ2 structural work separated from measured work?** Yes. The text
   identifies pre-search acquisition structurally and reports search counters
   separately.
10. **Is RQ3 singleton evidence overclaimed?** No. Negative-singleton rescue
    is presented as interaction evidence, not a submodularity or pruning
    theorem.
11. **Is Census called exhaustive over all candidates?** No. The 226-candidate
    screen and its limitation are explicit.
12. **Is RQ4 production separation clear?** Yes. Stock production, private
    patched advisor, DBA-controlled deployment, and synthetic fixture scope are
    stated.
13. **Is clean-room evidence overclaimed as byte reproducibility?** No. The
    semantic-only reproducibility scope is stated.
14. **Is RQ5 design stability confused with invariance?** No. The text reports
    near-equivalent designs and explicitly rejects identity invariance.
15. **Are robustness limitations visible?** Yes: no drift, cross-version,
    future-sample equality, maintenance refit, or join evidence.
16. **Does Section 8 introduce CE-Replay evidence?** No. It explicitly states
    that no CE-Replay evidence is used.
17. **Are new citations or related-work claims introduced?** No. Section 8
    relies on internal tracked artifacts and adds no bibliography entries.
18. **Are new experiments or artifacts generated?** No. Only the manuscript
    section and two paper notes are added; the system repository is untouched.
19. **Is page-budget risk acknowledged?** Yes. The section is evidence-complete
    first; table/prose compression remains a later, separately reviewable task.
