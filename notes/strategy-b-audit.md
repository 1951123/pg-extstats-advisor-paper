# Strategy B independent evidence and paper-redesign audit

Audit date: 2026-09-30.  This is a planning/provenance record, not
manuscript prose.  The audit used the frozen system repository at
`88797e4b82ff1d5c8bbba28dc27987af78ce78ad`, the paper repository baseline at
`ccae657102560fe636b76f10f9c0e97442e9a06e`, and the legacy repository at
`dd05966f65066a299f637978cd5f11db177a477b`.  No experiment, rebuild, or
legacy/system modification was performed.

## 1. Actual product mechanism

The release-qualified path is `capture -> validate -> offline advise ->
preflight -> DBA-controlled deployment -> ANALYZE -> verification`.  Capture
is read-only on stock PostgreSQL and persists a sealed bundle containing a
canonical sample, workload/truth, schema, and compatibility metadata.  It
does not persist ordinary `pg_statistic` rows or extended-statistics payload
bytes.

During offline advice, a private PostgreSQL 16.14 advisor backend stages the
persisted sample and reconstructs the derived statistics realization.  On a
cache miss, candidate shells are created, the fixed target is applied, one
relation-grouped acquisition `ANALYZE` is performed, and PostgreSQL native send
functions serialize the candidate MCV/FD payloads (including `ABSENT_NATIVE`
states) into a content-addressed repository.  A cache hit recreates the shell
catalog and performs the required pre-search shell realization, then reuses
the cached repository.  This acquisition/recreation work is outside the
per-design search loop.

For each search state, `PostgresAdapter` registers the frozen native payload
bytes or absent markers with the patched backend-local overlay and activates an
ordered OID subset.  PostgreSQL's own extended-statistics code then filters,
orders, consumes, deserializes, combines, and applies the MCV/FD state while
`EXPLAIN (FORMAT JSON)` supplies the estimate.  The Python evaluator does not
reimplement those estimator rules.  A move changes the active overlay and
native-plans only the conservative incidence-affected queries; unaffected
query evaluations are reused.  There is no per-move `CREATE/ALTER/DROP
STATISTICS` or `ANALYZE`.

The product-qualified `advise_fixed_t` workflow uses deterministic ADD-only
search.  The library also exposes a development full ADD/DROP/SWAP mode, but
that is not the release-qualified product claim.  Physical deployment is a
separate standard-DDL step followed by DBA-controlled `ANALYZE` and
verification.

Smallest faithful pipeline:

```text
stock read-only capture
  -> persisted sample/workload/truth bundle
  -> private advisor relation + one derived native repository
  -> backend-local register(payload/ABSENT_NATIVE)
  -> activate(ordered hypothetical OID subset)
  -> native PostgreSQL EXPLAIN for affected queries
  -> fixed-T contextual search
  -> recommendation DDL / later physical ANALYZE
```

## 2. Candidate mechanism claim audit

Proposed claim: “a backend-local what-if substrate for PostgreSQL extended
statistics that retains native MCV/FD payloads under one frozen realization
and exposes arbitrary hypothetical configurations to the native CE without
search-time `ANALYZE` or physical deployment of each candidate design.”

| Phrase | Classification | Accurate qualification |
|---|---|---|
| backend-local | SUPPORTED | Patched PostgreSQL backend session and its private overlay state. |
| what-if substrate | SUPPORTED | Extended-statistics-only substrate, not a generic physical-design interface. |
| native MCV/FD payloads | SUPPORTED | Native send/deserialize representation within PG16.14 MCV/FD scope. |
| retains payloads | NEEDS QUALIFICATION | Advisor repository/cache retains bytes after acquisition; the production capture bundle does not. |
| one frozen realization | NEEDS QUALIFICATION | One persisted sample plus derived ordinary/native payload realization; not a claim of future native-`ANALYZE` equivalence. |
| arbitrary hypothetical configurations | NEEDS QUALIFICATION | Arbitrary subsets/orderings representable by the frozen candidate catalog and supported arity-two MCV/FD fragment; not arbitrary PostgreSQL statistics. |
| native CE | SUPPORTED | Native PostgreSQL 16.14 planner/CE computes the `EXPLAIN` estimate in scope. |
| without search-time `ANALYZE` | SUPPORTED | No per-move `ANALYZE`; acquisition or shell recreation may analyze once before search. |
| without physical deployment of each design | SUPPORTED | Candidate configurations use overlay activation; only the final recommendation is physically deployed. |

No phrase is defensible without scope qualifiers.  “Arbitrary” and “retains”
must not be left unqualified; interpreted as all PostgreSQL mechanisms or all
production state they would be UNSUPPORTED.

## 3. What is actually virtualized

The central design insight is: **virtualize statistics state, not cardinality-
estimator semantics**.  The overlay virtualizes candidate identity, shell OID
resolution, native payload bytes, absent-native states, active OID membership,
and active precedence order.  PostgreSQL still executes the supported native
MCV/FD applicability, winner selection, clause consumption, deserialization,
composition, and numerical CE path.  A naive physical baseline would recreate
and analyze each design.  The legacy CE-Replay line instead encoded a bounded
external estimator transition system in Python.  The current product uses
neither per-design physical materialization nor the legacy external estimator;
it is a native-semantic what-if interface.

## 4. Search and incrementality boundary

Historical development artifacts include ADD-only screening and DMV full-72
ADD-only searches, and a separate development ADD/DROP/SWAP library path.
The authoritative Census workflow and release-qualified `advise_fixed_t` are
screened deterministic ADD-only.  The current evaluator's only production
incrementality is conservative query-level incidence reuse.  M2.21 measured
19,210 conceptual/feasible moves, 16,769 native evaluations, 88,654 planner
calls, and an exact repeated search; those counts establish work avoided and
repeatability, not a universal optimizer-speedup theorem.  Query-internal
semantic incremental replay was explicitly rejected by DD-006.

## 5. Evidence inventory

| Evidence | Status | What it establishes | What it does not establish |
|---|---|---|---|
| E1 same-realization native fidelity | READY | DMV M2.18: hypothetical and physical states on the same persisted sample had identical objective, estimate vector, q-errors, and 31 payload bytes; Census M2.21: 112 selected payloads and 468/468 estimates/q-errors matched. | Fresh payload equality, joins, arbitrary PG versions, or full planner replay. |
| E2 contextuality and realization behavior | READY | Census singleton signs/context evidence; DMV M2.19 fixed design positive on all 10 native realizations; M2.20 five persisted samples yielded Jaccard 0.7429–0.9375 and near-equivalent designs. | Universal robustness or design identity across samples. |
| E3 work avoided by the substrate | PARTIAL/READY WITH LIMIT | Code and M2.21 counters show one frozen repository, no per-move `ANALYZE`, incidence-based query reuse, exact repeated trajectory, and bounded native-planner work. | A measured speedup against a physical-per-design `ANALYZE` baseline; do not claim one. |
| E4 production closure | READY | M2.33 clean-room lifecycle passes capture, unavailable-production offline advice, preflight, deployment, missing-ANALYZE, rollback, corruption, and cold/warm semantic equality. | Security boundary, byte reproducibility, automatic deployment, or universal operations. |
| E5 realization robustness | READY WITH SCOPE | M2.19 and M2.20 provide fixed-design and multi-sample design-selection evidence. | Native sampling equivalence, temporal/schema drift, or invariant selected identities. |

The only measured runtime-like count is the native/evaluator operation count;
there is no physical-per-design wall-clock baseline.  “Speedup” is therefore
an unsupported claim in this paper version.

## 6. Evidence gaps

The remaining real gaps are recorded separately in
`notes/strategy-b-evidence-gaps.md`: no direct physical-per-design baseline,
no exhaustive empirical enumeration of every supported subset, limited
search-mode comparison for the product path, no query-level reuse RQ as an
independent causal question, and a maintenance model that remains a scoped
resource constraint rather than a universal cost theory.  These are wording
and evidence-boundary gaps, not reasons to rerun the existing experiments in
this audit.

## 7. Redesigned research questions

1. **Native-semantic what-if fidelity.** Within the fixed PG16.14 base-
   relation MCV/FD fragment, does the backend-local overlay reproduce native
   hypothetical and physical estimates under one persisted realization?
2. **State virtualization and bounded work.** Can one acquired/frozen native
   repository evaluate many hypothetical configurations without per-design
   `ANALYZE`, while conservative query-level incidence reuse preserves exact
   move outcomes?  Report operation counts, not unmeasured speedup.
3. **Contextual physical design.** Do native statistics interactions make
   singleton utility insufficient, and can contextual evaluation find a
   maintenance-feasible local design?
4. **Production-separated closure.** Can stock PostgreSQL capture a sealed
   bundle that supports offline advice, DBA-controlled deployment, and
   post-deployment/rollback verification?
5. **Realization robustness.** How do fixed designs and selected designs
   behave across independent persisted/native statistics realizations?

Each question must carry the PG16.14, one-relation, fixed-target, supported
MCV/FD, frozen-realization, and local-search qualifiers.  No new experiment is
required for the redesign decision; a future revision may add a physical
baseline if it wants a speed claim.

## 8. Contribution hierarchy

1. **Primary mechanism contribution (novelty candidate):** a backend-local
   hypothetical extended-statistics substrate that virtualizes native MCV/FD
   state while delegating CE semantics to PostgreSQL.
2. **Native-semantic evaluation contribution:** a design-parametric evaluator
   and conservative query-level reuse interface built on that substrate; this
   is a bounded systems method, not a general incremental-computation theory.
3. **Systems contribution:** production-separated fixed-T capture, offline
   advice, recommendation, DBA deployment, verification, rollback, and
   clean-room lifecycle.
4. **Evidence contribution:** same-realization fidelity, contextuality,
   operation-count/repeatability, deployment closure, and bounded
   realization-robustness evidence.

The old “CE-Replay is the core mechanism of the advisor” hierarchy is
superseded.  Legacy CE-Replay remains a historical external-semantic design
alternative and evidence source, not the implementation mechanism of the
current product.

## 9. Problem/model/algorithm/mechanism/architecture matrix

| Layer | What the current paper has | Novelty status | Role after redesign |
|---|---|---|---|
| Problem | Contextual fixed-target extended-statistics selection under maintenance budget | Established formulation | Scope and evaluation objective |
| CE model | PostgreSQL native CE for bounded MCV/FD base restrictions | Not a new CE | Authority used for correctness |
| Search algorithm | Deterministic local ADD-only product path; ADD/DROP/SWAP library mode | Not a search novelty | Replaceable consumer of evaluator |
| Mechanism/interface | Backend-local registration, absent-state handling, ordered activation, native hooks | Primary novelty candidate, subject to related-work boundary | Central method section |
| Architecture | Read-only capture, private advisor, recommendation/deploy/verify lifecycle | Systems contribution | Product closure and operational boundary |

## 10. Legacy CE-Replay disposition

Keep the legacy IR, GreedyCover, precedence, MCV/FD composition, dependency
oracle, old optimizer, and old fidelity tables as historical background,
design alternatives, or appendix/linked-artifact evidence.  Move claims that
the current advisor executes that IR out of the main narrative.  Related work
and discussion should explain the distinction: legacy CE-Replay externalizes a
bounded estimator transition system; the current advisor virtualizes native
statistics state and invokes the PostgreSQL CE directly.  Do not silently
delete the old thesis; `notes/paper-thesis.md` retains it as superseded
history.

## 11. Proposed paper structure

1. Introduction (problem, bounded thesis, and scope)
2. Background and related physical-design context
3. Problem and system contract
4. Backend-local hypothetical extended-statistics substrate
5. Native-semantic what-if evaluation
6. Advisor search and maintenance constraint
7. Production-separated architecture and lifecycle
8. Evaluation (RQ1–RQ5)
9. Related work and novelty boundary
10. Discussion, limitations, and conclusion

The former standalone CE-Replay centerpiece should become historical context
and a comparison point, not the product's asserted implementation core.

## 12. Reviewer attack simulation

| Attack | Strongest criticism | Current distinguishing evidence | Risk |
|---|---|---|---|
| HypoPG extended-statistics analogue | The overlay may be an incremental extension of existing hypothetical-statistics infrastructure. | Native payload/absent-state registration, ordered extstats activation, same-sample native fidelity. No direct apples-to-apples competitor artifact exists. | HIGH |
| PostgreSQL patch plus greedy search | The patch is engineering and ADD-only search is conventional. | Exact native semantics remain in PostgreSQL; the paper can claim only the substrate/interface and evidence, not search novelty. | MEDIUM |
| Existing statistics advisors | The lifecycle and selection problem are established. | Fixed-T native extstats what-if substrate and production/advisor separation are the bounded distinction; related-work comparison remains necessary. | HIGH |
| Test-server/offline tuning | A private server that analyzes candidates may already provide what-if evaluation. | One frozen repository plus backend-local activation avoids per-design materialization; no direct physical baseline currently measured. | HIGH |
| “Just cache payloads” | The contribution could be reduced to caching serialized statistics. | Overlay hooks preserve native catalog order, absent-native semantics, and native CE execution; this must be demonstrated, not asserted. | MEDIUM/HIGH |
| PostgreSQL 19 restores hypothetical support | The implementation may be version-fragile. | Scope is explicitly PG16.14 and fail-closed compatibility; future upstream changes are a portability limitation. | MEDIUM |

Strategy B does not defeat attacks A, C, or D by itself.  It is publishable
only with explicit scope and a careful related-work boundary.

## 13. Decision gate

**GO-B-WITH-GAP.** The actual mechanism is coherent and independently
evidenced by E1, E2, E4, and E5; E3 is sufficient for an operation-count and
no-per-move-`ANALYZE` claim but not a speedup claim.  The paper should be
redesigned around native-state virtualization, with the gaps and attack risks
above made explicit before manuscript prose is rewritten.

No experiment is necessary to make this redesign decision.  A future physical
per-design baseline is optional and only required for a quantitative speedup
claim.
