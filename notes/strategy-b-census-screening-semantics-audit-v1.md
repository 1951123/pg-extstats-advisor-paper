# Census Screening Semantics Audit v1

Audit baseline: paper tag `submission-v1` (`33d76c87b17ccb44597361cae378e00b8020a5bb`).
System implementation tag: `paper-v1-system`
(`88797e4b82ff1d5c8bbba28dc27987af78ce78ad`).  No experiment was run and no
system artifact or numerical result was changed.

## Exact screening rule

The authoritative M2.21 protocol first evaluates the complete singleton
profile for all 4,506 catalog candidates: 2,253 MCV and 2,253 FD.  The raw
singleton improvement is

```text
empty-design objective - singleton objective
```

The deterministic ordering is, in order:

1. descending singleton improvement;
2. ascending maintenance cost;
3. ascending candidate precedence rank;
4. ascending candidate ID.

The screen retains `ceil(4506 * 0.05) = 226` candidates.  It is therefore a
screen over the complete raw catalog, not over the 3,401 `PRESENT` candidates.
In the frozen realization, all 226 retained candidates happen to be
`PRESENT` (215 MCV and 11 FD); that is an observed result, not the input
universe.

The rule is preregistered in the M2.21 protocol, deterministic, and fixed
before the ADD-only search.  It is a benchmark-specific computational
visibility restriction.  The implementation and documentation explicitly
describe it as heuristic, not exactness-, dominance-, or
globally-uselessness-preserving.  The search is exact only relative to the
visible 226-candidate set.

Authoritative sources:

- `experiments/census-m2-21-frozen-authoritative/protocol.json` records the
  completed screening phase, 226 visible candidates, and singleton-profile
  lineage;
- `experiments/census-m2-21-frozen-authoritative/singleton/summary.json`
  records the 4,506-candidate population, realization counts, and
  1,560/1,567/1,379 positive/zero/negative singleton distribution;
- `experiments/census-m2-21-frozen-authoritative/screening.json` records the
  retained set and its all-`PRESENT` observed state;
- `tools/m2_11_screened_add.py` checks `len(rows) == 4506` and applies
  `SCREENING_FRACTION = 0.05` through `screen_singleton_rows`;
- `src/pg_extstats_advisor/analysis/singleton.py` defines the ordering and
  ceiling rule;
- `docs/development-screening-workflow.md` states that screening is a
  heuristic visibility restriction and that search is exact only within the
  visible set;
- `docs/m2-21-census-frozen-authoritative-rerun.md` calls the step an
  explicitly bounded protocol step, not a universal policy.

## Manuscript occurrence audit

| Location | Exact wording before this audit | Safe-pruning inference? | Action |
|---|---|---|---|
| Section 8 opening | “Census the authoritative corrected search” | Low by itself; “authoritative” identifies the evidence lineage, not full-catalog completeness | Retained |
| Table 4 / setup | “Census M2.21 & 468 & 4,506; one persisted realization & authoritative search and physical validation” | Moderate if read without the later qualification | Retained; later RQ3 sentence now defines the screen |
| RQ2 setup | “deterministic ADD-only search over the authoritative 4,506-candidate catalog” | Moderate; describes the source catalog, while the screen is a later explicit input | Retained; acquisition/search distinction remains explicit |
| RQ3 setup | “authoritative screened path (the preregistered top-5\% present-candidate screen, 226 candidates)” | Yes: “present-candidate” incorrectly suggests that `PRESENT` candidates were screened as the universe, and does not state the heuristic boundary | Corrected minimally |
| RQ3 result | “The singleton observation is therefore diagnostic evidence of interaction, not a pruning theorem.” | No; explicitly rejects singleton-pruning interpretation | Retained |
| RQ3 table | “226-candidate screen; 113 rounds; ADD-local” | Low; compact result label | Retained |
| RQ3 qualification | “screened authoritative search rather than a claim that all 4,506 candidates were exhaustively optimized under every move type” | No; explicitly limits the result | Retained |
| Section 10 / limitations and notes | fixed catalog/screen limitations and no universal pruning/global-optimum claim | No | Retained |

The manuscript change is only the RQ3 setup sentence.  It now reads:

> “authoritative screened path (a preregistered raw top-5% computational
> screen over all 4,506 candidates, retaining 226; all retained candidates
> happened to be `PRESENT` in the frozen realization).”

No number, RQ, objective, result, or claim boundary was changed.

## Classification and logical consistency

**Classification: B — AMBIGUOUS.**

The manuscript already says that the singleton observation is diagnostic, not
a pruning theorem, and already disclaims exhaustive optimization over all
4,506 candidates.  Thus it was not inconsistent with the DMV evidence.  The
phrase “present-candidate screen,” however, was factually imprecise about the
screened universe and could allow a reviewer to read the 226 set as a
PRESENT-only or correctness-preserving reduction.  The one-sentence
clarification removes that ambiguity without changing the experiment.

The DMV result remains logically decisive for the boundary: 12 finally
selected candidates had negative singleton utility and became useful in
context.  Consequently, singleton utility is not a generally safe pruning
rule.  M2.21 does not prove that no discarded Census candidate could become
contextually useful.

## Pre-screen versus exact-bound pruning

These are separate mechanisms and remain separate in the paper:

| Mechanism | When | Population | Criterion | M2.21 result |
|---|---|---|---|---:|
| Singleton screen | before search | all 4,506 candidates | heuristic raw singleton ranking; fixed visible subset | 226 retained |
| Exact-bound pruning | inside search | candidate moves in the visible 226-candidate search | exact q-error lower bound under the stated objective and incumbent | 2,441 moves |

The 2,441 exact-bound prunes support the bounded-work claim for the screened
search and do not validate the preceding singleton screen.  Conversely, the
226-candidate screen is not reported as an exact bound.

## What M2.21 establishes and does not establish

M2.21 establishes deterministic contextual ADD-only search, repeatability,
native evaluations, and same-realization physical validation over a fixed,
preregistered 226-candidate subset selected from the 4,506-candidate Census
catalog.  It does not establish:

- a full 4,506-candidate search result;
- a globally optimal Census design;
- correctness-preserving singleton screening;
- that discarded candidates could never become contextually useful.

No screen-size sensitivity experiment is scientifically necessary for the
bounded claim currently made.  Such an experiment would be required only if
the paper were expanded to claim full-catalog quality, screening recall, or
an optimal/safe threshold; those claims remain out of scope.

## Reviewer-response test

If asked, “If singleton utility can become useful only in context, why is a
top-5% Census screen acceptable?”, the accurate answer is:

> The screen is a preregistered computational restriction used to make the
> large Census evaluation tractable.  It is not claimed to be
> correctness-preserving.  The Census result therefore characterizes
> contextual ADD-only search within that fixed screened subset.  The DMV
> negative-singleton rescues are precisely why singleton screening is not
> generalized as safe pruning, and no claim is made that a discarded
> candidate could never become useful in context.

## Validation and disposition

The manuscript clarification was limited to `paper/sections/08-evaluation.tex`.
The PDF was rebuilt with `make`; `git diff --check` passed.  The resulting
PDF remains 13 pages, with zero undefined citations/references, zero
overfull boxes, all fonts embedded, and zero Type3 fonts.  No Section 8
number changed.  No new submission tag was created.
