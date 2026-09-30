# Strategy B Section 8 evidence ledger

This ledger records the tracked system-repository artifacts used by Section 8.
Numbers in the paper are rounded for readability; the artifact values below
are retained at full precision where available.  Derived percentages are
computed only from the cited artifact fields.

| Claim/table cell | Value | Experiment | Artifact path | Field/derivation |
|---|---:|---|---|---|
| DMV M2.18 effective queries | 1,963 | M2.18 | `experiments/dmv-m2-18-frozen-hyp-vs-physical/report.md` | exact estimate/q-error gate paragraph |
| DMV M2.18 selected design | 31 (8 MCV, 23 FD) | M2.18 | `experiments/dmv-m2-18-frozen-hyp-vs-physical/protocol.json`, `experiments/dmv-m2-18-frozen-hyp-vs-physical/final-design.json` | selected count and mechanism counts |
| DMV M2.18 objective | 22014.061316846422 | M2.18 | `experiments/dmv-m2-18-frozen-hyp-vs-physical/report.md` | hypothetical and physical objectives |
| DMV M2.18 baseline | 42791.986480127205 | M2.18 | `experiments/dmv-m2-18-frozen-hyp-vs-physical/report.md` | empty-baseline protocol value |
| DMV M2.18 fidelity | 1963/1963 estimates; 1963/1963 q-errors; 31/31 payloads | M2.18 | `experiments/dmv-m2-18-frozen-hyp-vs-physical/report.md`, `experiments/dmv-m2-18-frozen-hyp-vs-physical/protocol.json` | exact gates |
| DMV M2.17d catalog/search | 72 candidates; 32 rounds; 226.178 s | M2.17d | `experiments/dmv-m2-17d-frozen-full72-add/report.md` | search summary |
| DMV M2.17d final design | 31 (8 MCV, 23 FD); cost 175.422291756478746 | M2.17d | `experiments/dmv-m2-17d-frozen-full72-add/report.md` | final design paragraph |
| DMV M2.17d objective change | 42791.986480127205 -> 22014.061316846422; 48.555645% | M2.17d | `experiments/dmv-m2-17d-frozen-full72-add/report.md` | reported absolute/relative improvement |
| DMV contextual rescues | 12 accepted negative-singleton candidates | M2.17d | `experiments/dmv-m2-17d-frozen-full72-add/report.md`; corroborated by `experiments/dmv-m2-20-multisample-design-stability/summary.json` sample A | interaction evidence |
| Census catalog | 4,506 candidates; 19,996 incidence identities | M2.21 | `experiments/census-m2-21-frozen-authoritative/report.md` | authoritative run summary |
| Census effective queries | 468 | M2.21 | `experiments/census-m2-21-frozen-authoritative/report.md`, `experiments/census-m2-21-frozen-authoritative/physical-validation.json` | physical validation gate |
| Census screen | 226 candidates (215 MCV, 11 FD), all PRESENT | M2.21 | `experiments/census-m2-21-frozen-authoritative/report.md` | top-5% screen |
| Census search result | 113 rounds; 112 selected (110 MCV, 2 FD); cost 198.8975850452002434 | M2.21 | `experiments/census-m2-21-frozen-authoritative/report.md` | search summary |
| Census objective change | 5577.425518330484 -> 928.597323483826 | M2.21 | `experiments/census-m2-21-frozen-authoritative/report.md` | baseline/final objective |
| Census relative improvement | 83.350789...% (reported as 83.35%) | M2.21 | `experiments/census-m2-21-frozen-authoritative/report.md` | `(5577.425518330484-928.597323483826)/5577.425518330484*100` |
| Census bounded work | 19,210 moves; 2,441 pruned; 16,769 native evaluations; 88,654 planner calls | M2.21 | `experiments/census-m2-21-frozen-authoritative/report.md` | efficiency paragraph |
| Census repeat/physical gates | exact repeat; 468/468 estimates and q-errors | M2.21 | `experiments/census-m2-21-frozen-authoritative/report.md`, `experiments/census-m2-21-frozen-authoritative/replay-determinism.json`, `experiments/census-m2-21-frozen-authoritative/physical-validation.json` | repeat and validation paragraphs |
| M2.33 fixture | 2 candidates; 1 query; `public.fixture` | M2.33 | `experiments/m2-33-docker-cleanroom/lifecycle-summary.json` | fixture object |
| M2.33 lifecycle | all listed lifecycle and fail-closed checks PASS | M2.33 | `experiments/m2-33-docker-cleanroom/lifecycle-summary.json` | `status`, `checks` |
| M2.33 semantic repeat | cold/warm selected design, objective, recommendation digest equal; warm cache hit | M2.33 | `experiments/m2-33-docker-cleanroom/lifecycle-summary.json` | `semantic_reproducibility` |
| M2.33 production separation | patched private advisor; stock production; non-root; no host source mount | M2.33 | `experiments/m2-33-docker-cleanroom/build-provenance.json` | roles and provenance fields |
| M2.19 fresh robustness | 10 runs; all positive; 43.751352%--48.623259% relative improvement | M2.19 | `experiments/dmv-m2-19-fixed-design-fresh-sample-robustness/summary.json` | `run_count`, `all_positive`, min/max |
| M2.19 state stability | 28 always present; 3 flipped; 0 always absent | M2.19 | `experiments/dmv-m2-19-fixed-design-fresh-sample-robustness/summary.json` | candidate-state summary |
| M2.20 sample sizes | A/B/C/D/E selected sizes 31/31/31/28/30 | M2.20 | `experiments/dmv-m2-20-multisample-design-stability/design-membership.csv` | count selected rows per sample |
| M2.20 design overlap | Jaccard min 0.7428571428571429, median 0.8461174242424243, max 0.9375 | M2.20 | `experiments/dmv-m2-20-multisample-design-stability/summary.json` | `design_overlap` |
| M2.20 core | consensus core 25; near-core 28 | M2.20 | `experiments/dmv-m2-20-multisample-design-stability/summary.json` | list lengths |
| M2.20 portability | max relative gap 0.000089042... = 0.00891%; no foreign beats local | M2.20 | `experiments/dmv-m2-20-multisample-design-stability/cross-objective-gaps.csv` | maximum `max_relative_gap`, all `foreign_beats_local=False` |

## Deliberate non-claims

The artifacts do not provide a physical-per-design wall-clock baseline, a
speedup measurement, a global-optimum guarantee, native-sample equivalence
after a future `ANALYZE`, cross-version or join fidelity, temporal/schema drift
robustness, or production payload-byte equality.  Census M2.21 is the
authoritative corrected search case but uses its recorded 226-candidate screen;
it is not an exhaustive all-move optimization over all 4,506 candidates.
M2.33 is a synthetic clean-room lifecycle fixture, not a DMV production
workload.  No CE-Replay evidence is used in Section 8.
