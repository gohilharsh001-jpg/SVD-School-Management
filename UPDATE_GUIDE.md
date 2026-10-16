
## v1.3.8
Upload/replace the package files in the GitHub Pages repository. Test locally first, especially Student Entry validation, Standard-wise schedules, marks entry, WhatsApp result link, and Principal Signature upload.
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


## v1.4.3 QR Details and PDF Save
1. Upload both `index.html` and `verify.html` from this ZIP to the same GitHub Pages repository and commit the changes.
2. QR scanning opens `verify.html` and displays the six embedded student fields.
3. To save a PDF, tap `Download Hall Ticket PDF`, then in the browser print dialog choose `Save as PDF` and Save.


## v1.4.5 — Verification page layout
Upload both `index.html` and `verify.html` from this version to GitHub Pages. The QR data format is unchanged. Scan a newly generated QR; use Download / Print Hall Ticket, then choose Save as PDF in the print dialog.


## v1.5.4 Result / Marks A4 Print Update
1. Replace the project files with this complete version in your test copy first.
2. Open Result / Marks and select a student to preview the result.
3. Confirm the student photo appears if a photo is saved in that student's record.
4. Print using paper size A4, Portrait, Scale 100% (or Default), and browser headers/footers disabled.
5. Check one result and then Print All on a small test group before using it for all students.


## v1.5.5 Result A4 / Gujarati Layout
- Result table is forced to full printable width.
- Result sheet uses the Hind Vadodara font from Google Fonts; an internet connection is needed for first font load.
- Result labels and table headings are in Gujarati.
- Test in Chrome print preview with A4, Portrait, scale Default/100%, and headers/footers disabled.


## v1.5.6 A4 Print Fit
- Test in Chrome Print Preview with A4 / Portrait / Scale 100% or Default.
- Turn off browser Headers and footers.
- If the preview still differs, send the newly generated PDF for exact diagnosis.
