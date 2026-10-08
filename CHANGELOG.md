# Changelog

## v1.3.9 — 2026-10-08
- Fixed Fee Receipt printing: only the receipt prints.
- Fixed Bus Fee Receipt printing: only the receipt prints.
- Fixed Result / Marksheet printing: only result sheets print, not the form.
- Fixed Print All Results and Test Report print isolation.
- Added manual field selection for Student Bulk Entry / Excel paste.
- Added selected-column template generation for bulk import.
- Saved bulk field selection in Customize / Settings.
- Preserved 10-digit mobile and 18-digit CTS validation.
- Improved receipt selection to print the last saved entry correctly.
- Removed stale Admission No. search reference.

# v1.3.8 — School Management Update

- Added separate exam/test schedule support for Standards 9, 10, 11 and 12.
- Added Test / Exam Type (Exam, Unit Test, Test Paper, Periodic Test, Other).
- Hall Ticket schedule and QR schedule are filtered by student Standard + Division.
- Student Mobile accepts exactly 10 digits.
- Parent Mobile accepts exactly 10 digits.
- CTS ID accepts exactly 18 digits.
- Removed Admission No. from Student Entry, Database, Excel import/export and migrated old local records.
- Added Delete action in Student Database for accidental/wrong student records.
- Added manual Student Entry field show/hide controls.
- Added standard/subject-wise marks entry, printable marksheet/result and standard/subject-wise Test Report.
- Added Principal Signature upload in School Settings; uploaded signature automatically appears on Hall Ticket and Result.
- Existing QR all-student uniqueness fix is preserved.

# v1.3.7

- Fixed QR generation for all students when student IDs are missing or duplicated.
- Each Hall Ticket QR now uses a unique render key.
- Preserves student-specific QR data for Print All and individual Hall Tickets.

# v1.3.6 - QR Verification Fix
- Fixed verification page treating the normal Division parameter `d` as legacy Base64 data.
- Current QR links now open correctly for divisions such as A/B/C.

## v1.3.5 — QR verification URL fix
- QR now opens the public verification page with readable student data.
- Increased QR render size for easier mobile scanning.
- Verification page supports the new QR format and the legacy `d` format.

## v1.3.5 — QR direct-data reliability fix
- Hall Ticket QR now encodes compact plain-text student and exam schedule data directly.
- Removed the long base64 verification URL from the QR payload to improve phone-camera scanning reliability.
- Increased QR render size for current and bulk hall tickets.
- Existing Admin Login, sidebar scrolling, Supabase/Auth, Student, Result, Fee, Bus Fee and Reports features are preserved.

## v1.3.3 — Supabase Auth Recovery Session Fix
- Password recovery Update Password now waits for Supabase recovery/sign-in session events before calling updateUser.
- Added recovery-token fallback when the session is not immediately available.
- Preserved existing login, sidebar, QR, cloud sync and database features.

## v1.3.2 — Supabase Auth Recovery Flow Fix
- Recovery links now reliably establish the Supabase recovery session before updating the password.
- Admin Login is bypassed while a password-recovery link is active, so the recovery form is not blocked by the local login overlay.
- Supports Supabase implicit recovery links containing access/refresh tokens.
- Requires an 8-character minimum for new Supabase Auth passwords.
- Existing local data, QR, Hall Ticket, Result, Fee, Bus Fee, Reports and Cloud Sync features remain unchanged.


## v1.2.8 — QR display fix
- Fixed Hall Ticket QR rendering when the QR JavaScript CDN is unavailable.
- QR is now rendered as an image from a QR generation endpoint.
- QR continues to point to the cloud-free `verify.html` verification page and does not require Supabase.
- Existing student, hall ticket, result, fee, bus fee, reports, and online-sync features are preserved.

# v1.2.7
- Fixed Hall Ticket QR display by using a direct QR image endpoint; no QR JavaScript library is required.
- QR continues to encode the cloud-free verification URL and student hall-ticket data.

# v1.2.6
- Fixed Hall Ticket QR Code display by using a direct QR image generator URL; QR now renders even when the JavaScript QR library fails to load.
- QR content remains the cloud-free verification URL/data.

## v1.2.5
- Fixed Hall Ticket QR scanning: QR now opens a direct cloud-free verification page with embedded student and exam details.
- QR verification does not depend on Supabase availability.
- Existing Supabase portal QR behavior is replaced by the reliable static verification flow.

## v1.2.4
- Password reset button now has a direct click fallback and visible success/error alert.

## v1.2.3
- Fixed Supabase password-recovery links that arrive with `access_token` in the URL hash but no `type=recovery`.
- Recovery modal now opens for both recovery event/hash formats.

# v1.2.2
- Fixed Supabase password-recovery session handling and Update Password button flow.

# Changelog

## v1.2.1 — Supabase Auth Password Reset
- Added Forgot / Reset Password button to Online Sync.
- Sends Supabase Auth password-reset email to the Admin Email.
- Added in-app recovery screen to set a new Supabase Auth password after opening the Gmail reset link.
- Existing local data, cloud sync, and database schema remain unchanged.


## v1.2.0 — Supabase Cloud Sync Reliability Update
- Dashboard now shows live Cloud connection status.
- Existing Supabase Auth session is restored when the app starts.
- First connection no longer enables auto-sync automatically.
- Auto-sync starts only after a successful explicit Upload or Download.
- Cloud Upload/Download status now clearly reports the sync state.
- Existing schema version remains `1`; no database migration is required.


## v1.0.0 — ONLINE_FREE_READY
- Online-ready architecture for Supabase Free.
- Existing Hall Ticket, QR, Student Database, Result, Fee, Bus Fee, Reports and Hall Ticket Receipt features retained.
- Student Portal included.
- Versioned update structure added.

## Future releases
Every future feature must:
1. Increase the application version.
2. Add a migration file when the database schema changes.
3. Add a changelog entry.
4. Keep backward compatibility with existing student data where possible.
5. Test import/export, login, Hall Ticket, Result, Fee, Bus Fee and Reports before release.


## v1.1.0 — Online Connected Ready
- Preconfigured SVD Supabase project URL.
- Publishable key remains user-entered; secret/service-role key is never embedded.
- Updated Online Sync labels and setup instructions.
- Preserved versioning and migration structure for future feature updates.


## v1.1.1 — Admin Login First-time Setup Fix
- Added a close button to the Admin Login popup.
- Added First-time Setup shortcut to Customize / Settings.
- Setup shortcut works only while the default password remains `1234`; after changing it, login is required.


## v1.1.2 — Admin Login Close Button Fix
- Added a visible X button in the top-right of the Admin Login popup.
- Added a Close button next to Login.
- Close hides the login overlay so Settings can be reached during first-time setup.
