# v1.2.9 - QR + Sidebar + Login Security

- Fixed left sidebar vertical scrolling on desktop and mobile.
- Fixed Admin Login Close buttons so closing cannot grant system access.
- Added locked-mode protection until successful admin login.
- Preserved QR verification page architecture.

# Changelog

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
