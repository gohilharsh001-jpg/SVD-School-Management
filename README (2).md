# Versioned Updates

Put every future database change in this folder as a numbered migration:

`001_feature_name.sql`
`002_next_feature.sql`

Never edit an already-applied migration. Add a new migration instead.

Recommended release pattern:
- Patch: 1.0.1 — bug fixes, no schema change.
- Minor: 1.1.0 — new feature, backward-compatible.
- Major: 2.0.0 — breaking architecture/data change (avoid unless necessary).
