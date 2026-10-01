# Strategy B Defensiveness Reduction Audit v1

## Scope

This audit compares the manuscript at baseline
`a6a8a4e6d8e039dea62bc4b6a8da4430a4dbf26c` with the current working-tree
polish.  The authoritative claims matrix, evidence audit, related-work
boundary, final reviewer audit, camera-ready audit, and `notes/non-claims.md`
were used as the boundary authorities.  No experiment, system-repository
change, numerical result, citation, RQ, or frozen implementation binding was
changed.

The phrase-family count below uses the requested constructions (`does not
claim`, `not a`, `rather than`, `is not`, `no speedup`, and related forms).  A
line can contain more than one ordinary negative word; the count is a phrase
match count, not a claim count.

| Measure | Baseline | Current | Result |
|---|---:|---:|---|
| Requested defensive phrase matches | 76 | 54 | 22 removed or recast |
| Category A scientific-boundary occurrences | 51 | 51 substantive boundaries | preserved |
| Category B prior-art occurrences | 7 | 7 substantive acknowledgements | preserved; several recast positively |
| Category C repetitive occurrence groups | 18 | 18 addressed | rewritten, removed, or intentionally retained when still useful |

The A/B/C counts are occurrence-group classifications; phrase-level matches
can exceed the group count when one sentence contains multiple constructions.
Each semicolon-delimited item below is an audited occurrence or tightly coupled
occurrence group.

## Classified audit

| Location | Current/baseline wording audited | Category A/B/C | Proposed action | Claim risk |
|---|---|---|---|---|
| Introduction | “issue is not merely the number of candidates” | A | Retain: distinguishes state/materialization boundary from catalog size | LOW |
| Introduction | “families are not claims of this paper” | B | Recast as “families establish the surrounding design space; our narrower focus...” | LOW |
| Introduction | “repository is not by itself”; “not a generic virtualization theory” | C | Recast repository as the state consumed by the mechanism and keep validated-fragment scope | LOW |
| Introduction | “consumer ... rather than the novelty center”; “does not claim ADD/DROP/SWAP ... or a global optimum” | C | Recast as substrate-consumer and explicitly describe richer moves as library functionality | LOW |
| Introduction | “not a speedup ... baseline”; “without implying a substrate failure” | A | Retain: RQ2 and robustness boundaries | LOW |
| Introduction | “evidence, not a separate conceptual novelty claim” | C | Recast as evidence for the substrate/workflow within scope | LOW |
| Background | payload “not a constant property”; `ABSENT_NATIVE` “rather than fabricating” | A | Retain: realization and absence semantics | LOW |
| Background | “selection problem is not new”; “not claims of this paper” | B | Recast as established selection/what-if/transport prior art and defer detail to Section 9 | LOW |
| Background | “not generic what-if optimization” | C | Recast as a positive PG16.14/one-relation/fixed-target scope sentence | LOW |
| Problem | “not a new optimization formulation/global search”; “not an optimization variable” | C | Recast as an established subset objective with externally fixed $T$ | LOW |
| Problem | display order “is not semantic”; catalog counts “not a product constant”; benchmark counts “rather than limits” | A | Retain: contract identity and benchmark scope | LOW |
| Problem | $R$ “is not capture bundle” and “is not a promise about future ANALYZE” | A | Retain: realization provenance boundary | LOW |
| Problem | fabricated payload/`UNREGISTERED`/fail-closed wording | A | Retain: valid absence versus invalid identity semantics | LOW |
| Problem | `EXPLAIN`, not learned/external model; cost not universal/causal | A | Retain: native-execution and maintenance-model boundaries | LOW |
| Problem | “is not robustness”; “not design invariance”; capture has no payload bytes/sample-equivalence claim | A | Retain: correctness/robustness and capture contract distinctions | LOW |
| Substrate | preserve `ABSENT_NATIVE` “rather than silently” dropping/fabricating; “not a generic DBMS model” | A/C | Retain absence semantics; shorten generic-theory disclaimer to supported-fragment wording | LOW |
| Substrate | cost is “not used as proxy”; malformed payload “rather than fallback” | A | Retain: cost and fail-closed semantics | LOW |
| Substrate | evaluation environment “not a replacement production server”; no cross-version; scope table “not a claim...” | A | Retain: production, portability, and scope boundaries | LOW |
| Substrate | “without claiming a generic virtualization theory” | C | Recast as “within the supported fragment” | LOW |
| Native Evaluation | private advisor “does not claim never runs ANALYZE”; “no measured wall-clock speedup” | A/C | State positively that acquisition runs before search; retain no-speedup evidence boundary | LOW |
| Native Evaluation | lower-bound pruning “not a general search/global-optimality claim” | C | Recast as a bounded search-client optimization | LOW |
| Native Evaluation | same-realization “not ... reimplements estimator” | A/C | Recast as overlay leaving estimator implementation in PostgreSQL | LOW |
| Native Evaluation | CE-Replay “not runtime mechanism” | A/B | Recast as historical alternative/current native semantics | LOW |
| Search | contextual utility “not a fixed singleton score”; cost not universal/causal; current marginal score “not fixed” | A | Retain: contextuality and maintenance-model boundaries | LOW |
| Search | “rather than proposing a new theorem”; “does not claim ... pruning”; restricted set “not a theorem” | C | Recast as established behavior, diagnostic singleton evidence, and explicit catalog input | LOW |
| Search | “no claim of search novelty/global optimum”; “not DROP/SWAP local”; singleton not universally safe | C/A | Recast termination as ADD-local and retain DROP/SWAP/library and diagnostic limits | LOW |
| Architecture | overlay “not production”; operational boundary “rather than novelty” | A/C | Recast as evaluation confinement and established operational pattern | LOW |
| Architecture | bundle not anonymized/encrypted; future ANALYZE equivalence; pre-search not per-design | A | Retain: security, realization, and materialization boundaries | LOW |
| Architecture | rollback does not restore state/is not automatic; no automatic deployment/rollback | A | Retain: DBA-controlled lifecycle limitation | LOW |
| Architecture | Docker “not novelty” and not byte-identical | A/C | Recast packaging/semantic reproducibility positively; retain binary/image limitation | LOW |
| Evaluation | not wall-clock baseline/speedup; not future sample; not second production workload | A | Retain all three population/evidence boundaries | LOW |
| Evaluation | planner-internal reuse, pruning theorem, exhaustive-move interpretation | A | Retain: query-granularity, diagnostic, and screened-search limits | LOW |
| Related Work | “not priority claim”; “do not claim restoration/injection novelty”; “rather than persistent restored state” | B | Recast prior art and workflow/state-lifetime distinction; preserve PG16.14 scope | LOW |
| Related Work | final generic-support/new-selection boundary | B | Retain bounded native-state workflow and selection boundary | LOW |
| Conclusion | state boundary “rather than reimplementation”; evidence “not general theory”; no global/approximation, no speedup/query latency, DMV-only robustness | A | Retain substantive limitations and positive design lesson | LOW |
| Conclusion | production dependency “not”; no novelty for established capabilities | B/C | Recast stock-production implication and established prior-art capabilities | LOW |

## Edits made

The working-tree polish changes only nine manuscript section files:

- Introduction: contribution-first substrate/search wording;
- Background: positive design-space/prior-art framing;
- Problem: contract wording for bounded objective and fixed target;
- Substrate: positive supported-fragment statement;
- Native Evaluation: positive materialization, native-CE, and historical-line
  wording;
- Search: ADD-local termination and diagnostic contextuality wording;
- Architecture: evaluation confinement and Docker evidence wording;
- Related Work: prior-art precedent and workflow distinction wording;
- Conclusion: stock-production implication and prior-art wording.

No table, figure, equation, citation, result, RQ, or scope row was edited.
Essential Category A boundaries remain explicit, and Section 9 still owns the
detailed prior-art boundary.  The manuscript remains at 13 pages after the
rebuild.
