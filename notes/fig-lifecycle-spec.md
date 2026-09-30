# Figure specification: production-separated lifecycle

## Purpose

Show the trust and execution boundary for Section 7 without duplicating
Figure 1's backend-local substrate internals.

## Layout

Use two lightly shaded vertical zones separated by a labeled boundary:

```text
PRODUCTION ZONE                 ADVISOR ZONE
stock PostgreSQL 16.14         private patched PostgreSQL 16.14
read-only capture               frozen realization / payload repository
                                native evaluator / fixed-T search
        |                                    |
        | read-only capture                 | no production credentials
        v                                    |
   SEALED BUNDLE  --------------------------+
        | transfer                           |
        v                                    |
                                  RECOMMENDATION
                                  selected design + DDL
                                             |
                                             | DBA-controlled review/deploy
                                             v
PRODUCTION ZONE: CREATE STATISTICS + ALTER STATISTICS + ANALYZE
                                             |
                                             v
                                  VERIFY / optional ROLLBACK
```

## Required labels

- `production unavailable after capture: allowed`
- `no production credentials during advise`
- `capture excludes payload bytes`
- `fresh stock ANALYZE creates a new production realization`

## Boundary semantics

- The production side is stock PostgreSQL and read-only during capture.
- The patched backend-local overlay appears only in the advisor zone.
- The sealed bundle contains sample/workload/truth/schema/compatibility inputs,
  not `pg_statistic` rows, extstats payload bytes, search state, or a
  recommendation.
- Deployment SQL returns to ordinary stock PostgreSQL DDL and manual DBA
  control.

## Rendering decision

This is a deferred layout-pass specification.  Section 7 remains prose-only
in the current draft so the lifecycle figure does not crowd the 9-page
working PDF or duplicate the substrate figure.
