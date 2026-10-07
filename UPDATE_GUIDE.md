# Safe Update Guide

This project is designed so future features can be added without starting over.

## What stays safe
- Student data stored in Supabase is separate from the application HTML.
- `portal_config.js` contains deployment configuration and should be backed up before replacing files.
- Database changes are versioned in `updates/migrations/`.

## When a new feature is added
1. Create a new application version (example: 1.1.0).
2. Add a migration only if new database tables/columns/indexes are required.
3. Test the migration on a copy/test project first.
4. Export/backup current data before production update.
5. Replace the application files with the new release.
6. Keep the same Supabase project URL/key configuration.
7. Run the new migration, if required.
8. Test Admin Login, Student Search, Hall Ticket, QR, Result, Fees, Bus Fee and Reports.
9. Update `VERSION.json` and `CHANGELOG.md`.

## Important
Do NOT delete or recreate the Supabase project when updating the application. Application updates and database data are separate.

## Rollback
Keep the previous release ZIP. If a new UI build has a problem, restore the previous application files while keeping the database unchanged. Database migrations should be backward-compatible whenever practical.
