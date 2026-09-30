# Figure specification: backend-local native extended-statistics substrate

The figure should be a three-stage left-to-right schematic, with a visible
boundary between persistent/derived inputs and backend-local hypothetical
state.

1. **Physical PostgreSQL / capture side (left, solid border).** Show
   candidate definitions and deployed statistics as the physical catalog
   context. Show a read-only capture arrow labelled `persisted sample +
   workload/truth/schema/compatibility metadata`.
2. **Advisor payload repository (middle, solid border but marked derived).**
   Show `P_1, P_2, ..., P_n` and `ABSENT_NATIVE` entries, with a note
   `derived from one frozen realization; no payload bytes in production
   capture bundle`. An arrow labelled `register(candidate identity, payload or
   absent marker)` enters the next box.
3. **Backend-local overlay and native planner (right).** Place a nested
   backend-local overlay containing `active ordered OID subset Y`. Connect it
   to a `native PostgreSQL planner` box containing `lookup/filter`,
   `deserialization`, `MCV/FD composition`, and `EXPLAIN estimate`.

Use a double-line or shaded boundary around the overlay and label it
`session/backend lifetime; not persistent deployment`. Label the central
invariant on the arrow to the planner:

> payload state is virtualized; estimator semantics stay native.

The figure must not include benchmark counts, latency, speedup, candidate
counts, or claims about arbitrary PostgreSQL mechanisms. It must not reuse the
historical CE-Replay figure or depict Python as computing MCV/FD selectivity.

