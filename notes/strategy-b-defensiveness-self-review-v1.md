# Strategy B Defensiveness Self-Review v1

## 1. Essential negative statements retained

The manuscript deliberately retains negative or contrastive wording where it
is the clearest scientific boundary:

- same-realization fidelity is distinct from fresh-`ANALYZE` behavior;
- independent-realization robustness is DMV-only and is not design invariance;
- the current evidence has no physical-per-design wall-clock baseline and
  operation counts are not speedup;
- the product search is ADD-only and ends at an ADD-local optimum;
- the target is externally fixed and target-specific;
- capture bundles do not contain native payload bytes;
- production remains stock PostgreSQL and deployment is DBA-controlled;
- the M2.33 lifecycle fixture is synthetic and not production readiness;
- HypoPG, workload-driven selection, restore/import, and offline tuning are
  established prior-art families;
- joins, higher arity, cross-version portability, automatic deployment, and
  global/approximation guarantees remain outside scope.

These are Category A/B boundaries, not removable rhetorical defenses.

## 2. Repeated defenses converted to positive contract language

Representative conversions include:

- “We make no runtime claim...” -> “This identifies the evaluation boundary
  that the system changes.”
- “The product does not claim ADD/DROP/SWAP search novelty...” -> “Richer
  ADD/DROP/SWAP moves remain development/library functionality...”
- “It does not claim that the private advisor never runs ANALYZE...” ->
  “Acquisition and cache reconstruction can run ANALYZE before search; the
  search loop has no per-design CREATE/DROP/ANALYZE.”
- “The product path makes no claim...” -> “The product path terminates at an
  ADD-local optimum under the current budget and realization.”
- “The Docker path is ... not novelty...” -> “The Docker path provides
  packaging and reproducibility evidence.”
- “What-if analysis ... are not claims...” -> “These works establish the
  what-if and hypothetical-object precedent.”

## 3. Section 1 reading flow

Yes.  The Introduction now foregrounds the payload/materialization boundary,
native CE authority, backend-local state, production separation, and the four
contributions.  One concise no-speedup sentence remains in the RQ preview so a
reader does not overread the operation-count evidence.

## 4. Section 9 completeness

Yes.  HypoPG remains the closest PostgreSQL hypothetical-object precedent;
AutoAdmin/DTA, MNSA, StatAdvisor/DB2, Oracle pending/import, and PostgreSQL 19
restore remain acknowledged.  The manuscript still distinguishes native
MCV/FD payload state, ordered transient subsets, workflow/state lifetime, and
the PG16.14 validated fragment.

## 5. Claim-strength check

No scientific claim became stronger.  Positive rewrites state facts already
present in the baseline; they do not add a speedup, novelty, optimality,
portability, production, or robustness claim.  Numerical results, evidence
populations, citations, RQs, and the PG16.14 implementation binding are
unchanged.

## 6. C1--C10 verification

| Claim | Verification |
|---|---|
| C1 backend-local native extstats substrate | Still stated in Introduction, Section 4, and Figure 1 |
| C2 PostgreSQL native CE authority | Still explicit in Introduction, Section 4, and Section 5 |
| C3 same-realization fidelity | Same-realization contract and RQ1 limitation retained |
| C4 no per-design search-loop materialization | Exact `CREATE/DROP/ANALYZE` boundary retained in Sections 5 and 8 |
| C5 bounded work/query reuse | Operation-count and query-granularity wording retained |
| C6 contextual utility | Contextual marginal utility and diagnostic singleton boundary retained |
| C7 ADD-only local design | ADD-only product path and ADD-local termination retained |
| C8 production-separated lifecycle | Stock production, private advisor, DBA deployment, and rollback limits retained |
| C9 bounded DMV realization robustness | DMV-only robustness and non-invariance limits retained |
| C10 fixed target | Externally fixed target and target-specific model contract retained |

## 7. Page count and layout

The baseline PDF had 13 pages and the rebuilt PDF has 13 pages.  No tables or
figures were restructured.  Visual inspection of pages 1--3, 7--9, and 12--13
showed normal paragraph flow, intact headings, and no clipped or ambiguous
content.

## 8. Build checks

- `make`: passed via the repository's `pdflatex`/`bibtex` fallback;
- `git diff --check`: passed;
- undefined citation/reference scan: none;
- overfull horizontal box scan: none;
- embedded fonts: yes;
- Type3 fonts: 0.
