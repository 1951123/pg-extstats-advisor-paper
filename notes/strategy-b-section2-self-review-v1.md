# Strategy B Section 2 self-review v1

This review covers the Background and Motivation draft only.

1. **Does Section 2 distinguish definitions from payloads?** Yes. It defines
   catalog definition state separately from MCV/dependency payload state and
   identifies `pg_statistic_ext` versus `pg_statistic_ext_data`.

2. **Does it explain why `ANALYZE` matters to search?** Yes. The physical
   baseline creates definitions, applies the target, runs `ANALYZE`, and then
   invokes native `EXPLAIN`; repeated configurations therefore repeat
   data-dependent materialization work.

3. **Does it acknowledge statistics-selection prior art?** Yes. MNSA,
   StatAdvisor, and DB2 statistical views/column groups are acknowledged as
   establishing workload-driven selection, interactions, and resource concerns.

4. **Does it acknowledge what-if physical-design prior art?** Yes. AutoAdmin,
   SQL Server DTA, and HypoPG are named and described as establishing
   hypothetical configuration analysis and planner-visible objects.

5. **Does it acknowledge pending/imported/restored statistics prior art?**
   Yes. Oracle pending/imported statistics, DB2 statistics-bearing objects,
   and PostgreSQL 19 `pg_restore_extended_stats()` are included.

6. **Is the remaining systems gap narrow?** Yes. It is a backend-local
   substrate for representable frozen native PG16.14 MCV/FD candidate states,
   selective activation, and native estimator consumption without per-design
   physical materialization.

7. **Could the section imply that what-if optimization is new?** No. It
   explicitly calls what-if configuration analysis and hypothetical objects
   established prior art.

8. **Could it imply that statistics injection is new?** No. It explicitly
   acknowledges testing, transporting, restoring, and delaying publication of
   precomputed statistics as established capabilities.

9. **Does CE-Replay appear only as historical external-model contrast?** Yes.
   It appears once in the design-alternatives discussion and is not described
   as the current runtime mechanism.

10. **Does the final paragraph lead into Strategy B?** Yes. It ends with the
    state-virtualization choice and points directly to Sections 3--5 for the
    contract, substrate, and native evaluation boundary.

No residual issue was identified that requires changing Sections 1, 3, 4, 5,
6, 7, 8, 9, or 10.
