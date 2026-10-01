# M2.36 Paper Integration v1

M2.36 is integrated as bounded RQ2 supporting evidence only.  The paper now
reports the six-design DMV materialization-cost pilot from the authoritative
system artifact `experiments/dmv-m2-36-physical-materialization-pilot/`:
median physical materialization 0.1168 s, hypothetical activation 0.000421 s,
physical total 0.3921 s, hypothetical total 0.2795 s, and a 1.414x median
total ratio (observed range 1.326--1.668x).

Changed manuscript locations:

- Section 5: replaces the obsolete statement that no physical baseline was
  measured with a bounded-pilot qualification.
- Introduction, Section 8 opening/RQ2, and conclusion: acknowledge the pilot
  while retaining the no-general-speedup boundary.
- Section 8 RQ2: adds the protocol, common planner-call control, timing result,
  and M2.18/M2.35 fidelity-evidence boundary.

The claims matrix records M2.36 as supporting C4/C5 only.  It does not create a
new RQ, change the native-CE, same-realization, contextuality, lifecycle, or
DMV-robustness claims, and does not change any numerical result from prior RQs.
The pilot is DMV-only, environment/workload/design-sequence specific, and does
not support universal, production, end-to-end, Census-scale, or advisor-quality
speedup claims.  The system repository and experiments were not modified or
rerun for this integration.
