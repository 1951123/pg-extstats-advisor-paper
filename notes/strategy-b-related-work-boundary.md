# Strategy B related-work boundary freeze

Audit date: 2026-09-30. This note freezes the prior-art boundary before any
Abstract or Introduction rewrite. It uses authoritative papers, vendor
documentation, PostgreSQL 19 documentation/commit material, and the current
system implementation at `88797e4b82ff1d5c8bbba28dc27987af78ce78ad`. It is a
boundary audit, not an exhaustive literature survey. No experiment was run.

## Authoritative references used

* Chaudhuri and Narasayya, “Automating Statistics Management for Query
  Optimizers,” *IEEE TKDE* 13(1), 2001, pp. 7–20, DOI
  `10.1109/69.908978` (`chaudhuri2001statistics`). The paper establishes
  workload-/optimizer-/data-driven statistics selection, creation/update
  overhead, and MNSA-style reduction of non-essential statistics.
* Chaudhuri and Narasayya, AutoAdmin “What-If” Index Analysis Utility, *SIGMOD
  1998*, pp. 367–378, DOI `10.1145/276304.276337`
  (`chaudhuri1998whatif`). The utility evaluates workload effects of
  hypothetical physical configurations without materializing indexes.
* El-Helw, Ilyas, and Zuzarte, “StatAdvisor: Recommending Statistical Views,”
  *PVLDB* 2(2), 2009, pp. 1306–1317, DOI `10.14778/1687553.1687556`
  (`elhelw2009statadvisor`). StatAdvisor recommends interacting statistical
  views for workloads in an IBM DB2 prototype.
* Microsoft Database Engine Tuning Advisor documentation (`microsoftdta`).
  Its user-specified Configuration evaluates hypothetical indexes, indexed
  views, or partitioning against a workload without implementing them.
* HypoPG official project/documentation (`hypopg`). Hypothetical indexes are
  backend-local and planner-visible through `EXPLAIN`, with per-backend reset,
  hide/unhide, and multiple hypothetical indexes.
* Oracle, “Controlling the Use of Optimizer Statistics” and “Importing and
  Exporting Optimizer Statistics” (`oraclependingstats`, `oracleimportstats`).
  Oracle supports pending statistics, session-level pending-statistics testing,
  and export/import of collected statistics.
* IBM Db2, “Statistical views” and “Column group statistics” (`db2statviews`).
  Db2 supports statistics on query-defined views, column groups, optimizer
  matching, and multiple statistics-bearing objects.
* PostgreSQL Global Development Group, PostgreSQL 19 documentation,
  `pg_restore_extended_stats()` (`postgresql19restore`) and PostgreSQL
  commit-mail announcement (`postgresql19restorecommit`). The function
  creates/updates extended-statistics values after restore without requiring an
  immediate `ANALYZE`, but the state is persistent and version-scoped.

## Capability matrix

Entries are deliberately conservative: `NO EVIDENCE FOUND` means that the
audited authoritative source did not establish the capability, not that the
system can never provide it.

| Capability | MNSA | StatAdvisor / DB2 statviews | AutoAdmin / DTA | HypoPG | Oracle pending/import | PostgreSQL 19 restore | pg-extstats-advisor |
|---|---|---|---|---|---|---|---|
| workload-driven statistics selection | YES | YES | PARTIAL | NO EVIDENCE FOUND | PARTIAL | NO EVIDENCE FOUND | YES |
| maintenance-aware statistics selection | PARTIAL | PARTIAL | PARTIAL | NO EVIDENCE FOUND | PARTIAL | NO EVIDENCE FOUND | YES (scoped proxy) |
| statistics interactions | PARTIAL | YES | PARTIAL | PARTIAL (index state) | PARTIAL | PARTIAL | YES (MCV/FD native behavior) |
| optimizer-backed what-if configurations | PARTIAL | PARTIAL | YES | YES (indexes) | PARTIAL | PARTIAL | YES (extstats subset) |
| backend-local hypothetical objects | NO EVIDENCE FOUND | NO EVIDENCE FOUND | PARTIAL | YES | PARTIAL | NO EVIDENCE FOUND | YES (backend-local overlay) |
| precomputed statistics import | NO EVIDENCE FOUND | PARTIAL | NO EVIDENCE FOUND | NO EVIDENCE FOUND | YES | YES | PARTIAL (derived native repository) |
| pending/unpublished statistics testing | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | YES | NO EVIDENCE FOUND | NO EVIDENCE FOUND |
| multivariate / column-group statistics | NO EVIDENCE FOUND | YES | NO EVIDENCE FOUND | NO EVIDENCE FOUND | YES | YES | YES (MCV/FD arity two) |
| multiple statistics-bearing objects | PARTIAL | YES | PARTIAL | YES (indexes) | YES | YES | YES |
| selective enable/disable | PARTIAL | PARTIAL | PARTIAL | YES (hide/unhide/reset) | PARTIAL (session pending policy) | PARTIAL (object update/clear) | YES (activation subset) |
| arbitrary configuration search | PARTIAL | PARTIAL | YES | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | PARTIAL (representable catalog subsets) |
| native optimizer evaluation of hypothetical configurations | PARTIAL | YES | YES | YES | YES (pending/imported state) | YES (restored state) | YES |
| no repeated per-design statistics collection | NO EVIDENCE FOUND | NO EVIDENCE FOUND | PARTIAL | YES (hypothetical indexes) | PARTIAL | YES for restore state | YES in search loop |
| PostgreSQL native MCV/FD payloads | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | PARTIAL (native extstats fields) | YES |
| concurrent candidate payload repository | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | YES |
| backend-local extstats subset activation | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | NO EVIDENCE FOUND | YES |
| no physical catalog deployment per design | PARTIAL | PARTIAL | YES | YES (indexes) | PARTIAL | PARTIAL | YES (search configurations) |

The matrix does not claim that the final column is globally unique. It shows
that the surviving combination is a PostgreSQL-native extended-statistics
substrate: native MCV/FD payload realization, explicit absent-native states,
ordered backend-local subset activation, and native CE evaluation in a search
loop.

## Established prior art — not our contribution

The paper must acknowledge directly that the following are established:

* workload-driven statistics selection;
* statistics maintenance constraints and collection overhead;
* statistics interactions and configuration-dependent utility;
* what-if physical-design configuration search;
* backend-local hypothetical planner-visible objects;
* native optimizer evaluation of hypothetical configurations;
* statistics transport, import, restore, and precomputed statistics;
* pending or test statistics;
* production/test-server separation;
* recommendation and advisor lifecycle patterns.

The contribution is not “a new statistics advisor,” “the first hypothetical
statistics system,” or “what-if search.”

## Surviving mechanism claim audit

Candidate wording:

> `pg-extstats-advisor` provides a backend-local what-if substrate for the
> supported PostgreSQL extended-statistics fragment: native MCV/FD candidate
> payloads derived under one frozen realization are retained independently of
> deployed catalog state, representable candidate subsets can be activated
> transiently, and PostgreSQL's native estimator evaluates those configurations
> without per-design ANALYZE or physical deployment.

| Phrase | System status | Prior-art status | Frozen wording decision |
|---|---|---|---|
| backend-local what-if substrate | Supported by the patch and adapter | Hypothetical-object pattern established | Use with PostgreSQL/extstats scope; no general novelty claim |
| supported PostgreSQL extended-statistics fragment | Supported: PG16.14, one relation, fixed T, arity-two MCV/FD | Scope is narrower than general stats systems | Required qualifier |
| native MCV/FD candidate payloads | Native send/deserialize bytes and `ABSENT_NATIVE` states | Native extstats payload injection is not established by the cited general systems, but no priority claim | Safe factual description |
| derived under one frozen realization | Supported by fixed persisted sample plus derived repository | Imported/pending stats show that precomputed state is prior art | State same-realization and non-native-sample-equivalence limits |
| retained independently of deployed catalog state | Repository/cache retains bytes; capture bundle does not | Statistics import/restore is prior art | Say advisor-side repository/cache, not production capture |
| representable candidate subsets activated transiently | Backend-local ordered activation API supports catalog subsets | Hypothetical configuration/enablement is prior art | Limit to representable frozen catalog subsets |
| native estimator evaluates configurations | Native PostgreSQL `EXPLAIN` consumes overlay state | Native optimizer evaluation is prior art | Distinguish PG MCV/FD implementation only |
| without per-design `ANALYZE` | No per-move collection; acquisition/recreation occurs before search | What-if systems establish this broadly | Safe only with “per-design/per-move search loop” qualifier |
| without physical deployment | Overlay configurations are transient; final recommendation is separately deployable | Established what-if pattern | Not novel alone |

## Key design insight

**Virtualize statistics state, not cardinality-estimator semantics** is
technically accurate as a design summary, provided it is not presented as a
general theory. Legacy CE-Replay externalizes a bounded estimator transition
system in Python. The current system externalizes/virtualizes the statistics
state consumed by PostgreSQL's native estimator: payload bytes, absent-native
state, identity, activation membership, and order. PostgreSQL remains the
semantic authority.

## Reviewer-attack boundary

### “HypoPG, but for extended statistics”

This analogy is serious. HypoPG establishes backend-local planner-visible
hypothetical objects and transient configuration state. The defensible
distinction is narrower: native multivariate MCV/FD payload state, payload
derivation and serialization, explicit `ABSENT_NATIVE`, ordered activation,
configuration search, and native PostgreSQL CE consumption. The paper must
acknowledge that the hypothetical-object pattern itself is prior art.

### “Oracle already has pending statistics”

This is also serious for pre-gathered/pending native statistics testing and
statistics import. The audited Oracle documentation establishes pending
statistics selected by session policy and export/import of collected state. It
does not establish arbitrary independent composable candidate configurations;
the paper must not claim that Oracle lacks statistics testing. The remaining
distinction is a PostgreSQL backend-local extstats subset overlay, not pending
statistics in general.

### “DB2 statistical views already do this”

DB2 establishes multiple statistics-bearing objects, column groups, optimizer
matching, and workload recommendation. The defensible distinction is only
the PostgreSQL native base-table MCV/FD payload virtualization and ordered
backend-local activation; no general claim about statistical-view systems is
permitted.

### “PG19 restores extended statistics”

PostgreSQL 19 now documents `pg_restore_extended_stats()`, which creates or
updates extended-statistics fields after restore and can avoid an immediate
`ANALYZE`. This is a direct overlap in precomputed native statistics state.
The supported distinction is persistent restore/update versus this project's
transient backend-local candidate-subset overlay used for many configurations.
The distinction is not a claim that PG19 cannot support the workflow or that
the patch is broadly novel beyond PG16.14.

### “Just cache payloads”

The patch is more than a byte cache: it validates candidate identity and
relation ownership, represents `ABSENT_NATIVE`, replaces active membership and
precedence order, and hooks native planner lookup/consumption. Those are the
tested semantics. They do not constitute a generic virtualization theory.

## Final novelty wording

### Safe claim

> A PostgreSQL 16.14 backend-local what-if substrate virtualizes supported
> native MCV/FD statistics state for representable candidate subsets, allowing
> native CE evaluation without per-design search-loop `ANALYZE` or physical
> deployment.

### Strong but defensible claim

> Within the validated PG16.14 base-relation fragment, `pg-extstats-advisor`
> combines native MCV/FD payload derivation, explicit absent-native states,
> ordered transient subset activation, and native optimizer evaluation in a
> fixed-realization contextual design workflow, while acknowledging prior
> hypothetical-object, statistics-import, and advisor systems.

### Unsafe claim

Avoid:

* “a new statistics advisor” as a novelty claim;
* “the first hypothetical statistics system”;
* “the first arbitrary hypothetical statistics configuration interface”;
* “unique native statistics virtualization”;
* “no prior system can test or restore precomputed statistics”;
* “eliminates statistics collection” without the per-design/per-move qualifier;
* “general PostgreSQL” or cross-DBMS support.
