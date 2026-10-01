# Strategy B camera-ready consistency audit v1

## Baseline and manuscript change

Audit baseline: `667ad3022be1052dfae75c5498ffb8cac8b83a34` (`origin/main`), 13 rendered pages. The complete manuscript, claims matrix, evidence audit, page-budget audit, and related-work boundary were reviewed. One clear presentation inconsistency was found in Section 9: “and and commit material”. It was corrected to “and commit material”. No scientific wording, claim, number, RQ, experiment, or structure was changed.

## 1. Title assessment

**KEEP:** `Native What-If Evaluation of PostgreSQL Extended-Statistics Configurations`.

The title matches the backend-local native-state what-if contribution, does not claim a new CE or optimizer, does not claim the first hypothetical statistics system, and does not imply a general statistics advisor. No alternative title is required.

## 2. Abstract assessment

The sentence-level audit is recorded in `notes/strategy-b-abstract-audit-v1.md`. The abstract clearly states state virtualization, native estimator semantics, PG16.14/fragment scope, and the five evidence categories. It explicitly denies new CE, search novelty, global optimum, latency, and physical-evaluation speedup. It does not imply firstness, general PostgreSQL support, or automatic production deployment.

**Status: PASS.**

## 3. Terminology consistency

- **Statistics state:** Used for the virtualized native state and active membership/order.
- **Payload:** Used for derived MCV/FD bytes or the explicit `ABSENT_NATIVE` state.
- **Realization:** Used for one frozen, data-derived statistics instance.
- **Configuration/design/object:** Used for a selected candidate subset or catalog definition; the formal distinction is explicit in Sections 2--5.
- **Hypothetical:** Used for the transient native-state configuration/substrate. HypoPG is separately identified as hypothetical indexes, avoiding terminology conflation.
- **Native:** “Native CE” and “native planner/statistics path” consistently mean PostgreSQL’s supported applicability, consumption, deserialization, composition, and estimate path.

No terminology normalization is required beyond the grammar fix noted above.

## 4. Boundary preservation

| Boundary | Status | Evidence in manuscript |
|---|---|---|
| C1 backend-local native extstats substrate | PRESERVED | Abstract, Sections 4--5, Section 9 |
| C2 PostgreSQL owns estimator semantics | PRESERVED | Figure 1 caption, Sections 4--5 |
| C3 same-realization correctness | PRESERVED | Sections 3, 5, RQ1 |
| C4 no per-design search-loop `CREATE/DROP/ANALYZE` | PRESERVED | Abstract, Section 5, RQ2 |
| C5 bounded evaluation work | PRESERVED | Section 5, Section 8 RQ2 |
| C6 contextual design utility | PRESERVED | Section 6, Section 8 RQ3 |
| C7 ADD-only product search | PRESERVED | Section 6, Section 8 RQ3 |
| C8 production separation | PRESERVED | Figure 1, Section 7, RQ4 |
| C9 DMV-only robustness | PRESERVED | Abstract, Introduction, RQ5, Section 10 |
| C10 fixed target | PRESERVED | Sections 2--4, Section 6, Section 10 |

No boundary is missing or weakened.

## 5. Figure and table captions

Figure 1 is standalone-readable: its caption states that native candidate state is derived from persisted capture, registered in a backend-local overlay, and exposed as an ordered active subset to PostgreSQL’s native statistics path; it explicitly says the overlay virtualizes state while the planner retains estimator semantics. This is sufficient and contains no unsupported claim.

All table captions accurately identify their contract/evidence scope: payload-state contract, supported substrate, evaluation alternatives, populations, RQ1 fidelity, RQ2 bounded work, RQ3 contextual designs, RQ4 synthetic clean-room lifecycle, and RQ5 DMV realization robustness. No caption implies generalization beyond its population.

## 6. Related-work citation audit

Section 9 acknowledges all required families:

- HypoPG;
- AutoAdmin and SQL Server DTA;
- MNSA;
- StatAdvisor and DB2 statistical views/column groups;
- Oracle pending and import/export statistics;
- PostgreSQL 19 `pg_restore_extended_stats()` and commit material.

The distinctions remain descriptive rather than priority claims. HypoPG is distinguished as hypothetical indexes; Oracle/DB2 as testing, transport, views, and matching; PG19 as persistent restore/update; and this work as a bounded PG16.14 native MCV/FD state overlay with transient ordered subset activation.

## 7. Remaining reviewer risks

- **MEDIUM:** A reader skimming only the Introduction may initially associate “backend-local what-if” with HypoPG; Section 9 resolves the distinction and no edit is required.
- **LOW:** Section 4 is dense, but Figure 1 and Section 5’s explicit pipeline make the mechanism understandable without code.
- **LOW:** The final page combines the tail of Section 10 and references; the 13-page PDF has no overfull boxes or citation failures.

## 8. Recommended edits

The only required edit was the Section 9 duplicated conjunction. No further manuscript edits are recommended. Future venue-specific typesetting should preserve the Figure 1 caption, Section 5 same-realization wording, Section 8 population qualifiers, and Section 9 prior-art distinctions.

## Audit conclusion

The manuscript is camera-ready from a consistency and claim-boundary perspective after the single grammar correction. No new experiment, claim, RQ, evidence, or scientific positioning was introduced.
