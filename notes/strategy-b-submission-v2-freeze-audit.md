# Strategy B Submission v2 Freeze Audit

## Freeze inputs

- Paper HEAD before this audit commit: `947f4e550a14e44d866b1f8099b788f01e8913f1`.
- System HEAD: `5e457160a125c4f33292f59968f511e41fd5fb75`.
- Frozen implementation tag: `paper-v1-system` ->
  `88797e4b82ff1d5c8bbba28dc27987af78ce78ad`.
- Previous paper tag: `submission-v1` ->
  `33d76c87b17ccb44597361cae378e00b8020a5bb`.

## v1 to v2 substantive delta

The manuscript delta is limited to the previously frozen Census search-scope
clarification, the M2.35 representative-configuration RQ1 expansion, and the
M2.36 bounded DMV physical-materialization-cost evidence.  A final factual
wording fix in RQ2 states that materialization is measurable/removable while
shared native `EXPLAIN` remains the dominant common cost.  No experiment was
rerun and no system artifact was changed.

## Consistency checks

The Census catalog is 4,506 candidates; the preregistered raw top-5% screen
retains 226 search-visible candidates.  The 19,210 conceptual/feasible moves,
2,441 exact-bound prunes, 16,769 native evaluations, and 88,654 planner calls
are all explicitly scoped to that 226-candidate search.  The manuscript keeps
the screen as a tractability heuristic, not correctness-preserving pruning,
and retains the 12 negative-singleton DMV contextual rescues.

M2.35 remains representative same-realization fidelity evidence within
PostgreSQL 16.14, one persisted realization, and the supported fragment.  It
reports 26/26 exact objectives and estimate/q-error entries of 51,038/51,038,
396/396 selected payload checks, and 1,872/1,872 full-repository payload
checks.  No exhaustive `2^72`, arbitrary-version, cross-realization,
future-`ANALYZE`, join, or higher-arity claim is introduced.

M2.36 matches the authoritative system artifact: six DMV designs; physical
materialization median 0.1168 s; hypothetical activation median 0.000421 s;
physical/hypothetical totals 0.3921 s/0.2795 s; median ratio 1.414x; observed
range 1.326--1.668x; same 1,963 planner calls; one warmup and three measured
repetitions; no cache flushing.  It is presented only as a bounded DMV
materialization-cost characterization.  The manuscript states that the
materialization component is measurable/removable while shared native
`EXPLAIN` remains the dominant common cost; it makes no universal, production,
end-to-end, Census-scale, or query-latency speedup claim.

## C1--C10 audit

| Claim | Status |
|---|---|
| C1 backend-local native extended-statistics substrate | PASS-WITH-SCOPE |
| C2 native PostgreSQL CE authority | PASS-WITH-SCOPE |
| C3 same-realization fidelity | PASS-WITH-SCOPE |
| C4 no per-design search-loop materialization | PASS-WITH-SCOPE |
| C5 bounded work / query-level reuse | PASS-WITH-SCOPE |
| C6 contextual utility | PASS-WITH-SCOPE |
| C7 deterministic ADD-only local design | PASS-WITH-SCOPE |
| C8 production-separated lifecycle | PASS-WITH-SCOPE |
| C9 DMV-only independent-realization robustness | PASS-WITH-SCOPE |
| C10 externally fixed target | PASS-WITH-SCOPE |

M2.35 strengthens C3; M2.36 adds bounded quantitative support for the cost
significance of C4.  No new headline claim is added.

## Overclaim and related-work scan

The manuscript contains no implication of a full 4,506-candidate search, safe
singleton pruning, exhaustive configuration correctness, global optimum,
general/production/Census speedup, query-latency improvement, generic or
cross-version PostgreSQL support, future-`ANALYZE` equality, design
invariance, automatic target selection, or CE-Replay as the runtime mechanism.
HypoPG, AutoAdmin/DTA, MNSA, StatAdvisor/DB2, Oracle pending/import/restore,
PostgreSQL 19 restore, and offline/test-server precedents remain acknowledged.

Sample-size scaling inference is absent; no unmeasured scaling statement was
added.

## Build and preflight

- Canonical `make`: PASS.
- PDF: 13 pages; references present on page 13.
- Undefined citations/references: 0.
- Horizontal overfull boxes: 0.
- Fonts: all embedded; Type3 count 0.
- Visual inspection completed for the Introduction, Section 5, Section 8
  RQ1/RQ2/RQ3, Section 10, and the references page.

## Blocking and nonblocking issues

No scientific, evidence, scope, or build blocking issue remains.  Submission
metadata placeholders (author, affiliation, city, email, DOI/reference
metadata) remain packaging actions and are not scientific blockers.

## Decision

**FREEZE AS `submission-v2`.**

This note is the final audit record.  No system files, experiment artifacts,
tags, or prior freeze tags were modified.
