# Strategy B introduction self-review v1

1. **Cold-reviewer primary contribution.** The title, abstract, and opening
   three introduction paragraphs identify a native PostgreSQL backend-local
   what-if substrate for extended-statistics payload states as the primary
   contribution. They do not present CE-Replay or search as the headline
   contribution.

2. **"HypoPG for extended statistics" risk.** A reviewer could still use that
   shorthand analogy because both systems expose backend-local hypothetical
   planner state. The text distinguishes the system by its native MCV/FD
   payload repository, explicit `ABSENT_NATIVE` state, ordered activation,
   candidate configuration search, and delegation of estimation to PostgreSQL
   native code.

3. **Payload cache versus substrate.** The introduction explicitly says the
   repository is not the mechanism by itself. Registration validates identity
   and ownership, absence is represented explicitly, activation changes
   membership and order, and the patched lookup path lets native statistics
   code consume the state.

4. **Prior-art boundary.** The front matter explicitly acknowledges workload
   statistics selection (MNSA), what-if design and tuning (AutoAdmin/DTA),
   hypothetical objects (HypoPG), statistics advisors/views (StatAdvisor and
   DB2), pending/imported statistics (Oracle), restore/statistics lifecycle
   support (PostgreSQL 19), offline/test-server tuning, and advisor
   lifecycles. These are framed as surrounding design points, not claims of
   novelty.

5. **Native CE authority.** The abstract and introduction state that
   PostgreSQL performs applicability, precedence, consumption, deserialization,
   MCV/FD composition, and numerical cardinality estimation through native
   `EXPLAIN`; the advisor supplies hypothetical state rather than emulating CE
   rules.

6. **Product search scope.** The introduction identifies the release-qualified
   product search as deterministic contextual ADD-only search under a fixed
   maintenance constraint, with exact q-error and conservative reuse. It
   expressly disclaims ADD/DROP/SWAP novelty and global-optimum claims.

7. **Capture versus derived repository.** The introduction says production
   PostgreSQL remains stock and read-only capture exports the persisted sample,
   workload truth, schema, and compatibility metadata, but not native payload
   bytes; the private advisor reconstructs the frozen repository.

8. **Speedup claim.** No speedup claim is made. The text promises operation
   counts and query-level reuse and explicitly says that a physical-per-design
   speedup has not been measured.

9. **Overclaim audit.** The title, abstract, and introduction do not claim
   firstness, uniqueness, a universal method, a global optimum, a new CE, a
   new search algorithm, or universal maintenance costs.

10. **Residual legacy text.** Section 6 and later sections retain the
    historical CE-Replay material from the frozen manuscript and are outside
    this narrowly scoped rewrite. The new front matter identifies CE-Replay as
    historical context rather than the current runtime mechanism; a later
    section-level rewrite is required before treating the whole manuscript as
    fully Strategy-B consistent.

