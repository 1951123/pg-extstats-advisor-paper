# Paper structure (outline only)

This is a planning artifact, not formal manuscript prose. The section numbers
below may be combined at typesetting time.

| Section | Purpose | Key claims | Legacy material reusable? | New material needed | Evidence dependency |
|---|---|---|---|---|---|
| 1 Introduction | Motivate statistics-sensitive physical design | contextual semantics and scoped advisor | REWRITE | system framing | claims matrix |
| 2 Background and Motivation | Establish extstats and design context | supported mechanisms and prior work | KEEP + UPDATE | target/product context | bibliography, scope |
| 3 Problem Formulation and System Contract | Define inputs, constraints, and boundaries | fixed target, frozen realization, maintenance budget | KEEP + EXTEND | capture contract | supported-scope.md |
| 4 Architecture | Explain production/advisor separation | sealed capture and offline advice | NEW | full system architecture | M2.30–M2.33 |
| 5 Statistics-Sensitive CE Semantics | Define native transition fragment | applicability, precedence, composition | KEEP | scope hardening | source/audit evidence |
| 6 CE-Replay | Explain executable representation and oracles | objective and dependency interfaces | KEEP | product terminology | replay artifacts |
| 7 Statistics Physical Design | Connect semantics to contextual search | feasible local design, not global optimum | KEEP + SHORTEN | fixed-T workflow | Census search artifacts |
| 8 Evaluation | Answer four RQs | bounded fidelity, design, incremental, closure claims | REWRITE / REORGANIZE | system evidence integration | evidence map |
| 9 Related Work | Position novelty boundary | specialization is scoped and explicit | KEEP + UPDATE | current related work audit | bibliography |
| 10 Discussion, Limitations, and Conclusion | State boundaries and implications | no overclaiming | REWRITE | product/research split | non-claims.md |

The legacy manuscript source is `extended-stats-optim-v3/paper/pvldb2027` at
the recorded commit in `provenance/source-repositories.md`. It is source
material only; do not copy its generated PDF or experiment tree.

