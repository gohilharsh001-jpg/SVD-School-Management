# SVD School Management — Audit Report v1.7.1

## Scope reviewed
- `index.html` (main application, menus and inline JavaScript)
- `student_portal.html`, `portal_config.js`, `supabase_schema.sql`, `verify.html`
- `updates/` metadata and release checklist

## Fixes made
1. Corrected 50-mark passing threshold from 17 to 18 in result status and result print; result analysis also uses the expected 18 threshold for Standards 9 and 11.
2. Attendance now requires an explicit status for every visible student before saving. Counters are scoped to the filtered list, and default date uses local calendar date.
3. Student document file MIME types are validated and downloads reject unexpected data URL schemes. Added a database-size guard before accepting a file that could push browser storage toward common quota limits.
4. Backup export uses a dated filename and delayed object URL cleanup.
5. Expanded Customize / Settings navigation labels for major menus that previously could not be customized.
6. Updated version metadata and changelog. No Supabase schema migration or production data deletion was added.

## Static validation results
- `node --check` on the main inline JavaScript: passed.
- Duplicate HTML IDs: none found.
- Static `getElementById` references: no unresolved IDs found (dynamic IDs intentionally excluded).
- Navigation mapping reviewed. `marksentry` and `resultprint` intentionally route to the shared Results section and isolate the relevant panels.

## Important limits
- Browser-driven end-to-end testing could not run in this environment because browser navigation was blocked by the execution environment.
- Supabase sign-in, upload/download, auto-sync, multi-device data consistency, printing, WhatsApp and file restore have not been live-tested against the school's real project.
- The app's working database is browser local storage unless the user configures and uses Online Sync. Do not assume that a local backup restore changes Supabase.
- Before publishing: download a JSON backup, test this ZIP in a separate copy/browser, test all major menus with dummy records, verify Supabase sync in both directions, and test A4 prints in Chrome. Keep the previous release for rollback.
