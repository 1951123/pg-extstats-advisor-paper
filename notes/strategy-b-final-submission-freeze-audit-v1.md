# Strategy B Final Submission Freeze Audit v1

Audit date: 2026-10-01.

This is a read-only freeze audit of the paper and its supporting system
evidence.  No manuscript, experiment, or system code was changed.  The only
new file is this audit note.

## Repository state and binding

| Repository | branch | local HEAD | origin/main | worktree |
|---|---|---|---|---|
| `pg-extstats-advisor-paper` | `main` | `7f503e9054164e125e76bda89b71f58ee72b1257` | same | clean before this note |
| `pg-extstats-advisor` | `main` | `a0ef0f6d32c52808f82a6be47cda39ce9ccd0089` | same | clean |

The paper binds reported system behavior to frozen implementation commit
`88797e4b82ff1d5c8bbba28dc27987af78ce78ad` in
`provenance/system-version.md` and `provenance/source-repositories.md`.
That commit exists, is reachable from the current system history, and
contains each of the key evidence paths below.  The later system commits
`f305696` and `a0ef0f6` add research-decision/provenance notes only; they are
not treated as a replacement implementation baseline.

## Build and rendered-PDF preflight

The canonical `make` build succeeded (the repository's documented
`pdflatex`/BibTeX fallback was used because `latexmk` is not installed).
`paper/build/main.pdf` has 13 pages.  The complete rendered page set was
inspected at reduced resolution; figures, tables, headings, page breaks, and
the references page are legible, with no clipping or accidental blank page.

Preflight results:

- LaTeX/BibTeX build: PASS
- undefined citations/references: 0
- horizontal/vertical overfull boxes: 0
- all listed PDF fonts embedded: PASS
- Type3 fonts: 0
- references: contained on page 13; no overflow beyond the 13-page PDF

The PDF metadata still contains the existing author/affiliation/DOI
placeholders.  This is a human submission-metadata action, not a scientific
or reproducibility defect.

## Numerical consistency

All material values were checked against the tracked JSON/CSV artifacts in
the system repository.  No discrepancy was found.

| Evidence | Manuscript value | Authoritative artifact check |
|---|---|---|
| DMV M2.17d/M2.18 | 42,791.986 → 22,014.061; 48.56%; 31 (8 MCV, 23 FD); 12 contextual negative-singleton rescues | `dmv-m2-18.../protocol.json`, `dmv-m2-18.../final-design.json`, M2.17d interaction artifacts; exact improvement 48.555645% |
| DMV M2.18 fidelity | 31/31 payloads; 1,963/1,963 estimates and q-errors | `dmv-m2-18.../protocol.json` and `repeatability.json`; all equality gates true |
| DMV M2.19 | 10 fresh realizations; all positive; 43.75--48.62%; 28 stable-present and 3 state-flipped | `dmv-m2-19.../summary.json`; min relative improvement 0.4375135 |
| DMV M2.20 | 5 samples; sizes 28--31; Jaccard 0.742857--0.9375 (median 0.846); core 25; >=4/5 count 28; max relative gap 0.00891% | `dmv-m2-20.../summary.json` and `cross-objective-gaps.csv`; no foreign design beats local |
| Census M2.21 | 4,506 (2,253/2,253); PRESENT 3,401; ABSENT_NATIVE 1,105; singleton 1,560/1,567/1,379; visible 226; selected 112 (110/2); 5,577.426 → 928.597 (83.35%); 19,210/2,441/16,769/88,654; 468/468 validation | `census-m2-21.../repository-summary.json`, `singleton/summary.json`, `screening.json`, `search/search.json`, and `physical-validation.json`; all values agree |
| DMV M2.29 | 72 candidates; 69 PRESENT/3 ABSENT_NATIVE; 87,564.2055 → 44,998.0956; selected 17 (12 MCV, 5 FD) | `dmv-m2-29.../search-summary.json` and `recommendation.json`; deployment DDL lists the same 12 MCV then 5 FD |
| M2.33 | PASS clean-room lifecycle; two-candidate/one-query fixture; cold/warm semantic objective, recommendation digest, and design equal; warm cache hit; offline advice while production stopped | `m2-33-docker-cleanroom/lifecycle-summary.json`; all nine checks PASS |

The system has no standalone M2.34 experiment directory.  M2.34 is the
documented core-freeze/release-candidate audit in `docs/roadmap.md` and
`docs/release-readiness.md`; it adds no new numerical claim or capability.

## C1--C10 claim audit

| Claim | Result | Boundary verified |
|---|---|---|
| C1 backend-local native MCV/FD substrate | PASS-WITH-SCOPE | PG16.14, one relation, arity-two, fixed target |
| C2 native PostgreSQL CE authority | PASS-WITH-SCOPE | supported native applicability/deserialization/composition path |
| C3 same-realization fidelity | PASS-WITH-SCOPE | same ordinary state, payload, order, design |
| C4 no per-design search-loop materialization | PASS | pre-search acquisition remains qualified |
| C5 bounded work/query-level reuse | PASS-WITH-SCOPE | operation counts, not wall-clock speedup |
| C6 contextual utility | PASS-WITH-SCOPE | observed DMV/Census interactions only |
| C7 deterministic ADD-only maintenance-constrained local design | PASS-WITH-SCOPE | product path terminates at `add-local-optimum`; no global-optimum claim |
| C8 production-separated lifecycle | PASS-WITH-SCOPE | M2.33 synthetic clean-room contract, DBA-controlled deployment |
| C9 independent-realization robustness | PASS-WITH-SCOPE | DMV M2.19/M2.20 only; not invariance |
| C10 externally fixed target | PASS | default `T=100`, target not searched |

No C1--C10 blocking mismatch or silent strengthening was found.

## Boundary, terminology, and overclaim audit

The manuscript consistently uses frozen/advisor-derived realization,
backend-local overlay, native PostgreSQL CE, `PRESENT`/`ABSENT_NATIVE`, fixed
target, ADD-only, and ADD-local-optimum terminology.  The current text keeps
ADD/DROP/SWAP as a library/development capability and does not present it as
the release product path.  Python is described as controlling state and
incidence/reuse, while PostgreSQL executes applicability, precedence, clause
consumption, deserialization, MCV/FD composition, and numeric CE.

The overclaim scan found no unqualified first/unique/general-PostgreSQL,
cross-version, global-optimum, CE-novelty, speedup, future-ANALYZE-equality,
invariance, or “no ANALYZE anywhere” claim.  Occurrences of “practical,”
“production,” and “invariant” are qualified by the research-prototype,
stock-production, or non-invariance boundaries.  “No per-design ANALYZE” is
consistently scoped to the search loop.

Section 9 acknowledges MNSA/workload-driven selection, AutoAdmin/DTA,
HypoPG, StatAdvisor/DB2, Oracle pending/import/export, PostgreSQL 19 restore,
and offline/test-server lifecycle precedents.  The surviving distinction is
the bounded PG16.14 native extended-statistics state substrate, not
hypothetical-statistics firstness or uniqueness.

Capture Bundle v1 is consistently described as persisted sample, workload
truth, and compatibility metadata.  Native payload bytes, ordinary
`pg_statistic` rows, the derived repository, search state, and recommendation
remain private-advisor outputs rather than capture contents.

## Production and reproducibility boundary

The paper maintains the stock PostgreSQL 16.14/read-only capture versus
private patched advisor split, no post-capture production credentials, and
DBA-controlled standard DDL/`ANALYZE` deployment.  Verification is state
verification; rollback is manual/optional and does not restore the previous
sampling realization.  M2.33 is explicitly a synthetic lifecycle fixture,
not a production-workload validation.

The package claims Docker clean-room semantic lifecycle reproducibility,
frozen-realization replay, and documented-environment determinism.  It does
not claim arbitrary-host, byte-for-byte image, cross-version, future-fresh-
`ANALYZE`, or production-workload equivalence.

## Evidence availability and package readiness

| Milestone | Status | Evidence/provenance |
|---|---|---|
| M2.18 | present | `experiments/dmv-m2-18-frozen-hyp-vs-physical/`; path exists at frozen implementation commit |
| M2.19 | present | `experiments/dmv-m2-19-fixed-design-fresh-sample-robustness/`; path exists at frozen implementation commit |
| M2.20 | present | `experiments/dmv-m2-20-multisample-design-stability/`; path exists at frozen implementation commit |
| M2.21 | present | `experiments/census-m2-21-frozen-authoritative/`; path exists at frozen implementation commit |
| M2.29 | present | `experiments/dmv-m2-29-end-to-end/`; path exists at frozen implementation commit |
| M2.33 | present | `experiments/m2-33-docker-cleanroom/`; path exists at frozen implementation commit |
| M2.34 | documentation-only | `docs/roadmap.md` and `docs/release-readiness.md`; no standalone experiment artifact and no manuscript numerical dependency |

The paper `Makefile` provides a canonical build with a documented fallback;
the bibliography, class/style files, and figures are repository-local.  No
absolute `/root/projects/...` path is used by the actual manuscript build;
absolute local paths occur only in provenance notes.  Build products remain
ignored and are not submission source files.

## Severity and freeze decision

### BLOCKING

None.

### IMPORTANT-NONBLOCKING

The author/affiliation/city/country/e-mail/DOI placeholders visible in the
PDF must be replaced by the human author before an actual submission.  This
audit does not fabricate metadata and does not treat the placeholders as a
scientific freeze failure.

### INFORMATIONAL

The PDF is 13 pages (references on page 13), and the system provenance HEAD
contains only post-freeze research notes beyond the frozen implementation.

Recommended tags (not created by this audit):

- system: `paper-v1-system` at `88797e4b82ff1d5c8bbba28dc27987af78ce78ad`;
- paper: `submission-v1` at the final paper HEAD after this audit note is
  committed.

The system provenance commits after the implementation freeze should remain
outside the implementation tag.

## Final recommendation

**A — FREEZE NOW.** No submission-blocking factual, evidence, provenance,
build, citation, or package issue was found.  The only remaining action is
human submission metadata completion; no manuscript or system correction is
justified by this audit.
