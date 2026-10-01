# Strategy B final reviewer simulation audit v1

## Audit baseline and scope

This is a read-only reviewer simulation at `b1be338a09ba7cf408cac80c00834872dec820a3` (`origin/main`). The complete manuscript Sections 1--10 and the claims matrix, claims/evidence audit, page-budget audit, and related-work boundary notes were reviewed. The working tree was clean before this audit. No manuscript, experiment, system-repository, or PDF-source file was modified for the audit.

The current rendered manuscript is 13 pages after the two prose-compression phases. All result tables and the substrate figure remain present.

## Reviewer A: novelty and positioning

### 1. Surviving contribution

The contribution is stated consistently at four levels:

- The abstract describes a backend-local what-if substrate for the supported PostgreSQL 16.14 extended-statistics fragment.
- The Introduction identifies the boundary as virtualizing statistics state rather than cardinality-estimator semantics and lists the native substrate and native-semantic evaluation contributions.
- Section 4 defines the substrate: advisor-derived native MCV/FD payload or `ABSENT_NATIVE`, candidate identity, backend-local registration, ordered activation, and native planner hooks.
- Section 9 closes with the bounded distinction: native MCV/FD states are bound to candidate objects and an ordered active subset is exposed to PostgreSQL while estimator semantics remain native.

### 2. HypoPG acknowledgment

HypoPG is explicitly acknowledged in the Introduction, Background, and Related Work. Section 9 calls it the closest PostgreSQL pattern for planner-visible backend-local hypothetical indexes and states that this paper does not claim to be the first what-if interface or backend-local hypothetical object.

### 3. Distinction clarity

The distinction is clear and technically specific: HypoPG virtualizes hypothetical index objects, whereas this work retains native MCV/FD payload state, explicit `ABSENT_NATIVE`, acquisition identity, and ordered active subsets for PostgreSQL's native extended-statistics lookup and CE path. The manuscript does not claim that HypoPG cannot be extended.

### 4. Overclaim check

No sentence makes a firstness, uniqueness, generic-PostgreSQL, new-CE, or new-statistics-selection claim. The phrase “practical what-if boundary” in the conclusion is scoped to the validated fragment. “Unique precedence rank” and “unique target-relation estimate” are technical identity conditions, not novelty claims. Reviewer A's likely attack is therefore answered, with only the normal risk that a reader skimming the Introduction may initially equate “backend-local what-if” with HypoPG before reaching Section 9.

**Reviewer A assessment: PASS; LOW residual positioning risk.**

## Reviewer B: systems contribution

The mechanism is understandable without source code. Figure 1 separates production capture, the advisor-derived repository, the backend-local overlay, and the native planner. Section 4 then defines the same separation in prose and table form:

1. **Statistics-state virtualization:** a frozen realization supplies native candidate state; a design changes active membership/order rather than recomputing payloads.
2. **Payload repository:** definitions are bound to PRESENT native bytes or `ABSENT_NATIVE`, with acquisition identity and validation metadata.
3. **Backend-local overlay:** registration and activation are private to the advisor backend/session and do not modify production catalog state.
4. **Ordered activation:** effective precedence is represented explicitly and validated before publication.
5. **Native CE consumption:** PostgreSQL's applicability, precedence, clause consumption, deserialization, MCV/FD composition, and numeric estimate remain in the native path.

Section 5 reinforces the pipeline with `register/activate -> EXPLAIN -> Plan Rows -> q-error`, the no-search-time-materialization distinction, and the same-realization correctness contract. The compression did not remove any of these definitions.

**Reviewer B assessment: PASS; LOW residual understandability risk.** The only minor risk is that Figure 1 is dense, but the surrounding text makes each component explicit.

## Reviewer C: evaluation validity

| RQ | Evidence actually presented | Stronger claim avoided? | Assessment |
|---|---|---|---|
| RQ1 | DMV M2.18 same-realization estimate/q-error/objective/payload equality | No fresh-ANALYZE, join, cross-version, or full-planner equality | PASS |
| RQ2 | Census M2.21 operation counts, query-level reuse, exact repeated trajectory, and physical validation | No wall-clock speedup or quantified physical-per-design savings | PASS |
| RQ3 | DMV/Census contextual ADD-only designs and negative-singleton rescues | No submodularity theorem, global optimum, or universally safe singleton pruning | PASS |
| RQ4 | M2.33 synthetic clean-room lifecycle PASS with stock production/private advisor separation | No production readiness, automatic deployment/rollback, security guarantee, or arbitrary-schema generalization | PASS |
| RQ5 | DMV M2.19 fresh realizations and M2.20 persisted-sample selected-design comparison | No universal robustness, design invariance, drift, Census robustness, or cross-version claim | PASS |

No RQ currently supports a stronger claim than its measured population and protocol. Census remains the authoritative corrected search case; DMV remains the robustness population; M2.33 remains a synthetic lifecycle fixture.

**Reviewer C assessment: PASS; LOW residual evaluation-risk.**

## Compression-damage audit

The Phase 1/2 edits preserve:

- the Section 3 formal problem, payload states, fixed target, and correctness contract;
- the Section 4 substrate definition, Figure 1, repository, registration, ordered activation, native hooks, and isolation;
- the Section 5 native CE authority, no per-design search-loop `CREATE/DROP/ANALYZE`, exact q-error lower bound, and same-realization versus robustness distinction;
- the Section 6 deterministic contextual ADD-only scope, maintenance model, contextual marginal equation, and ADD-local termination;
- the Section 7 stock-production/private-advisor boundary, DBA control, verification and rollback limitation, and fail-closed architecture;
- all Section 8 RQ headings, populations, tables, numerical results, and limitations;
- the Section 9 HypoPG/Oracle/DB2/PG19 distinctions and bounded final positioning;
- the Section 10 limitation summary and conclusion.

No numerical result, evidence table, figure, experiment identifier, claim ID, or scope boundary was removed. No compression damage was found.

## Reading-flow audit

The first three rendered pages answer the expected reader questions:

1. **What problem?** The Introduction identifies data-dependent MCV/FD payloads and the repeated physical-state step in configuration search.
2. **Why are existing approaches insufficient?** It contrasts repeated physical materialization with external CE emulation that risks semantic drift, while acknowledging established what-if and statistics-management families.
3. **What mechanism?** It introduces native-state virtualization, frozen payload/absence states, backend-local registration, ordered activation, and native `EXPLAIN` before the formal contract begins.
4. **Why native CE?** The Introduction explicitly says PostgreSQL continues applicability, winner selection, clause consumption, deserialization, composition, and numerical estimation; Sections 4--5 then define and test that boundary.

The reading flow is therefore adequate. No reviewer-facing ambiguity severe enough to justify an unplanned manuscript edit was found.

## Final claim-stress test

| Phrase / occurrence class | Classification | Reason |
|---|---|---|
| `first`, `unique` in technical identity phrases (`unique precedence rank`, `unique target-relation node`) | OK | Local identity/selection conditions, not novelty claims |
| `novel` / `not novel` in Sections 9--10 | OK | Used to disclaim production/test-server, restoration, selection, and hypothetical-object novelty |
| `practical what-if boundary` in Section 10 | OK / QUALIFIED | Explicitly scoped to PostgreSQL extended statistics in the validated fragment |
| `robust` / `robustness` | OK / QUALIFIED | DMV-only independent-realization evidence; no invariance or generalization claim |
| `production` / `production-ready` | OK / QUALIFIED | Stock production separation is claimed; production readiness is explicitly denied |
| `efficient`, `scalable` | No substantive occurrence | No unsupported performance/scalability claim remains |

## Remaining risks

- **MEDIUM:** A fast skim of the Introduction may briefly read “backend-local what-if” as a HypoPG-style claim before the index-versus-MCV/FD distinction in Section 9. This is a positioning/read-order risk, not a substantive overclaim.
- **LOW:** Section 4 is dense and implementation-specific, although Figure 1 and Section 5's pipeline provide the required explanation.
- **LOW:** The 13-page layout places the end of Section 10 and references on the final page; no overfull or citation problem was observed.

## Recommended final changes

No mandatory manuscript edits. The current text already contains the safest reviewer-facing qualifications. Any further shortening should wait for venue-specific typesetting and should not remove the Section 9 distinction, Section 5 correctness boundary, or Section 8 population qualifiers.

## Audit conclusion

The compressed Strategy B manuscript passes the novelty/positioning, systems-mechanism, evaluation-validity, compression-damage, and reading-flow audits. The contribution is narrower than “HypoPG for extended statistics”: it is a PG16.14 backend-local native MCV/FD state overlay with ordered transient subset activation and native CE consumption, evaluated under explicitly bounded claims.
