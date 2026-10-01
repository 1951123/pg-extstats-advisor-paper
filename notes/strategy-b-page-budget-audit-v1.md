# Strategy B page-budget and narrative-compression audit v1

## Audit scope and baseline

This is an analysis-only audit at commit `d5572295c223d8737ae2a17b5fcd39dd43961465` (also `origin/main`). The working tree was clean before the audit. The requested `paper/sections/10-discussion.tex` does not exist; the current Section 10 is `paper/sections/10-conclusion.tex`, which was audited instead. No manuscript, experiment, or system-repository file was modified in this milestone.

The current PDF is 15 pages. Pages 1--14 contain manuscript text; references begin on page 14 and continue on page 15. There are no standalone figure or table pages: the single substrate figure and all tables are embedded in normal text pages.

## Section-level budget

Page spans are inferred from the rendered PDF section starts and float locations; a span such as 5--7 includes the section's text and its embedded floats.

| Section | Pages | Role | Compression risk | Recommendation |
|---|---:|---|---|---|
| 1. Introduction | 1--3 (about 1.5) | motivation, boundary, contributions, RQs | MEDIUM | SHORTEN repeated alternatives, prior-art disclaimers, and architecture recap; keep problem boundary and contribution list |
| 2. Background and Motivation | 3--4 (about 1.5) | extstats context, prior-art setup, alternatives | MEDIUM/HIGH | MERGE tutorial material with Section 9 pointers; retain only context needed to understand payload state and the three alternatives |
| 3. Problem and System Contract | 4--5 (about 1.5) | formal workload, payload states, objective, correctness contract | PROTECT | Keep notation, payload-state table, fixed-target contract, and same-realization boundary |
| 4. Hypothetical Extended-Statistics Substrate | 5--7 (about 2.5) | core mechanism and Figure 1 | PROTECT | Do not compress the registration, ordered activation, native hooks, isolation, or substrate scope; only remove accidental repetition later |
| 5. Native-Semantic What-If Evaluation | 7--9 (about 2) | native CE boundary, reuse, lower bounds, correctness | PROTECT / LOW | Keep native CE and no-per-design materialization; review only the lower-bound exposition and duplicated alternative framing |
| 6. Advisor Search and Maintenance Constraint | 9--10 (about 1) | ADD-only search, budget, contextuality | MEDIUM/HIGH | SHORTEN pseudocode prose and repeated non-claims; preserve ADD-only semantics, target-specific cost, contextuality, and termination |
| 7. Production-Separated Architecture | 10--11 (about 1.5) | trust boundary, capture, advice, deployment, lifecycle | HIGH | First compression target; merge repeated Docker/qualification/security disclaimers while retaining the production/advisor boundary and rollback limits |
| 8. Evaluation | 11--13 (about 3) | five RQs and evidence tables | PROTECT | Keep all result tables and RQ interpretations; remove setup repetition and duplicate scope reminders only |
| 9. Related Work | 13--14 (about 1.5) | prior-art boundary and contribution distinction | MEDIUM | Keep HypoPG, Oracle/DB2, PostgreSQL 19, and the final bounded distinction; merge repeated “not novel/first” sentences |
| 10. Discussion, Limitations, and Conclusion | 14 (about 0.75) | synthesis and limitations | LOW | Already compact; do not compress before Sections 7, 8, 2, and 9 |
| References | 14--15 (about 1.5) | bibliography | PROTECT | No content deletion; later consider only venue-approved bibliography/layout controls |

## Figures and tables

| Item | Section / page | Purpose | Can shrink? | Can remove? |
|---|---|---|---|---|
| Figure 1, substrate architecture | Section 4 / pages 5--6 | Shows capture, repository, overlay, and native planner boundary | Slightly, if labels remain legible | No; protect |
| Table 1, payload-state contract | Section 3 / page 4 | Defines PRESENT/ABSENT_NATIVE/invalid states | Minor spacing only | No |
| Table 2, substrate scope | Section 4 / page 7 | Freezes supported system boundary | Minor spacing only | No |
| Table 3, evaluation-boundary alternatives | Section 5 / page 8 | Contrasts physical, external-CE, and native-state paths | Yes; shorten cell prose | No; it supports the core boundary |
| Table 4, evaluation populations | Section 8 / page 11 | Identifies DMV/Census roles and populations | Yes; tighten captions/cells | No |
| Table 5, RQ1 fidelity gates | Section 8 / page 11 | Same-realization correctness evidence | Slightly | No |
| Table 6, RQ2 bounded work | Section 8 / page 12 | Operation counts and exact repeat | Slightly | No |
| Table 7, RQ3 contextual designs | Section 8 / page 12 | DMV/Census design outcomes | Slightly | No |
| Table 8, RQ4 lifecycle evidence | Section 8 / page 12 | Production-separated closure | Slightly | No |
| Table 9, RQ5 robustness | Section 8 / page 13 | Independent-realization evidence | Slightly | No |

All nine tables are evidence or contract artifacts. The safest layout opportunity is reducing caption/cell prose or consolidating non-result setup text, not deleting a table.

## Repeated-concept audit

### Native CE authority

The concept appears in the Introduction, Background alternatives, the Substrate goals/implementation, Native Evaluation correctness boundary, Related Work, and Section 10. The strongest technical statement should remain in Sections 4--5, where the backend hooks and fidelity contract are defined. Section 1 should retain one short orientation sentence; Section 2 should point forward; Section 9 should preserve the novelty boundary; Section 10 should keep only its synthesis sentence. Avoid deleting the distinction from Section 5.

### Capture/payload distinction

The distinction is repeated in the Introduction, Problem contract, Substrate capture/repository text, Native Evaluation reconstruction, Architecture capture bundle, Evaluation setup, and Related Work. Keep the authoritative operational version in Section 7.2 and the formal input distinction in Section 3. Compress the Introduction, Section 5 setup, Section 8 setup, and Section 10 security paragraph to pointers rather than restating that capture does not contain payload bytes.

### Correctness versus robustness

The distinction is intentionally repeated in the Introduction, Problem correctness contract, Native Evaluation, Evaluation setup/RQ5, and Section 10. Keep the formal definition in Section 3.5 and the measured separation in Section 8.5. Section 1 and Section 10 can each retain one short reminder; do not merge correctness and independent-realization robustness into one claim.

### Prior-art disclaimer

The disclaimer occurs in the Introduction, Background, Search nonclaims, Related Work, and Section 10. Section 9 should carry the detailed acknowledgment, including HypoPG, Oracle/DB2, and PostgreSQL 19. Earlier sections should use a compact pointer. Section 10 should retain only its one synthesis sentence and not repeat the full family list if Section 9 remains adjacent.

## Sentence-level compression candidates

These are candidates only; no text was changed.

| Location | Current role | Suggested action | Risk |
|---|---|---|---|
| Introduction, alternatives paragraph | Reintroduces AutoAdmin, DTA, HypoPG, StatAdvisor, DB2, Oracle, and PG19 | SHORTEN to a one-sentence orientation and defer distinctions to Section 9 | MEDIUM: preserve novelty boundary |
| Introduction, “Registration validates candidate identity…” paragraph | Repeats substrate mechanics later specified in Section 4 | MERGE into one sentence pointing to the backend-local overlay | LOW/MEDIUM: do not lose ABSENT_NATIVE or order |
| Introduction, stock capture/advisor paragraph | Repeats Section 7 lifecycle | SHORTEN to production-stock/private-advisor separation | LOW |
| Background, “Existing what-if…” subsection | Prior-art setup overlaps with Section 9 | SHORTEN and retain only the motivation for the three alternatives | MEDIUM: keep acknowledgments |
| Background, Design alternatives | Repeats the same three-path framing in Introduction and Section 5 | MERGE the first two paragraphs; retain one transition to Sections 3--5 | MEDIUM |
| Substrate, design-goals paragraph | Lists five requirements also stated in Native Evaluation | KEEP core boundary; shorten list preamble only | MEDIUM: C1/C2/C4 risk |
| Native Evaluation, Section 5.5 lower bounds | Detailed pruning explanation is not central to semantic fidelity | SHORTEN or MOVE implementation detail to notes/docs; retain exact-bound safety claim | MEDIUM: C5 risk |
| Native Evaluation, Design alternatives table prose | Repeats Background alternatives | SHORTEN surrounding prose, keep table and one interpretation sentence | LOW/MEDIUM |
| Search, pseudocode/termination prose | Repeats ADD-only and non-optimality caveats | MERGE nonclaims into one paragraph after pseudocode | LOW if C7 remains explicit |
| Architecture, Docker/reproducibility paragraphs | Operational details and disclaimers occupy substantial space | MERGE Docker, clean-room, and qualification caveats; retain trust boundary and fail-closed behavior | MEDIUM: C8 risk |
| Evaluation, Experimental Setup and each RQ setup | Repeats fixed scope, sample, and no-wall-clock reminders | Keep setup table; remove repeated reminders from individual RQs where identical | MEDIUM: evidence readability |
| Related Work, repeated “not novel/first” sentences | Defensive wording appears in multiple subsections | Keep one precise boundary paragraph per prior-art family and one final synthesis | MEDIUM: novelty-boundary risk |
| Section 10, limitations list | Already compact and claim-calibrated | KEEP | HIGH if compressed prematurely |

Sentences over roughly 35 words cluster in the Introduction, Background, Substrate, Architecture, and evaluation captions. Long equations, table captions, and formal definitions should not be shortened merely for word count; prioritize prose that repeats content elsewhere.

## Section-specific recommendations

- **Introduction:** It repeats background and the alternatives more than necessary. Keep the problem, central boundary, four contributions, and RQs; compress the prior-art catalogue and lifecycle recap.
- **Background:** Tutorial material can shrink. Move detailed prior-art positioning to Section 9, but retain enough PostgreSQL payload/target context to make the problem contract intelligible.
- **Problem:** Protect the $R$, payload-state, objective, target, and same-realization definitions. Do not remove the payload-state table or correctness distinction.
- **Substrate:** Protect the definition, Figure 1, registration, ordered activation, native hooks, and isolation. Only remove repeated prose that appears in Sections 1 and 5.
- **Native Evaluation:** Protect the native CE boundary and no per-design materialization distinction. Review Section 5.5 lower-bound detail first.
- **Search:** Compress the exposition around pseudocode and maintenance model, not the algorithm contract. Preserve ADD-only behavior, fixed target, contextual utility, exact objective, and termination.
- **Architecture:** Highest-value compression target. Merge lifecycle and Docker detail without removing the stock-production/private-advisor trust boundary, capture semantics, DBA control, rollback limitation, or fail-closed checks.
- **Evaluation:** Protect result tables and interpretations. Only compress repeated setup prose and duplicate scope reminders.
- **Related Work:** Medium target. Keep all requested HypoPG, Oracle, DB2, PG19, and workload-selection distinctions; remove defensive repetition.
- **Discussion:** Keep. It is already compact and appropriately scoped.

## Recommended compression sequence

| Rank | Action | Expected saving | Claim risk |
|---:|---|---:|---|
| 1 | Compress Section 7 Docker/lifecycle/reproducibility prose and remove repeats already covered by Section 8 Table 8 | 0.5--0.75 page | LOW/MEDIUM; preserve C8 and security limitations |
| 2 | Remove repeated evaluation setup/scope sentences and tighten captions/cells without deleting Tables 4--9 | 0.4--0.6 page | MEDIUM; preserve C3, C5, C6, and C9 evidence context |
| 3 | Merge Section 2 background alternatives with the Introduction/Section 9 pointers | 0.4--0.6 page | MEDIUM; retain all prior-art acknowledgment |
| 4 | Shorten Section 5.5 lower-bound detail and surrounding alternative prose | 0.25--0.4 page | MEDIUM; retain safe-bound and C5 statements |
| 5 | Remove duplicate prior-art disclaimers in Introduction/Section 10 after Section 9 is authoritative | 0.2--0.35 page | MEDIUM; avoid weakening novelty boundary |
| 6 | Apply figure/table spacing or caption layout improvements only after prose compression | 0.2--0.4 page | LOW visual risk, but inspect legibility |

The first five actions plausibly remove about 1.75--2.7 pages. Reaching a 12-page target likely requires the figure/table layout step; a 13-page target may be reachable with prose-only compression. No action should remove the substrate figure, payload-state table, RQ result tables, or formal correctness definitions.

## Hard-constraint check

The plan preserves all frozen claims: C1 substrate, C2 native CE authority, C3 same-realization fidelity, C4 no per-design materialization, C5 bounded work, C6 contextuality, C7 ADD-only search, C8 lifecycle separation, C9 DMV-only bounded robustness, and C10 fixed target. No recommendation relies on a new experiment, new optimizer, new CE semantics, or a stronger novelty claim.

## Self-review

1. **Which 2--3 pages can be safely removed?** Approximately two pages can be removed most safely from Section 7, repeated Section 8 setup prose, and Section 2/9 acknowledgement duplication. A third page would require conservative figure/table layout tightening.
2. **Which sections are untouchable?** Sections 3 and 4, the native-boundary core of Section 5, the evidence tables and RQ results in Section 8, Figure 1, and the payload-state/scope tables.
3. **Which repeated concepts can merge?** Native CE authority, capture-versus-payload, prior-art disclaimers, and repeated same-realization/robustness reminders can each have one authoritative technical statement plus short pointers.
4. **Which figures/tables are essential?** Figure 1 and Tables 1--9 are contract or evidence artifacts; none is a safe deletion candidate. Captions and cell prose can be tightened.
5. **Does the plan preserve the novelty boundary?** Yes. Section 9 remains the detailed prior-art authority, and all edits are recommended as acknowledgments-preserving compression.
6. **Does it preserve evidence strength?** Yes, provided result tables, populations, same-realization gates, operation counts, lifecycle checks, and DMV robustness values remain unchanged.

## Audit conclusion

The manuscript is approximately two to three pages above a likely 12--13-page target, but the excess is concentrated in repeated framing and operational prose rather than in the mechanism or evidence core. The safest next milestone is a targeted Section 7/8/2 compression pass, followed by a separate visual-layout pass. This note is the only artifact changed by this audit.

## Phase 1 compression update

- **Files changed:** `paper/sections/01-introduction.tex`, `paper/sections/02-background.tex`, `paper/sections/07-architecture.tex`, and `paper/sections/08-evaluation.tex`.
- **Pages:** 15 before the pass; 14 after the pass; one rendered page saved.
- **Estimated saved pages:** approximately 0.8--1.0 page, consistent with the Phase 1 target.
- **Compressed themes:** Section 7 Docker and lifecycle implementation detail; Section 8 repeated setup/scope prose; Introduction/Background prior-art catalogue repetition; repeated capture/payload and native-authority framing.
- **Preserved claims:** C1--C10, all RQ headings and numerical results, every evaluation population, every evidence table, Figure 1, the Section 3 contract, the Section 4 substrate definition, the Section 5 native-CE boundary, and the Section 9 prior-art distinctions.
- **Validation:** `make` succeeded, `git diff --check` passed, and the rendered pages were inspected. No horizontal overfull boxes, undefined citations/references, or LaTeX errors were introduced.
