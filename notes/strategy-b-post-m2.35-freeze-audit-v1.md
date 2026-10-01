# Post-M2.35 Submission v2 Freeze Audit

Audit performed against paper `1619c28a6031dffd2db3117a9c699d659c0b8331`
and system `617c7c288a4ea97bf7c95286f151164c547c02a6`.

No experiment was run, no Census search was rerun, and no manuscript or
system semantic change was made in this audit.

## Repository and tag state

| Item | Verified value |
|---|---|
| Paper HEAD / `origin/main` | `1619c28a6031dffd2db3117a9c699d659c0b8331` |
| System HEAD / `origin/main` | `617c7c288a4ea97bf7c95286f151164c547c02a6` |
| Frozen implementation tag `paper-v1-system` | `88797e4b82ff1d5c8bbba28dc27987af78ce78ad` |
| Previous paper tag `submission-v1` | `33d76c87b17ccb44597361cae378e00b8020a5bb` |
| Working trees | clean before this note |

Neither existing tag was moved.

## M2.35 provenance audit

The M2.35 protocol, summary, per-configuration results, and note agree on:

| Fact | Artifact value | Status |
|---|---:|---|
| PostgreSQL | 16.14 patched advisor | PASS |
| Frozen implementation | `paper-v1-system` / `88797e4b82ff1d5c8bbba28dc27987af78ce78ad` | PASS |
| Persisted sample | 30,000 rows | PASS |
| Workload | 1,963 queries | PASS |
| Fixed target | 100 | PASS |
| Configurations | 26 | PASS |
| Configuration size range | 0--72 | PASS |
| MCV-only configurations | 5 | PASS |
| FD-only configurations | 5 | PASS |
| Mixed configurations | 15 | PASS |
| Configurations containing `ABSENT_NATIVE` | 11 | PASS |
| Overlap/precedence-sensitive configurations | 21 flagged | PASS |
| Exact objectives | 26/26 | PASS |
| Exact estimate entries | 51,038/51,038 | PASS |
| Exact q-error entries | 51,038/51,038 | PASS |
| Selected payload checks | 396/396 | PASS |
| Full-candidate payload checks | 1,872/1,872 | PASS |
| Mismatches | 0 | PASS |

The prior M2.35 note records a complete deterministic rerun with identical
configuration ordering, suite membership, semantic per-configuration results,
comparison totals, and summary (diagnostic wall-clock timing excluded).  The
protocol records the frozen implementation tag separately from the later
harness/result provenance commits.

## RQ1 scope audit

The manuscript distinguishes the earlier M2.18 one-final-design result from
M2.35's 26 representative configurations.  It reports the M2.18 1,963-query
and 31-payload gates separately from M2.35's 51,038-entry aggregate checks.

The interpretation remains bounded to the validated PostgreSQL 16.14 fragment
and one fixed realization.  It does not imply exhaustive coverage of the
`2^72` design space, arbitrary PostgreSQL correctness, cross-version or
cross-realization equality, future-`ANALYZE` equality, all statistics kinds,
or all predicate fragments.

`ABSENT_NATIVE` and overlap/precedence cases are described as representative
coverage.  The manuscript does not claim correctness for every possible
design or exhaustive validation of every precedence interaction.

## Census screening semantics audit

The manuscript retains the required distinction:

* the source universe is all 4,506 candidates;
* the deterministic preregistered raw singleton-improvement screen retains
  the top 5%, namely 226 candidates;
* all 226 happened to be `PRESENT` in that frozen realization;
* the screen is a benchmark-specific computational visibility restriction /
  tractability heuristic, not correctness-preserving pruning, a dominance
  rule, or an exact bound;
* the 2,441 exact-bound prunes occur separately inside the visible search.

The paper also retains the DMV evidence that 12 selected candidates had
negative singleton utility and became useful in context.  It therefore does
not present the Census screen as a safe singleton-pruning rule.

## C1--C10 claim audit

| Claim | Status | Scope retained |
|---|---|---|
| C1 backend-local native extstats substrate | PASS-WITH-SCOPE | PG16.14, supported base-relation MCV/FD fragment |
| C2 native PostgreSQL CE authority | PASS-WITH-SCOPE | native applicability, precedence, consumption, composition, and CE |
| C3 same-realization fidelity | PASS-WITH-SCOPE | strengthened by M2.35 representative configurations; one fixed realization |
| C4 no per-design search-loop materialization | PASS | acquisition is pre-search; no per-design search-loop `ANALYZE` claim |
| C5 bounded work / query-level reuse | PASS-WITH-SCOPE | operation counts and reuse, not physical speedup |
| C6 contextual utility | PASS-WITH-SCOPE | tested DMV/Census candidate sets, no pruning theorem |
| C7 deterministic ADD-only local design | PASS-WITH-SCOPE | release-qualified search and ADD-local termination |
| C8 production-separated lifecycle | PASS-WITH-SCOPE | synthetic Docker clean-room, stock production boundary |
| C9 independent-realization robustness | PASS-WITH-SCOPE | DMV only; not design invariance |
| C10 externally fixed target | PASS-WITH-SCOPE | fixed before acquisition/advice/search; no target optimization |

## Overclaim regression scan

The potentially sensitive terms were reviewed in context.  All occurrences
are bounded or explicitly negated:

| Risk | Result |
|---|---|
| Exhaustive configuration-space correctness | No claim; Section 4 and RQ1 say representative/representable subsets |
| Full 4,506-candidate Census search | Explicitly disclaimed in RQ3 |
| Safe singleton pruning | Explicitly rejected; Census screen is heuristic |
| Global optimum | Explicitly disclaimed in Sections 8 and 10 |
| Physical or end-to-end tuning speedup | Explicitly disclaimed; no physical-per-design baseline |
| Query-latency improvement | Explicitly disclaimed |
| Production readiness | Explicitly disclaimed; deployment remains DBA-controlled |
| Generic, cross-version, or higher-arity PostgreSQL support | Explicitly scoped out |
| Cross-realization or future-`ANALYZE` equality | Explicitly disclaimed |
| CE-Replay as runtime mechanism | Identified as historical context only |

The word “invariant” in Section 4 describes the state-versus-CE architectural
boundary, not invariance of designs or realizations; the latter is explicitly
excluded in Section 10.

## Evaluation interpretation

* **RQ1:** representative same-realization fidelity across multiple designs.
* **RQ2:** bounded advisor operation counts and query-level reuse, not physical
  speedup.
* **RQ3:** contextual design behavior within declared candidate sets, not a
  global optimization result.
* **RQ4:** synthetic Docker lifecycle closure, not production workload
  validation.
* **RQ5:** DMV-only realization robustness, not realization or design
  invariance.

The approximately 45--46 second M2.35 runtime is absent from the manuscript
and remains diagnostic only.

## Numerical discrepancy table

| Newly introduced manuscript quantity | Paper | Authoritative artifact | Result |
|---|---:|---:|---|
| M2.35 configurations | 26 | `summary.json`: 26 | none |
| M2.35 estimate/q-error entries | 51,038 each | `summary.json`: 51,038 each | none |
| M2.35 selected payload checks | 396 | `summary.json`: 396 | none |
| M2.35 full-candidate payload checks | 1,872 | `summary.json`: 1,872 | none |
| M2.18 final objective | 22,014.061316846422 | M2.18 run artifact | none |
| Empty-design baseline | 42,791.986 | M2.18 run artifact | none |

No discrepancy was found; no numerical correction is required.

## Submission-v2 delta from `submission-v1`

The only substantive manuscript delta is in Section 8:

1. the Census screening-semantics clarification (raw all-4,506 top-5%
   heuristic, 226 retained, all observed `PRESENT`, separate exact-bound
   pruning); and
2. the RQ1 extension from the single M2.18 final design to M2.35's 26
   representative same-realization configurations.

No abstract thesis, Introduction contribution list, search semantics,
robustness claims, production architecture, related-work boundary, or
conclusion thesis changed.  The paper diff from `submission-v1` contains only
the Section 8 manuscript edit plus the prior audit note.

## Build and visual validation

The canonical paper build passed.  The resulting PDF has 13 pages, with
references on page 13.  Undefined citations/references: 0.  Overfull boxes:
0.  Type3 fonts: 0.  All fonts are embedded.  Pages 10--11, containing the
M2.35 RQ1 update and the Census screening/contextuality text, were visually
inspected; tables and prose remain legible and unambiguous.

## Severity and freeze decision

### BLOCKING

None.

### IMPORTANT-NONBLOCKING

The historical M2.18 repository directory is unavailable; M2.35 uses the
retained M2.17b build-1 payload cache and documents its digest and logical
catalog/OID distinction.  Payload, ordinary-statistics, and fidelity gates
are exact, so this is a provenance caveat rather than a claim-scope failure.

### INFORMATIONAL

The `submission-v2` tag has not yet been created, as required by this audit
instruction.  Existing author metadata placeholders remain a separate human
submission action.  Missing physical-per-design latency, EXPLAIN ANALYZE
latency, and Census multi-realization robustness are explicitly optional
extensions and are not freeze blockers.

## Decision

**FREEZE AS `submission-v2`.**

No manuscript correction is required before tagging.  This audit note is the
only new file created by this milestone; the tag should be created separately
after human approval.
