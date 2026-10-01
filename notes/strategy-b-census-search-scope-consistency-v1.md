# Census Search-Scope Consistency Audit v1

This audit reconciles the Census population, screening, and search metrics in
the manuscript with the authoritative M2.21 frozen-sample artifacts.  No
experiment was run, and no system artifact, search implementation, or
numerical result was changed.

## Authoritative scope

The Census candidate catalog contains 4,506 candidates (2,253 MCV and 2,253
FD).  The preregistered raw top-5% singleton screen evaluates that complete
catalog and retains `ceil(4506 * 0.05) = 226` candidates.  The deterministic
contextual ADD-only search then operates only on that fixed 226-candidate
search-visible subset.  All 226 retained candidates happened to be `PRESENT`
in the frozen realization; that observed state does not redefine the screen's
input universe.

The M2.21 search artifact reports 19,210 conceptual and feasible moves,
2,441 exact-bound prunes, 16,769 native evaluations, and 88,654 planner calls.
These are counts for the 226-candidate search-visible subset, not for a
full 4,506-candidate search.  The 2,441 exact-bound prunes are an in-search
mechanism and are distinct from the pre-search singleton screen.

Authoritative sources include:

- `experiments/census-m2-21-frozen-authoritative/protocol.json`;
- `experiments/census-m2-21-frozen-authoritative/screening.json`;
- `experiments/census-m2-21-frozen-authoritative/search/search.json`;
- `experiments/census-m2-21-frozen-authoritative/report.md`.

## Manuscript scope audit

| Location | Prior wording/condition | Correction or disposition |
|---|---|---|
| Section 8 opening | Census called “the authoritative corrected search” without its visibility scope | Retained as an evidence-lineage label; the explicit subset scope is stated in RQ2 and the table. |
| Evaluation-population table | `4,506; one persisted realization` and “authoritative search” | Now distinguishes the `4,506` catalog from the `226` screened subset and labels the purpose as screened ADD search and physical validation. |
| RQ2 setup | Search described as over the authoritative 4,506-candidate catalog | Now states the full-catalog input, raw top-5% screen, fixed 226-candidate search-visible subset, and pre-search acquisition/realization. |
| RQ2 metric paragraph | `19,210` moves had no local population qualifier | Now states that the moves are within the fixed 226-candidate search-visible subset. |
| RQ2 table caption/row | Generic “Conceptual/feasible moves” label | Caption identifies the screened search and the row identifies the screened set. |
| RQ3 setup | Existing wording explicitly described the raw top-5% screen over all 4,506 candidates and 226 retained | Correct and retained. |
| RQ3 qualification | Existing wording rejected an interpretation as exhaustive optimization of all 4,506 candidates | Correct and retained. |
| Section 3 and generic Section 6 catalog definitions | Generic benchmark/catalog semantics | Correct as written; no Census-specific search scope was implied. |

The 12 negative-singleton rescues and the statement that singleton screening
is not a generally safe pruning rule are unchanged.  No abstract,
introduction, result value, RQ identity/question, or Section 10 limitation was
changed; the RQ2 setup and metric wording were clarified only.

## Claim boundary

The manuscript now claims bounded, repeatable contextual native evaluation and
physical validation for a fixed screened Census subset.  It does not claim a
full-catalog Census search, global optimality, or correctness-preserving
singleton screening.  The 4,506-candidate catalog, 226-candidate screen,
19,210 subset moves, and 2,441 in-search exact-bound prunes are presented as
separate stages.
