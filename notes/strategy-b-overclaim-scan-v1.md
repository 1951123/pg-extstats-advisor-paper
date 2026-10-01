# Strategy B overclaim scan v1

The scan covered `paper/main.tex` and all Sections 1--10. Grouped occurrences are classified below; technical identity uses of “unique” are distinguished from novelty language.

| Phrase / locations | Classification | Rationale |
|---|---|---|
| `first` / `firstness` in Section 9 prior-art disclaimers | OK | Explicitly denies first what-if interface, first backend-local object, and firstness generally. |
| `unique precedence rank`, `unique target-relation estimate/node` in Sections 3 and 5 | OK | Local catalog or extraction invariants, not priority claims. |
| `novel` / `not novel` in Sections 2, 6, 9, and 10 | OK | Used to delimit production/test-server patterns, restoration, selection, search, and the prototype; no novelty overclaim. |
| `new CE`, `new search algorithm`, `new theorem`, `new selection algorithm` | OK | All occur as explicit non-claims. |
| `efficient`, `fast`, `faster`, `scalable` | No substantive occurrence | No unsupported performance or scalability characterization remains. |
| `speedup` in Abstract, Introduction, Section 5, Section 8 | OK | Explicitly denied or reported as not measured; operation counts are not converted into speedup. |
| `robust` / `robustness` | OK / QUALIFY | Always tied to bounded DMV independent-realization evidence; no invariance, drift, or universal robustness claim. |
| `practical` in the Introduction’s ordinary-design motivation and Section 10’s “practical what-if boundary” | OK / QUALIFY | The latter is scoped to PostgreSQL extended statistics in the validated fragment; neither claims production readiness. |
| `production` / `production-ready` | OK / QUALIFY | Production is stock and DBA-controlled; production readiness is explicitly denied. |
| `eliminate` | No substantive occurrence | No elimination claim remains. |
| `avoid` / `without` | OK / QUALIFY | These describe structural exclusions such as no per-design `ANALYZE`, no payload in capture, or no production credentials; they do not imply eliminating all `ANALYZE`, cost, or deployment work. |

**Overclaim conclusion:** No occurrence requires removal. The only wording edit made during this audit is a grammar correction in Section 9 (`and and commit material` → `and commit material`).
