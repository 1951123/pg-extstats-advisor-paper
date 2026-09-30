# Strategy B technical-core hardening self-review v1.1

1. **One-sentence definition.** Yes. Section 4 now defines the substrate as a
   backend-local layer binding frozen advisor-derived MCV/FD payload states or
   `ABSENT_NATIVE` to candidate objects, exposing an ordered active subset to
   PostgreSQL's lookup path, and leaving CE semantics inside PostgreSQL.

2. **Figure communication.** Figure 1 presents the mechanism without prose:
   production/capture inputs flow to an advisor-derived repository, then by
   registration to a dashed backend-local overlay, and finally through native
   lookup to the PostgreSQL planner/CE. The invariant is printed in the
   figure, not inferred from implementation details.

3. **Cached-bytes attack.** A skeptical reviewer can see why the mechanism is
   more than cached bytes: the text and figure show candidate identity
   validation, relation/mechanism checks, explicit absent state, active
   membership, effective order, and native lookup/load integration.

4. **Extra functionality beyond caching.** The exact additions are visible in
   both the registration path and the overlay: payload-or-absence binding,
   shell/OID identity checks, ordered activation, filtering/reordering, and
   native deserialization/consumption.

5. **Backend-local state.** The dashed orange overlay, its session-lifetime
   label, and the caption make the backend-local boundary visually explicit.

6. **CE responsibility.** The green PostgreSQL planner/CE box contains
   lookup/filter, deserialization, MCV/FD semantics, and `EXPLAIN` estimate;
   Python is not shown as computing selectivity or cardinality.

7. **Shells versus deployment.** The prose distinguishes private-advisor
   shell creation used for catalog identity from production deployment. The
   figure labels the overlay as not persistent deployment, and Section 4.6
   states that final deployment is ordinary DBA-reviewed PostgreSQL DDL.

8. **Section 5 priority.** Section 5 remains a consequence/evaluation section:
   it explains reconstruction, native evaluation, query-level reuse, and
   secondary lower-bound pruning. It does not present pruning or ADD-only
   search as the primary contribution; the substrate definition and figure
   remain the technical center.

