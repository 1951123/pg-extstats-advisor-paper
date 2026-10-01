# Strategy B Claims ↔ Evidence Consistency Audit v1

Audit baseline: manuscript `b5074adcb53a6b7ee0f3d30c132e01986b4cd735`.
System evidence baseline: `88797e4b82ff1d5c8bbba28dc27987af78ce78ad`.
This is a manuscript audit only.  No experiments or system-repository files
were changed.  Sections 9 and 10 were not drafted or rewritten.

## Audit outcome

The manuscript's technical claims are consistent with the frozen evidence
after three minimal wording corrections.  The corrections only make already
stated boundaries explicit: independent-realization robustness is DMV-scoped,
the ADD/DROP/SWAP incidence wording belongs to the development/library
interface, and the same DMV qualification is repeated in the RQ5 question.
No numerical result or scientific mechanism was changed.

| Status | Count |
|---|---:|
| SUPPORTED | 68 |
| SUPPORTED-WITH-SCOPE | 73 |
| TOO-STRONG | 0 |
| AMBIGUOUS | 0 |
| UNSUPPORTED | 0 |
| REDUNDANT | 0 |
| **Total material claims inventoried** | **141** |

No inventory row was classified as merely redundant; repeated limitations are
retained because they perform local claim-boundary work.

## Corrections made

1. `paper/main.tex`: the abstract now says “bounded DMV
   independent-realization robustness.”
2. `paper/sections/01-introduction.tex`: the fifth evaluation question now
   says “independent DMV statistics realizations,” and Contribution 4 now says
   “bounded DMV independent-realization robustness.”
3. `paper/sections/05-native-evaluation.tex`: the ADD/DROP/SWAP incidence
   sentence now explicitly identifies those moves as the library's development
   interface and states that the release-qualified product path uses ADD only.
4. `paper/sections/08-evaluation.tex`: the RQ5 question now explicitly says
   “independent DMV statistics realizations.”

No claim was removed entirely.  No result value, experiment label, population,
or evidence artifact was changed.

## Material claim inventory

The inventory covers every material factual or scientific assertion in the
abstract and Sections 1--8.  Ordinary PostgreSQL definitions are omitted
unless they carry a system, evidence, scope, or novelty implication.

| ID | Location | Claim | Claim type | Evidence | Status | Required action |
|---|---|---|---|---|---|---|
| A1 | Abstract | Extended statistics can improve estimates for correlated predicates. | MECHANISM | PostgreSQL documentation and cited background | SUPPORTED | none |
| A2 | Abstract | Selecting a useful subset requires evaluating configurations. | SEARCH | Sections 2, 3, 6 | SUPPORTED-WITH-SCOPE | fixed workload/catalog only |
| A3 | Abstract | MCV/FD payloads are data-dependent products of ANALYZE/catalog state. | MECHANISM | Sections 2, 4, 5; native acquisition path | SUPPORTED | none |
| A4 | Abstract | Physical design evaluation repeats the physical-state step per design. | PERFORMANCE/WORK | Sections 2 and 5 architecture distinction | SUPPORTED-WITH-SCOPE | structural claim, not wall-clock claim |
| A5 | Abstract | The system is a backend-local what-if substrate for PG16.14 supported extstats. | MECHANISM | Sections 4, 5; source patch and adapter | SUPPORTED-WITH-SCOPE | keep PG16.14/fragment qualifier |
| A6 | Abstract | Frozen native payload/absence states can be registered and transiently activated. | MECHANISM | Sections 3, 4; registration/activation artifacts | SUPPORTED-WITH-SCOPE | representable catalog subsets only |
| A7 | Abstract | PostgreSQL performs applicability, precedence, consumption, deserialization, composition, and CE. | CORRECTNESS | Section 4 native hooks; RQ1 | SUPPORTED-WITH-SCOPE | supported MCV/FD fragment only |
| A8 | Abstract | The search loop has no per-design ANALYZE or physical deployment. | PERFORMANCE/WORK | Sections 4--6; Census M2.21 protocol | SUPPORTED-WITH-SCOPE | no speedup implication |
| A9 | Abstract | Stock capture plus private advisor reconstruction returns DBA-controlled DDL. | ARCHITECTURE | Section 7; M2.33 lifecycle | SUPPORTED-WITH-SCOPE | capture has no payload bytes |
| A10 | Abstract | Evidence covers fidelity, contextuality, bounded work, lifecycle, and DMV robustness. | SCOPE/LIMITATION | Section 8 and evidence ledger | SUPPORTED-WITH-SCOPE | no universal/generalization reading |
| I1 | Introduction | Cardinality estimates influence plan comparison and optimizer work. | MECHANISM | PostgreSQL optimizer background | SUPPORTED | none |
| I2 | Introduction | MCV/FD can improve estimates for correlated predicates. | MECHANISM | PostgreSQL docs/source | SUPPORTED | none |
| I3 | Introduction | Workload-driven statistics selection and interaction-aware recommendation are prior art. | PRIOR-ART/BOUNDARY | MNSA, StatAdvisor citations | SUPPORTED | retain acknowledgment |
| I4 | Introduction | The obstacle is the definition-versus-realized-payload boundary. | MECHANISM | Sections 2--5 | SUPPORTED-WITH-SCOPE | supported fragment |
| I5 | Introduction | Physical evaluation couples search to payload materialization. | PERFORMANCE/WORK | Sections 2 and 5 | SUPPORTED-WITH-SCOPE | structural only |
| I6 | Introduction | What-if indexes, hypothetical objects, pending/imported stats, and advisors are prior art. | PRIOR-ART/BOUNDARY | related-work citations and boundary note | SUPPORTED | none |
| I7 | Introduction | Surviving capability is PG-native extstats payload-state what-if evaluation. | PRIOR-ART/BOUNDARY | Sections 4--5; related-work boundary | SUPPORTED-WITH-SCOPE | no generic novelty claim |
| I8 | Introduction | Current design virtualizes state rather than CE semantics. | MECHANISM | Sections 4--5 | SUPPORTED | none |
| I9 | Introduction | Earlier CE-Replay is historical, not current runtime. | SCOPE/LIMITATION | frozen thesis and repository separation | SUPPORTED | none |
| I10 | Introduction | Native PostgreSQL consumes payload/absence, membership, and precedence state. | MECHANISM | Sections 3--4 source path | SUPPORTED-WITH-SCOPE | representable ordered subsets |
| I11 | Introduction | Repository validation is more than byte storage. | MECHANISM | Section 4 registration/activation | SUPPORTED-WITH-SCOPE | no generic virtualization theory |
| I12 | Introduction | Production remains stock; capture is read-only; private advisor reconstructs state. | ARCHITECTURE | Section 7; M2.33 | SUPPORTED-WITH-SCOPE | lifecycle scope |
| I13 | Introduction | Product search is deterministic contextual ADD-only under a fixed maintenance constraint. | SEARCH | Section 6 and workflow config | SUPPORTED-WITH-SCOPE | release path only |
| I14 | Introduction | The five evaluation questions are fidelity, bounded work, contextuality, lifecycle, and DMV robustness. | SCOPE/LIMITATION | Section 8 and RQ map | SUPPORTED-WITH-SCOPE | DMV qualification retained |
| I15 | Introduction | Four contributions are substrate, native evaluation, production separation, and bounded evidence. | PRIOR-ART/BOUNDARY | contribution plan and Sections 4--8 | SUPPORTED-WITH-SCOPE | no search novelty |
| B1 | Section 2 | Ordinary per-column summaries can miss correlations. | MECHANISM | PostgreSQL documentation | SUPPORTED | none |
| B2 | Section 2 | MCV and dependency statistics summarize multivariate state. | MECHANISM | PostgreSQL docs/source | SUPPORTED | none |
| B3 | Section 2 | Definition state and data-derived payload state are distinct. | MECHANISM | Sections 3--5 | SUPPORTED | none |
| B4 | Section 2 | Statistics target affects payload detail/resource requirements. | MECHANISM | PostgreSQL semantics and target docs | SUPPORTED-WITH-SCOPE | target fixed in product |
| B5 | Section 2 | A registered definition may have no requested native payload. | MECHANISM | PG16.14 source audit; ABSENT_NATIVE artifacts | SUPPORTED-WITH-SCOPE | native absence only |
| B6 | Section 2 | Physical evaluation couples definitions and collection. | PERFORMANCE/WORK | Section 5 pipeline | SUPPORTED-WITH-SCOPE | no time claim |
| B7 | Section 2 | Utility can depend on the active configuration. | CONTEXTUALITY | DMV M2.17d/M2.20 and Section 6 | SUPPORTED-WITH-SCOPE | observed workloads only |
| B8 | Section 2 | Workload selection, what-if analysis, import/pending/restore are prior art. | PRIOR-ART/BOUNDARY | cited systems | SUPPORTED | none |
| B9 | Section 2 | Native-state virtualization is the bounded design alternative. | MECHANISM | Sections 4--5 | SUPPORTED-WITH-SCOPE | no generic what-if claim |
| P1 | Section 3 | The advisor receives a fixed workload and positive exact truth. | SCOPE/LIMITATION | system contract and bundles | SUPPORTED-WITH-SCOPE | supplied truth, not inferred |
| P2 | Section 3 | Scope is one target base relation and selection CE. | SCOPE/LIMITATION | system contract | SUPPORTED | none |
| P3 | Section 3 | Candidate definitions identify relation, two attributes, mechanism, identity, rank, and cost. | MECHANISM | catalog schema/code | SUPPORTED-WITH-SCOPE | arity-two catalog |
| P4 | Section 3 | Candidate counts are benchmark-specific, not product limits. | SCOPE/LIMITATION | Census/DMV catalogs | SUPPORTED | none |
| P5 | Section 3 | A realization is advisor-derived from a persisted sample and fixed for a run. | MECHANISM | Sections 4--5 and bundle contract | SUPPORTED-WITH-SCOPE | not future ANALYZE |
| P6 | Section 3 | PRESENT and ABSENT_NATIVE are valid native states. | MECHANISM | PG source audit and payload contract | SUPPORTED-WITH-SCOPE | requested field semantics |
| P7 | Section 3 | UNREGISTERED is invalid acquisition/identity state, not a statistical outcome. | CORRECTNESS | adapter validation path | SUPPORTED | none |
| P8 | Section 3 | Membership is set-valued and effective order derives from precedence. | MECHANISM | catalog/activation code | SUPPORTED-WITH-SCOPE | fixed precedence |
| P9 | Section 3 | Estimates come from native EXPLAIN target-relation Plan Rows. | CORRECTNESS | evaluator implementation | SUPPORTED-WITH-SCOPE | unique target node |
| P10 | Section 3 | Objective is direct sum of positive-truth q-errors. | MECHANISM | evaluator code and contract | SUPPORTED | none |
| P11 | Section 3 | Cost is additive, definition-level, and target/environment-specific. | SEARCH | calibrated maintenance model | SUPPORTED-WITH-SCOPE | not universal law |
| P12 | Section 3 | Default T=100 is fixed before capture/realization/advice/search and not optimized. | SCOPE/LIMITATION | target-scope docs/tests | SUPPORTED | none |
| P13 | Section 3 | Feasible subset selection is formalized without novelty/global-optimum claim. | SEARCH | Section 6 and prior-art note | SUPPORTED | none |
| P14 | Section 3 | Same realization, state, payload, order, and design define correctness. | CORRECTNESS | M2.18/M2.21 gates | SUPPORTED-WITH-SCOPE | PG16.14 fragment |
| P15 | Section 3 | Independent-realization behavior is robustness, not correctness or invariance. | ROBUSTNESS | M2.19/M2.20 | SUPPORTED-WITH-SCOPE | DMV only in evidence |
| P16 | Section 3 | Capture exports sample/metadata; advisor derives repository/search state. | ARCHITECTURE | bundle contract and Section 7 | SUPPORTED | no capture payload bytes |
| P17 | Section 3 | Joins, higher arity, other mechanisms, target optimization, latency, invariance are excluded. | SCOPE/LIMITATION | frozen scope | SUPPORTED | none |
| S1 | Section 4 | Substrate binds native MCV/FD payload/absence to candidate state and ordered activation. | MECHANISM | patch and adapter | SUPPORTED-WITH-SCOPE | supported fragment |
| S2 | Section 4 | Configuration decision is separated from physical statistics state. | MECHANISM | architecture and evaluator | SUPPORTED-WITH-SCOPE | no per-design collection |
| S3 | Section 4 | Acquisition is outside the design loop and no move causes search-loop ANALYZE. | PERFORMANCE/WORK | evaluator/search protocol | SUPPORTED-WITH-SCOPE | structural, not faster |
| S4 | Section 4 | ABSENT_NATIVE is preserved, not dropped or fabricated. | CORRECTNESS | PG source and adapter | SUPPORTED | none |
| S5 | Section 4 | Scope is PG16.14, one relation, fixed target, arity-two MCV/FD. | SCOPE/LIMITATION | substrate scope table | SUPPORTED | none |
| S6 | Section 4 | Capture, repository, overlay, and native planner have distinct roles. | ARCHITECTURE | substrate figure/code | SUPPORTED | none |
| S7 | Section 4 | Definition, shell, native payload, and repository are distinct objects. | MECHANISM | adapter/acquisition code | SUPPORTED | none |
| S8 | Section 4 | Capture contains sample/metadata but not ordinary stats, payload bytes, or repository. | ARCHITECTURE | bundle contract | SUPPORTED | none |
| S9 | Section 4 | Cache miss acquires once; cache hit reconstructs shells and reuses validated bytes before search. | PERFORMANCE/WORK | acquisition workflow | SUPPORTED-WITH-SCOPE | pre-search ANALYZE may occur |
| S10 | Section 4 | PRESENT/ABSENT_NATIVE/UNREGISTERED have distinct semantics. | CORRECTNESS | payload contract | SUPPORTED | none |
| S11 | Section 4 | Cost does not use payload presence as a proxy. | SEARCH | cost model/code | SUPPORTED | fixed model |
| S12 | Section 4 | Registration validates identity/relation/kind and native-deserializes PRESENT payloads. | CORRECTNESS | patch functions and adapter | SUPPORTED-WITH-SCOPE | source-built advisor PG |
| S13 | Section 4 | Activation validates and publishes ordered membership atomically per backend. | MECHANISM | patch/adapter | SUPPORTED-WITH-SCOPE | session-local |
| S14 | Section 4 | Native planner hooks filter/reorder active OIDs and load registered state. | MECHANISM | PG patch | SUPPORTED-WITH-SCOPE | PG16.14 only |
| S15 | Section 4 | Applicability, precedence, clause consumption, deserialization, composition, and numeric CE remain native. | CORRECTNESS | native source path and RQ1 | SUPPORTED-WITH-SCOPE | supported semantics only |
| S16 | Section 4 | Interface is more than a byte cache because it controls identity, absence, membership, and order. | MECHANISM | code path | SUPPORTED-WITH-SCOPE | no generic theory |
| S17 | Section 4 | Overlay is backend-local/session-local and does not modify production catalog. | ARCHITECTURE | patch behavior | SUPPORTED | none |
| S18 | Section 4 | Supported substrate boundary excludes joins/higher arity/other mechanisms/target optimization. | SCOPE/LIMITATION | scope table | SUPPORTED | none |
| E1 | Section 5 | Evaluator starts from sealed bundle, not production catalog snapshot. | ARCHITECTURE | bundle contract | SUPPORTED | none |
| E2 | Section 5 | Bundle excludes ordinary stats, extstats payload bytes, and repository. | ARCHITECTURE | capture contract | SUPPORTED | none |
| E3 | Section 5 | Advisor stages sample and reconstructs ordinary/extended realization. | MECHANISM | acquisition workflow | SUPPORTED-WITH-SCOPE | fixed sample controls |
| E4 | Section 5 | Native send functions serialize MCV/dependency fields or record ABSENT_NATIVE. | MECHANISM | PG16.14 acquisition | SUPPORTED-WITH-SCOPE | requested fields |
| E5 | Section 5 | Cache identity binds bundle/sample/catalog/schema/build/target and validates repository. | MECHANISM | cache manifest/code | SUPPORTED-WITH-SCOPE | current implementation |
| E6 | Section 5 | A design is registered/activated, explained natively, and mapped to q-error. | MECHANISM | evaluator pipeline | SUPPORTED | none |
| E7 | Section 5 | Target-relation Plan Rows is extracted from exactly one plan node. | CORRECTNESS | evaluator code | SUPPORTED-WITH-SCOPE | supported query forms |
| E8 | Section 5 | Objective is deterministic sum of q-error contributions using supplied truth. | MECHANISM | evaluator code | SUPPORTED | none |
| E9 | Section 5 | Physical-per-design path installs/analyzes each design and calls native planner. | PERFORMANCE/WORK | conceptual baseline | SUPPORTED-WITH-SCOPE | no measured baseline |
| E10 | Section 5 | Current path activates frozen state and calls native planner without regenerating payload per design. | MECHANISM | evaluator/search code | SUPPORTED-WITH-SCOPE | pre-search acquisition allowed |
| E11 | Section 5 | Current claim is no per-design CREATE/DROP/ANALYZE, not no ANALYZE anywhere. | PERFORMANCE/WORK | Section 5 and protocol | SUPPORTED | none |
| E12 | Section 5 | Query-level conservative incidence reuse replans affected queries and reuses others. | MECHANISM | evaluator/index code | SUPPORTED-WITH-SCOPE | query granularity |
| E13 | Section 5 | False positives add work; false negatives threaten correctness. | CORRECTNESS | incidence contract | SUPPORTED-WITH-SCOPE | conservative index |
| E14 | Section 5 | q-error lower bound can prune moves before native evaluation. | PERFORMANCE/WORK | bound implementation/M2.21 | SUPPORTED-WITH-SCOPE | stated objective only |
| E15 | Section 5 | Evidence is operation counts/repeatability, not wall-clock speedup. | SCOPE/LIMITATION | M2.21 ledger | SUPPORTED | none |
| E16 | Section 5 | Hypothetical/physical equality is same-realization semantic fidelity. | CORRECTNESS | M2.18/M2.21 | SUPPORTED-WITH-SCOPE | no future sample equality |
| E17 | Section 5 | Fresh realizations may differ and robustness is separate. | ROBUSTNESS | M2.19/M2.20 | SUPPORTED-WITH-SCOPE | DMV evidence only |
| E18 | Section 5 | External CE emulation is historical alternative, not current runtime. | PRIOR-ART/BOUNDARY | CE-Replay history and architecture | SUPPORTED | none |
| H1 | Section 6 | Search is a substrate consumer, not technical novelty. | SEARCH | Section 6 and prior-art boundary | SUPPORTED | none |
| H2 | Section 6 | Search evaluates baseline/moves through native evaluator. | SEARCH | evaluator/search code | SUPPORTED | none |
| H3 | Section 6 | Release product is deterministic contextual ADD-only best-improvement. | SEARCH | workflow config and M2.21 | SUPPORTED-WITH-SCOPE | product path |
| H4 | Section 6 | Feasibility and exact lower-bound pruning precede native move evaluation. | SEARCH | search implementation | SUPPORTED-WITH-SCOPE | supported objective |
| H5 | Section 6 | Ties resolve by cost then deterministic rank/ID. | SEARCH | search implementation | SUPPORTED | none |
| H6 | Section 6 | Marginal utility is contextual, not a singleton scalar. | CONTEXTUALITY | M2.17d/M2.20 | SUPPORTED-WITH-SCOPE | observed DMV/Census runs |
| H7 | Section 6 | Maintenance model is empirical, target/environment-specific, and not causal/universal. | SEARCH | calibration docs/code | SUPPORTED | none |
| H8 | Section 6 | Definition-level cost is same for PRESENT/ABSENT_NATIVE. | SEARCH | cost code/contract | SUPPORTED | fixed model |
| H9 | Section 6 | Singleton-negative candidates can be useful in context; no safe universal singleton pruning rule. | CONTEXTUALITY | DMV interaction artifacts | SUPPORTED-WITH-SCOPE | observed workloads |
| H10 | Section 6 | Termination is `add-local-optimum` for no improving feasible ADD. | SEARCH | search implementation/results | SUPPORTED | none |
| H11 | Section 6 | Incidence reuse is conservative and query-granular. | MECHANISM | evaluator/search code | SUPPORTED | no planner-internal reuse |
| H12 | Section 6 | Lower-bound pruning is exact for the stated q-error objective/contract. | CORRECTNESS | mathematical bound/code | SUPPORTED-WITH-SCOPE | not general algorithm |
| H13 | Section 6 | No search novelty, global optimum, approximation guarantee, or DROP/SWAP product claim. | SCOPE/LIMITATION | explicit non-claims | SUPPORTED | none |
| R1 | Section 7 | Production zone is stock PG16.14; private advisor zone contains patched PG16.14. | ARCHITECTURE | M2.33 provenance and architecture | SUPPORTED-WITH-SCOPE | clean-room/validated scope |
| R2 | Section 7 | Capture is read-only and does not install overlay, create stats, analyze, or deploy. | ARCHITECTURE | capture contract/code | SUPPORTED | none |
| R3 | Section 7 | Advice after capture requires no production credentials. | ARCHITECTURE | M2.33 lifecycle | SUPPORTED-WITH-SCOPE | private advisor/bundle exists |
| R4 | Section 7 | Separation is operational, not a novelty claim. | PRIOR-ART/BOUNDARY | architecture note | SUPPORTED | none |
| R5 | Section 7 | Capture bundle records metadata/sample/workload/truth/digests. | ARCHITECTURE | bundle v1 contract | SUPPORTED-WITH-SCOPE | sensitivity explicit |
| R6 | Section 7 | Capture bundle omits ordinary stats, payload bytes, repository, search state, recommendation. | ARCHITECTURE | bundle contract | SUPPORTED | none |
| R7 | Section 7 | Seal/digest provides integrity/tamper detection, not confidentiality. | SCOPE/LIMITATION | bundle docs | SUPPORTED | external controls remain |
| R8 | Section 7 | Offline path validates bundle/version/target/schema and stages sample privately. | ARCHITECTURE | workflow/CLI and M2.33 | SUPPORTED-WITH-SCOPE | supported inputs |
| R9 | Section 7 | Acquisition/shell realization ANALYZE is pre-search, not per-design. | PERFORMANCE/WORK | workflow/code | SUPPORTED | no speed claim |
| R10 | Section 7 | Recommendation emits standard CREATE/ALTER/ANALYZE and rollback SQL. | ARCHITECTURE | deployment artifacts | SUPPORTED-WITH-SCOPE | DBA-controlled |
| R11 | Section 7 | Deployment is DBA-controlled; advisor does not execute production DDL or ANALYZE. | ARCHITECTURE | deploy workflow/docs | SUPPORTED | none |
| R12 | Section 7 | Verification distinguishes definition-only from materialized state and warns on missing ANALYZE. | CORRECTNESS | M2.32/M2.33 | SUPPORTED | none |
| R13 | Section 7 | Rollback verifies recommendation-owned definitions absent but does not restore sampling state. | ARCHITECTURE | M2.32 artifacts | SUPPORTED | none |
| R14 | Section 7 | Docker clean-room uses stock production, patched private advisor, non-root/no host source. | ARCHITECTURE | M2.33 provenance | SUPPORTED-WITH-SCOPE | synthetic fixture |
| R15 | Section 7 | Cold/warm semantic outputs match and warm cache hits. | ROBUSTNESS | M2.33 lifecycle summary | SUPPORTED-WITH-SCOPE | semantic, not byte-level |
| R16 | Section 7 | Workflow fails closed on incompatible/tampered/missing state and makes no security/automatic rollback/byte claims. | SCOPE/LIMITATION | M2.33 checks and non-claims | SUPPORTED | none |
| V1 | Section 8 | DMV and Census populations are separated by purpose and realization regime. | SCOPE/LIMITATION | Table 4 and ledger | SUPPORTED | none |
| V2 | Section 8 | Same-realization compares paths over same ordinary state/payload repository. | CORRECTNESS | M2.18 protocol/report | SUPPORTED | no future ANALYZE claim |
| V3 | Section 8 | Evaluation scope is PG16.14, one relation, arity-two MCV/FD, fixed workload/target. | SCOPE/LIMITATION | scope contract | SUPPORTED | none |
| V4 | Section 8 | M2.18 compares hypothetical and physical 31-stat design, 8 MCV/23 FD. | CORRECTNESS | M2.18 artifacts | SUPPORTED | DMV-specific |
| V5 | Section 8 | M2.18 has 1,963/1,963 estimate and q-error equality, 31/31 payload equality. | CORRECTNESS | M2.18 report/protocol | SUPPORTED | none |
| V6 | Section 8 | M2.18 objective is 22,014.061 on both paths with baseline 42,791.986. | CORRECTNESS | M2.18 report | SUPPORTED | rounded in prose |
| V7 | Section 8 | RQ1 supports same-realization fidelity only. | SCOPE/LIMITATION | M2.18 limitations | SUPPORTED | none |
| V8 | Section 8 | Census M2.21 evaluates deterministic ADD-only search over 4,506 catalog. | SEARCH | M2.21 report/protocol | SUPPORTED-WITH-SCOPE | recorded screen |
| V9 | Section 8 | Census work counts are 19,210 moves, 2,441 pruned, 16,769 native evaluations, 88,654 planner calls. | PERFORMANCE/WORK | M2.21 report | SUPPORTED | no speed claim |
| V10 | Section 8 | Census repeat trajectory/result and 468/468 physical validation are exact. | CORRECTNESS | M2.21 repeat/validation artifacts | SUPPORTED | same realization |
| V11 | Section 8 | Counts do not establish wall-clock speedup. | SCOPE/LIMITATION | M2.21 protocol/non-claims | SUPPORTED | none |
| V12 | Section 8 | DMV M2.17d and Census M2.21 provide separate contextual search evidence. | CONTEXTUALITY | M2.17d/M2.21 reports | SUPPORTED-WITH-SCOPE | no silent merge |
| V13 | Section 8 | DMV M2.17d objective falls 42,791.986 to 22,014.061, 48.56%. | SEARCH | M2.17d report | SUPPORTED | DMV-specific |
| V14 | Section 8 | DMV M2.17d selects 31 (8 MCV/23 FD), including 12 negative-singleton rescues. | CONTEXTUALITY | M2.17d interaction-evidence.json | SUPPORTED | DMV-specific |
| V15 | Section 8 | Census screen has 226 candidates and selects 112 (110 MCV/2 FD), 83.35% reduction. | SEARCH | M2.21 report | SUPPORTED-WITH-SCOPE | screened run |
| V16 | Section 8 | Contextual result does not establish submodularity/global optimum/universal pruning. | SCOPE/LIMITATION | explicit limitation | SUPPORTED | none |
| V17 | Section 8 | M2.33 tests production-separated lifecycle with two-candidate/one-query synthetic fixture. | ARCHITECTURE | lifecycle summary | SUPPORTED-WITH-SCOPE | not production workload |
| V18 | Section 8 | M2.33 capture/advice/preflight/deploy/verify/rollback/fail-closed checks PASS. | ARCHITECTURE | lifecycle summary | SUPPORTED-WITH-SCOPE | fixture scope |
| V19 | Section 8 | M2.33 cold/warm design/objective/recommendation outputs equal and warm cache hits. | CORRECTNESS | lifecycle summary | SUPPORTED-WITH-SCOPE | semantic only |
| V20 | Section 8 | M2.33 does not establish security, automatic deployment, payload-byte equality, or arbitrary-schema behavior. | SCOPE/LIMITATION | lifecycle/provenance non-claims | SUPPORTED | none |
| V21 | Section 8 | M2.19 evaluates fixed 31-design across 10 fresh native DMV realizations. | ROBUSTNESS | M2.19 summary/report | SUPPORTED-WITH-SCOPE | DMV/fixed design |
| V22 | Section 8 | M2.19 improvement is positive in all runs, 43.75--48.62%; 28 stable-present/3 flipped. | ROBUSTNESS | M2.19 summary | SUPPORTED-WITH-SCOPE | no universal robustness |
| V23 | Section 8 | M2.20 has five samples, selected sizes 31/31/31/28/30, Jaccard 0.743--0.938, median 0.846. | ROBUSTNESS | M2.20 summary/membership | SUPPORTED-WITH-SCOPE | DMV only |
| V24 | Section 8 | M2.20 consensus core is 25; maximum cross-sample objective gap is 0.00891%; no foreign design beats local. | ROBUSTNESS | M2.20 summary/gaps CSV | SUPPORTED-WITH-SCOPE | no identity invariance |
| V25 | Section 8 | Robustness evidence does not imply invariance, drift robustness, cross-version robustness, or CE-Replay runtime. | SCOPE/LIMITATION | RQ map/non-claims | SUPPORTED | none |

## Population-separation matrix

| Claim/result | Population | Dataset | Realization regime | Can generalize to |
|---|---|---|---|---|
| Same hypothetical/physical fidelity | DMV M2.18 | DMV canonical relation/workload | one persisted realization; same ordinary stats and payloads | the tested PG16.14 MCV/FD fragment, not future samples |
| Full-catalog contextual ADD search | DMV M2.17d | DMV canonical relation/workload | one frozen realization; full 72-candidate catalog | this DMV run and the product search contract |
| Authoritative bounded work and validation | Census M2.21 | Census `public.climate` | one persisted native sample; 226-candidate screen from 4,506 catalog | Census M2.21 protocol only |
| Fixed-design robustness | DMV M2.19 | DMV canonical relation/workload | ten fresh native realizations; design fixed | tested DMV distribution and fixed design |
| Selected-design stability | DMV M2.20 | DMV canonical relation/workload | five persisted samples; 5x5 cross-evaluation | tested DMV sample family; not invariant identities |
| Lifecycle closure | M2.33 synthetic fixture | `public.fixture`, two candidates/one query | Docker cold/warm clean-room lifecycle | operational contract, not production workload scale |

No manuscript sentence uses these populations as a pooled “across datasets”
result.  “Production” denotes the stock-PG zone and lifecycle role, not a
claim that M2.33 validated a real production workload.

## RQ and language audits

### RQ1

Fidelity statements are conditional on the same PG16.14 realization, ordinary
statistics state, payload state, order, and design.  The exact counts are
1,963/1,963 estimates, 1,963/1,963 q-errors, and 31/31 payloads.  Census's
468/468 validation is described separately as Census physical validation.  No
future-ANALYZE, arbitrary payload, join, or cross-version claim remains.

### RQ2

Every “without ANALYZE” phrase is qualified as without per-design/per-move
search-time materialization.  The manuscript reports operation counts only:
19,210 moves, 2,441 exact-bound prunes, 16,769 native evaluations, and 88,654
planner calls.  Search terms such as “avoid” refer to structural pruning or
reuse, not measured time savings.  No speedup, faster, cheaper, or lower
runtime claim was found.

### RQ3

Contextuality is presented as observed interaction in DMV/Census runs.  The
12 DMV negative-singleton rescues are not merged with Census's 112-candidate
screen, and no submodularity, universal singleton-ranking, dominance, or global
optimality claim appears.

### RQ4

The manuscript distinguishes stock production capture, private patched advice,
DBA-controlled stock deployment, and the synthetic M2.33 fixture.  The bundle
is explicitly sample/metadata based and excludes payload bytes.  Seal/digest
language is integrity-only; no confidentiality or security guarantee is made.

### RQ5

Robustness is restricted to DMV M2.19/M2.20.  “Stable” is used only for the
reported candidate-state counts; it is not used to claim invariant designs.
No Census robustness, cross-version robustness, temporal drift robustness, or
future native-sample equivalence is claimed.

### Mechanism/evidence distinction

Implementation facts (native hooks, session-local registration, no per-move
ANALYZE, Python not implementing MCV/FD CE) are stated in Sections 4--7 as
architecture/code properties.  Experimental evidence (M2.18/M2.21 equality,
M2.19/M2.20 realization behavior, and M2.33 lifecycle PASS) is stated as
validation.  Neither category is used as proof of the other.

### Capture/repository distinction

All capture/bundle descriptions say persisted sample plus metadata; repository
and native payload bytes are derived in the private advisor.  No sentence
claims that production capture contains extstats payload bytes.

### Search-mode distinction

The release-qualified product path is deterministic contextual ADD-only and
terminates at `add-local-optimum`.  ADD/DROP/SWAP is now explicitly confined
to the library development interface in Section 5; it is not presented as the
product path.

### Fixed-target distinction

The target is externally fixed, defaults to `T=100`, is part of configuration
identity, and is not optimized.  Maintenance coefficients are target- and
environment-specific.  No historical target experiment is used as a current
claim.

### Prior-art boundary

Sections 1--8 acknowledge workload-driven selection, maintenance-aware
selection, what-if design, hypothetical objects, statistics import/pending/
restore, contextual interactions, and production/test-server separation as
prior or enabling patterns.  The surviving mechanism claim remains the
bounded PG16.14 backend-local native MCV/FD state virtualization substrate;
no first/unique/general novelty claim appears.

## Numeric consistency

| Quantity | Canonical value | Locations used |
|---|---:|---|
| M2.18 effective queries | 1,963 | Section 8 setup, RQ1 prose/table |
| M2.18 selected design | 31 = 8 MCV + 23 FD | Section 8 setup/RQ1/RQ3 |
| Census bounded moves | 19,210 | Section 8 RQ2 prose/table |
| Exact-bound pruned | 2,441 (12.71%) | Section 8 RQ2 prose/table |
| Native evaluations | 16,769 | Section 8 RQ2 prose/table |
| Planner calls | 88,654 | Section 8 RQ2 prose/table |
| Census effective queries | 468 | Section 8 setup/RQ2 |
| Census screen | 226 | Section 8 setup/RQ3 |
| Census selected design | 112 = 110 MCV + 2 FD | Section 8 RQ2/RQ3 |
| DMV contextual rescues | 12 | Section 8 RQ3 and interaction artifact |
| M2.19 realizations | 10 | Section 8 setup/RQ5 |
| M2.19 improvement range | 43.75--48.62% | Section 8 RQ5 prose/table |
| M2.20 Jaccard | 0.743--0.938; median 0.846 | Section 8 RQ5 prose/table |
| M2.20 consensus core | 25 | Section 8 RQ5 prose/table |
| M2.20 maximum gap | 0.00891% | Section 8 RQ5 prose/table |

No contradictory duplicate or inconsistent rounding was found.

## Remaining unsupported or deliberately unclaimed items

No current manuscript sentence is classified `UNSUPPORTED`.  The following
remain explicit non-claims rather than missing evidence: physical-per-design
wall-clock speedup; global optimum/approximation guarantee; future native
sample equivalence; arbitrary mechanisms, joins, versions, or DBMSs; Census
realization robustness; invariant design identities; temporal/schema drift;
production payload-byte equality; automatic deployment/rollback; security or
confidentiality guarantees; byte-level Docker reproducibility; and universal
maintenance coefficients.

## Future compression candidates

No compression was performed.  Ranked by safety for a later page-budget pass:

1. Merge repeated scope/non-claim sentences between Sections 3--5 and the
   opening of Section 8 (low scientific risk, but retain one canonical limit).
2. Move some Section 5.5 lower-bound derivation detail to an appendix or
   shorten its prose while keeping the bound definition (low-to-medium risk).
3. Compress Section 7 operational lifecycle detail after preserving the
   capture/payload and DBA-control distinctions (medium risk).
4. Merge the Section 8 setup table with one RQ table only after checking that
   DMV/Census population separation remains visible (medium risk).
5. Defer any bibliography or figure compression until related work and
   conclusion are drafted (higher risk).

## Page-budget observation

The current rebuilt PDF has 13 total pages.  Main text reaches page 13 because
the still-skeletal Sections 9--10 and the end of Section 8 share that page;
the references also begin on page 13, so the bibliography occupies one shared
reference page rather than a separate references-only page.  No page-budget
compression was performed in this audit.

## Self-review

1. Every Abstract claim is backed by Section 8 or direct mechanism evidence:
   **Yes**, with DMV robustness qualification added.
2. Every Introduction contribution has a later technical/evaluation anchor:
   **Yes** (Sections 4--8 and the cited artifacts).
3. Any claim stronger than its evaluated population: **No after correction**;
   DMV/Census/M2.33 scopes are explicit.
4. Any sentence implying wall-clock speedup: **No**.
5. Any sentence implying global optimality: **No**.
6. Any sentence implying design/sample invariance: **No**.
7. Any sentence implying capture contains payload bytes: **No**.
8. Any sentence implying patched PostgreSQL runs in production: **No**.
9. Any sentence implying the product uses DROP/SWAP: **No after correction**;
   Section 5 now labels those moves as development/library functionality.
10. Any sentence reviving CE-Replay as current runtime: **No**.
11. Any sentence claiming novelty assigned to prior art: **No**.
12. Correctness and robustness kept separate: **Yes**.
13. Repeated numerical values consistent: **Yes**.
14. Remaining unsupported claims explicitly listed: **Yes**, in the section
    above and in `notes/non-claims.md`.
