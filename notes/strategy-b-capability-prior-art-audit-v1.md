# Strategy B capability-level prior-art audit v1

Audit date: 2026-10-01.  This is a capability-level audit, not an
exhaustive literature survey and not a priority claim.  The audited paper
state is the immutable `submission-v2` tag at
`fb8c818f29d8994fcfbb3482a233e48d1f5d0d6e`; the audited system implementation
is the immutable `paper-v1-system` tag at
`88797e4b82ff1d5c8bbba28dc27987af78ce78ad`.  No manuscript, system code, or
experiment was changed for this audit.

## Question and interpretation boundary

The narrow question is whether reviewed prior art documents the equivalent of
retaining many independently realized native extended-statistics payload
states concurrently and repeatedly activating arbitrary alternative
subsets/configurations under the native optimizer during combinatorial
what-if search.

The phrase *independently realized* is used here in the conservative
candidate-state sense: each candidate object has its own native realization
and identity.  The frozen Strategy B evaluation uses one persisted sample and
one derived repository; it does **not** claim that each candidate was sampled
independently or that multiple independent sampling realizations can be
composed in one search run.  Where the phrase could be read as independent
sampling, the conclusion below is qualified rather than strengthened.

## Sources reviewed

The following sources were reviewed on 2026-10-01.  “Not found” below means
that the cited authoritative material did not establish the capability; it is
not a claim that no implementation anywhere can provide it.

* **P1 — frozen paper/system contract.** `submission-v2`, Sections 4--5,
  `notes/strategy-b-claims-matrix-v1.md`, and the system tag
  `paper-v1-system`.  These define the PG16.14 arity-two MCV/FD payload
  repository, explicit `ABSENT_NATIVE`, backend-local registration, ordered
  activation, and native planner consumption.
* **H1 — HypoPG usage documentation.**
  [HypoPG usage](https://hypopg.readthedocs.io/en/rel1_stable/usage.html)
  and the [REL1_STABLE README](https://github.com/HypoPG/hypopg/blob/REL1_STABLE/README.md).
  These document connection-private hypothetical indexes, planner-visible
  `EXPLAIN`, multiple hypothetical indexes, hide/unhide, drop, and reset.
* **O1 — Oracle pending statistics.**
  [Oracle `DBMS_STATS` documentation](https://docs.oracle.com/en/database/oracle/oracle-database/21/arpls/DBMS_STATS.html)
  and [`OPTIMIZER_USE_PENDING_STATISTICS`](https://docs.oracle.com/en/database/oracle/oracle-database/19/refrn/OPTIMIZER_USE_PENDING_STATISTICS.html).
  These document published versus pending statistics, session/system use of
  pending values, publish/delete, and export/import of collected statistics.
* **G1 — PostgreSQL 19 restore.**
  [PostgreSQL 19 statistics manipulation functions](https://www.postgresql.org/docs/19/functions-admin.html),
  [PostgreSQL 19 release notes](https://www.postgresql.org/docs/19/release-19.html),
  and [`pg_dump` statistics options](https://www.postgresql.org/docs/19/app-pgdump.html).
  These document `pg_restore_extended_stats()` creating/updating extended
  statistics values and the persistent catalog context.
* **A1 — AutoAdmin/DTA.**
  [Microsoft Research AutoAdmin](https://www.microsoft.com/en-us/research/project/autoadmin/),
  [AutoAdmin What-If Index Analysis](https://www.microsoft.com/en-us/research/publication/autoadmin-what-if-index-analysis-utility/?lang=fr-ca),
  [DTA XML input reference](https://learn.microsoft.com/en-us/sql/tools/dta/xml-input-file-reference-database-engine-tuning-advisor?view=sql-server-ver17),
  and [DTA test-server guidance](https://learn.microsoft.com/en-us/sql/relational-databases/performance/reduce-the-production-server-tuning-load?view=sql-server-ver17).
  These establish hypothetical physical configurations and workload-oriented
  what-if analysis, but do not document this paper's native MCV/FD payload
  repository semantics.
* **S1 — statistics advisors and DB2.**
  Chaudhuri and Narasayya's [statistics-management paper](https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/stats.pdf),
  [StatAdvisor](https://www.vldb.org/pvldb/vol2/vldb09-525.pdf),
  [Db2 statistical views](https://www.ibm.com/docs/en/db2/12.1.x?topic=optimization-statistical-views),
  [Db2 column-group statistics](https://www.ibm.com/docs/en/db2/11.1.0?topic=plans-column-group-statistics),
  and [Db2 RUNSTATS](https://www.ibm.com/docs/en/db2/12.1.x?topic=commands/runstats).
  These establish selection/recommendation, statistics-bearing views or
  column groups, and optimizer statistics collection, not the specific
  concurrent native-payload subset overlay audited here.

## Capability matrix

Every cell includes a source identifier.  `PARTIAL` means an adjacent
capability is documented but the exact state semantics are not.  `NO/NOT
FOUND` means the capability was not established in the reviewed source; it is
deliberately not a universal impossibility claim.

| Capability | This paper | HypoPG | Oracle pending stats | PG19 restore | AutoAdmin/DTA | Stats advisors |
|---|---|---|---|---|---|---|
| backend-local hypothetical state | YES [P1] | YES [H1] | NO/NOT FOUND [O1] | NO/NOT FOUND [G1] | PARTIAL [A1] | NO/NOT FOUND [S1] |
| data-derived statistics payload | YES [P1] | NO/NOT FOUND [H1] | YES [O1] | YES [G1] | PARTIAL [A1] | YES [S1] |
| native optimizer consumption | YES [P1] | YES [H1] | YES [O1] | YES [G1] | YES [A1] | YES [S1] |
| many candidate states retained concurrently | YES [P1] (candidate states under one frozen realization) | YES [H1] (many hypothetical indexes in one backend) | NO/NOT FOUND [O1] | NO/NOT FOUND [G1] | PARTIAL [A1] | PARTIAL [S1] |
| multiple independent realizations | PARTIAL [P1] (separate robustness samples exist, but are not composed concurrently) | NO/NOT FOUND [H1] | NO/NOT FOUND [O1] | NO/NOT FOUND [G1] | NO/NOT FOUND [A1] | NO/NOT FOUND [S1] |
| arbitrary subset composition | YES [P1] (representable frozen candidate subsets) | PARTIAL [H1] (multiple/hideable indexes; no extstats-state API) | NO/NOT FOUND [O1] | NO/NOT FOUND [G1] | PARTIAL [A1] (alternative physical configurations) | PARTIAL [S1] (recommendation/object sets, not payload overlay) |
| ordered subset activation | YES [P1] | NO/NOT FOUND [H1] | NO/NOT FOUND [O1] | NO/NOT FOUND [G1] | NO/NOT FOUND [A1] | NO/NOT FOUND [S1] |
| repeated switching during search | YES [P1] | PARTIAL [H1] (repeated API changes are documented; search-loop semantics are not) | NO/NOT FOUND [O1] | NO/NOT FOUND [G1] | PARTIAL [A1] (what-if search, not native payload switching) | NO/NOT FOUND [S1] |
| no per-design physical materialization | YES [P1] (search loop; acquisition is pre-search) | YES [H1] (hypothetical indexes) | PARTIAL [O1] (pending/import avoids publication, not gathering/materialization) | PARTIAL [G1] (restore can avoid immediate `ANALYZE`, but updates persistent state) | YES [A1] (hypothetical configurations) | PARTIAL [S1] (view/stats workflows still collect or maintain statistics) |

The matrix's decisive gap is not hypothetical objects, native optimizer use,
or statistics transport individually.  It is the combination of a
candidate-specific realized native payload repository, concurrent retention,
transient subset recombination, explicit order, and repeated native CE
evaluation.  Within the reviewed sources, that exact combination was not
found outside the bounded Strategy B implementation.

## Oracle pending-statistics audit

Oracle documents a published statistics state and a pending/private state.  A
newly gathered state can be kept pending (`PUBLISH=false`), tested by enabling
`OPTIMIZER_USE_PENDING_STATISTICS` for a session/system context, then
published or deleted; the documentation also describes exporting and
importing collected statistics.  This is a real native-optimizer testing and
transport precedent.

| Oracle capability question | Classification | Evidence and boundary |
|---|---|---|
| published versus pending state | SUPPORTED | O1 explicitly documents pending/private versus published statistics. |
| session-level use of pending statistics | SUPPORTED | O1 documents `OPTIMIZER_USE_PENDING_STATISTICS` and session/system scope. |
| export/import | SUPPORTED | O1 documents export/import and publish/delete workflows. |
| multiple independent pending realizations for one object | NOT FOUND | O1 does not document a concurrent repository of independently named pending payloads for one object. |
| concurrent repository of many candidate statistics states | NOT FOUND | O1 describes pending state and transport, not a candidate-state repository. |
| per-object independent activation | NOT FOUND | O1 does not describe an arbitrary per-object activation API for candidate states. |
| arbitrary subset composition across candidate objects | NOT FOUND | Session use of pending statistics is not documented as subset composition. |
| repeated `Y1/Y2/Y3/...` switching in a search loop | NOT FOUND | No such tuning-loop state-switching protocol appears in O1. |
| ordered configuration composition | NOT FOUND | O1 does not expose precedence/order composition for pending states. |
| retaining many candidate payloads without installing each configuration | NOT FOUND | Export/import transports collected state, but O1 does not establish concurrent retained candidate payloads with transient activation. |

Therefore, Oracle pending statistics provides the documented model
“published state versus pending state, selected by session policy,” not the
functional equivalent of “many-candidate configuration state space.”  The
reviewed Oracle material does not establish the repository, arbitrary subset,
ordered activation, or repeated combinatorial switching required by the
narrow question.  This is a `NOT FOUND` conclusion about the reviewed
documentation, not a claim that an undocumented Oracle implementation could
not provide additional machinery.

## HypoPG audit

HypoPG is the strongest adjacent architectural precedent.  Its documentation
supports multiple hypothetical indexes in one backend, connection-private
lifetime, planner-visible `EXPLAIN`, and hide/unhide/drop/reset operations.
Those operations establish backend-local hypothetical planner state and a
set-membership what-if interface for indexes.  The docs and README do not
describe data-derived payloads produced by `ANALYZE`, native MCV/FD payloads,
realization identity, or a legitimate `ABSENT_NATIVE` state.  They also do not
document an ordered activation contract for extended-statistics candidates or
a repeated native payload-state search loop.

The state distinction is material: a HypoPG index is a definition-derived
hypothetical object whose planner effects are computed by the index what-if
path; Strategy B stores native bytes (or an explicit native absence) produced
for a candidate statistics object and routes those bytes through PostgreSQL's
existing MCV/FD loading and estimation path.  The prior-art-safe claim is
therefore “HypoPG establishes backend-local hypothetical planner-visible
objects and set operations”; it does not establish the realized native
extended-statistics payload semantics in P1.

## PostgreSQL 19 restore audit

PostgreSQL 19 documents `pg_restore_extended_stats()` as creating or updating
extended-statistics values for a named statistics object, with a use case of
restoring optimizer statistics when `ANALYZE` has not yet run.  The function
updates persistent catalog state identified by relation/statistics-object
name; `pg_clear_extended_stats()` clears that state.  The surrounding
documentation warns that statistics manipulation is temporary in the sense
that later `ANALYZE` or related maintenance may overwrite it.

The reviewed PG19 material does not document a transient backend-local
candidate repository, multiple independent realizations for one candidate,
alternative subset activation, ordered composition, or combinatorial search.
Thus PG19 is direct prior art for persistent restore/update of native
statistics values and for avoiding an immediate `ANALYZE`; it is not documented
as the candidate-state overlay in P1.

## Adjacent-system audit

* **AutoAdmin/DTA.** The reviewed sources document hypothetical physical
  configurations, workload impact analysis, user-specified what-if
  configurations, and test/production separation.  They establish
  optimizer-backed what-if design exploration and avoidance of materializing
  every hypothetical physical structure.  The specific combination of many
  independently realized native extended-statistics payloads, concurrent
  retention, transient subset recombination, and repeated native CE evaluation
  was **not found in reviewed sources**.
* **MNSA/statistics advisors.** The reviewed statistics-management and
  StatAdvisor sources document workload-/optimizer-/data-driven statistics
  selection, recommendations, statistical views, and maintenance/collection
  concerns.  They establish advisor and recommendation patterns, but the
  specific native-payload repository plus ordered transient subset overlay was
  **not found in reviewed sources**.
* **Db2 statistical views and column groups.** These sources document
  statistics-bearing views/column groups and optimizer matching, with
  collection through the DB2 statistics machinery.  Multiple objects and
  optimizer use are established; concurrent independent payload realizations
  and repeated arbitrary subset activation under native CE were **not found
  in reviewed sources**.
* **Import/export/test-server workflows.** These workflows establish moving
  or testing collected statistics and separating tuning infrastructure from a
  production server.  They do not, in the reviewed material, establish a
  retained many-state repository with ordered transient subset switching.

## Novelty-boundary test

### 1. “Virtualize statistics state while leaving estimator semantics native”

**Classification: TOO BROAD.** HypoPG and AutoAdmin/DTA already establish
hypothetical planner-visible state and native optimizer what-if evaluation;
Oracle pending/import and PG19 restore establish native statistics-state
transport/testing.  This sentence is a useful design summary, not a safe
novelty boundary by itself.

### 2. “Virtualize realized native extended-statistics state”

**Classification: DEFENSIBLE.** Within the reviewed PG16.14 scope, P1
virtualizes native MCV/FD payload bytes and explicit native absence while
leaving PostgreSQL's supported estimator path in control.  The wording still
needs the PostgreSQL/version/mechanism qualifiers and must acknowledge
statistics import/restore as adjacent prior art.

### 3. “Retain multiple independently realized native extended-statistics
candidate states and transiently compose alternative ordered subsets for
repeated native what-if evaluation”

**Classification: STRONGLY DEFENSIBLE WITH A SCOPE QUALIFIER.** No reviewed
source documents this exact combination, and P1 directly implements the
candidate-specific repository, ordered activation, and repeated native
evaluation for a fixed realization.  To avoid overclaiming independent
sampling, the safest paper formulation is:

> Within the validated PostgreSQL 16.14 base-relation fragment, the advisor
> retains candidate-specific realized native MCV/FD payload states (or
> `ABSENT_NATIVE` outcomes) in an advisor-side repository and transiently
> activates ordered representable subsets for repeated native what-if
> evaluation under one fixed realization.

If “independently realized” is intended to mean independently sampled
realizations, this formulation becomes **UNCERTAIN** for the frozen paper and
should not be used.  The current evidence supports independently retained
candidate states, not independent sampling composition.

## Direct Oracle stress-test answer

No functional equivalent was found in the reviewed Oracle documentation.  The
documented model is one published/private-pending choice tested through a
session/system optimizer setting, plus publish/delete and export/import of
collected statistics.  The documentation does not establish a many-state
candidate repository, per-candidate arbitrary subset activation, ordered
composition, or repeated `Y1/Y2/Y3/...` switching under native CE.  The
distinction is therefore “pending statistics testing and transport” versus a
many-candidate transient configuration state space.

## Direct PG19 stress-test answer

`pg_restore_extended_stats()` is documented as persistent create/update/restore
of extended-statistics values for a named object, with later statistics
maintenance able to overwrite the state.  It is not documented as a
transient backend-local candidate repository or an alternative-subset
activation mechanism.  The safe distinction is persistent restore/update
versus transient candidate-state composition.

## Direct HypoPG stress-test answer

HypoPG transfers backend locality, planner-visible hypothetical objects,
multiple objects in one backend, and set operations such as hide/unhide/drop
and reset.  It does not, in its reviewed documented interface, transfer
data-derived realized MCV/FD payload state, realization identity,
`ABSENT_NATIVE`, ordered extstats activation, or repeated native payload-state
composition.  The technical distinction is definition-derived hypothetical
index state versus data-derived native extended-statistics payload state.

## Reviewer-A answer (maximum four sentences)

After subtracting established hypothetical physical-design what-if,
statistics recommendation, pending/import/restore, and test-server
workflows, the residual contribution is a PostgreSQL 16.14 bounded substrate
for candidate-specific realized MCV/FD payload state.  It retains those
native payload states in an advisor-side repository and transiently activates
ordered representable subsets while PostgreSQL performs native applicability,
precedence, consumption, composition, and CE.  The reviewed sources document
adjacent capabilities but not this exact combination of realized
extended-statistics state retention and repeated subset recombination.  This
is a reviewed-prior-art distinction, not a first/unique claim.

## Residual uncertainty

1. This is a bounded review of authoritative documentation and selected
   papers, not an exhaustive search of proprietary implementations, patents,
   source trees, or unpublished systems.
2. Oracle documentation does not explicitly state a universal cardinality
   limit of one pending realization per object; the conservative result is
   `NOT FOUND`, not “impossible.”
3. AutoAdmin/DTA and commercial advisor internals may implement state
   management that is not exposed by the reviewed public documentation.
4. “Independently realized” is ambiguous between independent candidate-object
   realization and independent sampling.  The frozen evidence supports the
   former under one fixed realization, not the latter as a concurrent
   composition claim.
5. HypoPG's documented index set operations are a genuine architectural
   precedent; the surviving distinction must remain about realized native
   MCV/FD state and the bounded PG16.14 activation contract.

## Recommendation

**NOVELTY BOUNDARY DEFENSIBLE.** Keep the contribution scoped to the
validated PG16.14 base-relation MCV/FD fragment and phrase it as a distinction
from reviewed prior art, not as “first,” “unique,” or “no prior system.”  The
safest surviving formulation is the scoped paragraph in Novelty-boundary test
3 above.  No manuscript change is made by this audit; if the existing paper
already uses the broader phrase, it should be read as a design summary rather
than an unrestricted novelty claim.

## Audit conclusion

Within the reviewed prior art, no source was found that documents many
candidate-specific realized native extended-statistics payload states retained
concurrently and transiently recombined as ordered subsets for repeated native
what-if evaluation.  HypoPG, Oracle pending statistics, PG19 restore,
AutoAdmin/DTA, and statistics advisors each establish important adjacent
capabilities, so the claim must remain bounded and explicitly acknowledge
those precedents.
