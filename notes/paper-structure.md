# Paper structure (outline only)

This is a planning artifact, not formal manuscript prose. The ten-section
architecture is frozen below; section 8 has an explicit six-part evaluation
layout.

| Section | Purpose | Central claim | Reusable legacy source | New system material | Evidence dependencies |
|---|---|---|---|---|---|
| 1 Introduction | Motivate statistics-sensitive physical design | contextual estimator transitions require executable, design-parametric evaluation | Legacy introduction, REWRITE | thesis and advisor framing | claims matrix, thesis |
| 2 Background and Motivation | Establish extstats and design context | supported mechanisms and prior work define the boundary | Legacy background, KEEP + UPDATE | fixed-target/product context | bibliography, supported scope |
| 3 Problem Formulation and System Contract | Define inputs, constraints, and boundaries | fixed target, frozen realization, maintenance budget, and capture contract are explicit | Legacy problem formulation, KEEP + EXTEND | production/capture contract | supported-scope.md, evidence policy |
| 4 pg-extstats-advisor Architecture | Explain production/advisor separation | sealed capture enables offline advice without production credentials | NEW architecture material | capture, advisor, recommendation lifecycle | M2.30–M2.33 |
| 5 Statistics-Sensitive CE Semantics | Define native transition fragment | applicability, precedence, consumption, composition, and numerical updates stay executable | Legacy CE semantics, KEEP | scope hardening and realization terminology | source/audit evidence |
| 6 CE-Replay | Explain executable representation and two oracles | one transition system yields objective and counterfactual dependency interfaces | Legacy CE-Replay, KEEP | product terminology and contract | replay artifacts |
| 7 Statistics Physical Design | Connect semantics to contextual search | feasible local design can use contextual evaluation without a global-optimality claim | Legacy search/design, KEEP + SHORTEN | fixed-T workflow | Census search artifacts |
| 8 Evaluation | Answer RQ1–RQ4 | fidelity, contextual design, incremental exactness, closure, and robustness are separately evidenced | Legacy evaluation, REWRITE / REORGANIZE | current evidence integration | RQ evidence map |
| 9 Related Work | Position novelty boundary | contribution is the represented statistics-sensitive computation and its dual use, not generic theory | Legacy related work, KEEP + UPDATE | explicit boundary language | bibliography, reviewer risks |
| 10 Discussion, Limitations, and Conclusion | State implications and boundaries | claims remain within validated scope and evidence | Legacy conclusion, REWRITE | product/research split | non-claims, claims matrix |

## Section 8 evaluation layout

### 8.1 Experimental setup and scope

Workloads, PostgreSQL 16.14, fixed target, supported fragment, realization
terminology, metrics, and evidence policy.

### 8.2 RQ1 — Semantic fidelity

RQ1a frozen-realization correctness and RQ1b fresh-realization fidelity;
explicitly distinguish replay/native agreement from payload realization drift.

### 8.3 RQ2 — Contextual physical design

Singleton-positive/zero/negative behavior, contextual rescues, non-monotone
utility, and the maintenance-feasible Census design result.

### 8.4 RQ3 — Incremental evaluation

Semantic work reduction, exact move-value/decision preservation, and valid
operation-level timing boundaries.

### 8.5 RQ4a — End-to-end system closure

Capture, unavailable production, offline advise, preflight, deployment,
`ANALYZE`, verification, rollback, and Docker clean-room lifecycle.

### 8.6 RQ4b — Realization robustness

Bounded DMV M2.19/M2.20 evidence across independent realizations; robustness is
not design invariance.

The legacy manuscript source is `extended-stats-optim-v3/paper/pvldb2027` at
the recorded commit in `provenance/source-repositories.md`. It is source
material only; do not copy its generated PDF or experiment tree.

