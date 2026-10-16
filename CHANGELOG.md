## v1.7.6 — 2026-10-16
- Added Standard-wise Bulk Result Print in Result View / Print.
- Added Standard, Stream (required for Std 11/12), and Division filters.
- Shows the number of matching students before printing and sorts results by division, roll number, and name.
- Keeps the existing stream-specific subject filtering and Hind Vadodara result font styling.
- No Supabase schema or production data changes.

## v1.7.3 — Result Header Typography and Order (2026-10-16)
- Moved the school address directly below the school name in Result View / Print.
- Moved the exam name / RESULT title below the address.
- Applied Hind Vadodara font to the school name, address and exam title, with Gujarati-friendly system fallbacks. Google Fonts is used when internet is available.
- Kept the existing student details, marks table, result status, signature area, and Supabase data structure unchanged.
- Static checks only; browser print preview and printer output should be verified before live deployment.

# Changelog

## v1.7.1 — Audit and reliability fixes (2026-10-16)
- Corrected the passing threshold for 50-mark subjects from 17 to 18 in result status and result print.
- Improved attendance safety: status is no longer silently preselected as Present, saving is blocked until every visible student has a valid status, and daily counters respect the currently filtered student list.
- Attendance default date now uses the browser's local calendar date rather than UTC conversion.
- Student document downloads now accept only recognized PDF/JPEG/PNG/WebP data URLs; file MIME type is checked and a storage-size guard warns before large files risk browser storage limits.
- Backup filename now includes the local date and object-URL cleanup is delayed to avoid interrupting the download.
- Expanded Customize / Settings to edit labels for all major navigation menus, including Rooms, Student Portal, Marks Entry, Result Print, Student Reports, Fees, Bus Fees, Hall Ticket Receipt and Online Sync.
- No Supabase schema changes, database resets, or Android app work.
- Validation: JavaScript syntax check passed; duplicate HTML IDs not found; static menu/section mapping reviewed. Live browser interaction and real Supabase sync could not be completed in this environment and remain required before publishing.

## v1.7.0 — School Management Features (2026-10-16)
- Added Advanced Result Analysis: standard/stream/division filtering, subject-wise marks, total, percentage, PASS/FAIL/INCOMPLETE counts, print and CSV export.
- Added Student Attendance: date/standard/division filters, present/absent/late/leave marking, remarks, summary and print register.
- Added Student Documents: attach PDF/JPG/PNG/WebP files to a student, filter/search, download, delete and export document list CSV (file size limit 800 KB).
- Backup restore now validates the basic JSON structure, asks for confirmation before replacing local data, normalizes newer arrays, and clarifies that local restore does not modify Supabase until an explicit upload.
- Existing Fee Collection, Bus Fee, Exam Schedule, Student Reports, Result/WhatsApp workflow and Customize/Settings are retained.
- New attendance/document records are stored in the existing app database object and therefore included in JSON backups and existing Supabase school_state sync. No Supabase schema migration was added.
- Android app remains pending.

## v1.6.4 — Bulk WhatsApp Result to Parent Mobile
- Added a bulk WhatsApp panel to Result View / Print.
- Filter students by Standard and (for Std 11/12) Arts/Commerce Stream.
- Select individual students or all students; validates Parent Mobile numbers before queue creation.
- Each WhatsApp message contains that student’s result details as text and opens one chat at a time. Final Send remains a manual action in WhatsApp.
- Single-student WhatsApp Result now uses Parent Mobile only.
- No database reset or schema change.

## v1.6.3
- Result View / Print now filters students by selected standard.
- Added student search by CTS ID, seat number, roll number, GR number, or name.

## v1.6.2 — Separate Marks Entry and Result Print menus
- Added separate sidebar menus for Marks Entry and Result View / Print.
- Marks Entry menu shows only marks entry and subject management panels.
- Result View / Print menu shows only student result selection, preview and print panels.
- Passing marks set to 18 for Standards 9 and 11; Standards 10 and 12 remain 33.

# v1.6.1 — Stream-wise Economics Subjects (2026-10-16)
- Added અર્થશાસ્ત્ર to Std 11 Arts, Std 11 Commerce, Std 12 Arts and Std 12 Commerce subject lists.
- Updated the Commerce subject label to the wording supplied by the user: નામાનાં મુળતત્વો.
- No database reset or schema change. Existing saved subjects and marks are preserved.

# v1.3.0 — Menu isolation and page layout fix
- All `section[id^="page-"]` pages are now controlled by navigation, including sections outside `<main>`.
- Responsive layout applied to top-level legacy page sections.
- No database reset or schema change.

# v1.3.18
- QR now encodes a compact base64url JSON payload to reduce QR pattern density without changing the displayed QR size.
- Verification page decodes the compact payload and retains support for existing QR URL formats.

## v1.3.17 - QR Data and Clarity Fix
- Use QR URL parameters that are compatible with verify.html.
- Increase QR size for sharper scan and print output.
- Carry school, student and schedule fields to the full verification view.

# Changelog

## v1.3.14 — QR Code Data + Print Fix (2026-10-09)
- Generate hall-ticket QR codes in the browser using QRCode.js instead of sending student details to a third-party QR image API.
- Encode a compact UTF-8 JSON payload in the verification URL so Gujarati and other Unicode student names remain intact.
- Freeze generated QR canvases as data images so they render more reliably in print preview.
- Keep the existing verification page compatible with the `?v=` payload format.

# v1.3.12

- QR compatibility fix: QR now uses direct URL parameters compatible with the deployed verify.html.
- No Base64/atob dependency.
- Preserves unique student QR data and seat/schedule information.


## v1.3.10 — Hall Ticket Seat & Supervisor Sign Fix
- Hall Ticket now shows **Seat No.** in the position previously used for Roll No.
- Removed **Room** and **Seat** columns from the Hall Ticket exam schedule.
- Added **Supervisor Sign** column for every subject, with a signature line on each row.
- Seat No. is pulled from the student’s exam allocation when available.
- Preserved all v1.3.9 print-isolation and manual Bulk Entry fixes.
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


## v1.3.11
- Reworked Hall Ticket QR to use compact UTF-8 base64url payload.
- QR now reliably carries student identity, seat number and exam schedule without long query strings.
- Verification page decodes UTF-8 payload safely.
- No Supabase dependency for QR verification.


## 1.3.13 — 2026-10-09 — Cloud Safety + Clean Start
- Removed sample student and exam records from fresh installations; retained school identity defaults.
- Added a Clear Testing Data action that preserves school settings/customization and does not silently change Cloud data.
- Fixed duplicate password-reset email requests caused by both inline and event-listener click handlers.
- Added a helpful email-rate-limit message and stopped repeated alerting for that provider limit.
- Added Cloud overwrite confirmation for manual uploads, friendlier empty-cloud handling, and safer local/cloud sync behavior.
- Added explicit authenticated table grants while keeping owner-based Row Level Security policies.
\n\n## Hall Ticket list-first layout (2026-10-12)\n- Added student roster above generated hall ticket(s) on the Hall Ticket page.\n- Print order: roster first, then hall ticket(s) on following page(s).\n- Enabled QR visibility in hall ticket print CSS.\n\n\n## Hall Ticket print isolation fix (2026-10-12)\n- Print mode now hides all app content except the Hall Ticket student roster and ticket area.\n- Added a compact student roster before hall tickets, matching requested order.\n- Each hall ticket starts on a new page.\n

## Hall Ticket only + QR print fix (2026-10-12)
- Print mode hides all application pages and the student list; only the Hall Ticket template is visible.
- QR code container/canvas/image is explicitly visible in print mode.
- A4 portrait print page with margins and one ticket per page.


## Final Hall Ticket-only print isolation (2026-10-12)
- Uses display:none for every sibling page to prevent blank/layout pages from being printed.
- Keeps only the Hall Ticket section and QR code visible in print preview.


## Hall Ticket A4 one-page print repair (2026-10-12)
- Isolates print output to the Hall Ticket section only.
- Constrains QR code to approximately 29 mm square so the ticket fits one A4 page.
- Reduces print-only spacing and typography while preserving the on-screen preview.


## Hall Ticket student selector and class print (2026-10-12)
- Added Standard, Division, and Student Name dropdowns.
- Print Selected prints only the selected student ticket; Print Class prints all tickets for selected standard/division.
- Print isolation hides all other menus and dashboard data. QR and student photo are retained with compact A4 print styling.


## Hall Ticket menu-only print fix (2026-10-12)
- Fixed a print-mode class mismatch: Hall Ticket printing now activates the A4 `print-hallticket` CSS rules as well as the existing ticket-only rules.
- Print waits for ticket images to finish loading before opening the print dialog.


## Sidebar hover + page navigation fix (2026-10-12)
- Sidebar is collapsed to a narrow icon strip and expands on hover/focus.
- Main content uses the reduced sidebar width while collapsed.
- Menu navigation hides all page sections globally and reveals only the selected page, preventing Hall Ticket or other prior-page content from remaining visible.
- Resets page scroll when switching menus.


## v1.3.1 — Full audit layout fix
- Normalize all `page-*` sections into the main content container.
- Strengthen page isolation and active menu state handling.
- Add responsive width and horizontal table overflow safeguards.


## v1.3.2 — Hall Ticket QR details
- QR payload v4 now includes student identity, standard/division, parent/guardian, DOB, gender and parent mobile.
- Verification page supports both legacy v3 and new v4 QR payloads.
- QR rendering default size increased and error correction upgraded to M.
- Verification page labels contact number as Parent Mobile.


## v1.3.3 — QR and student list view fixes
- Keep QR payload v3-compatible with the currently deployed GitHub Pages verifier; embed Parent Mobile in the verifier's existing mobile field.
- Increase QR render size and keep QR visible in Hall Ticket print output.
- Student Entry list now waits for a search or standard/division filter before showing records.
- Student Database list now waits for search/filter input while retaining dashboard totals.


## v1.3.4 — Final QR compatibility fix
- QR now encodes student basics as URL query parameters instead of relying only on a version-specific base64 token.
- Verification page safely supports direct-query QR data and legacy v3/v4 token QR codes.
- Parent/Guardian, Parent Mobile, DOB, gender, school details and seat number are supported.
- URL token decoding failures no longer stop direct-query student details from rendering.
- QR URL excludes optional long address/footer fields to reduce QR density and improve scanning reliability.


## v1.3.5 — Hall Ticket print layout
- Set Hall Ticket printing to A4 landscape so the ticket uses the printable page area instead of occupying only the upper part of portrait paper.
- Improved printed heading, tables, photo, QR size and footer placement.
- Hall Ticket contact row now displays Parent Mobile from `parentMobile`, falling back to the legacy `mobile` field.


## v1.3.6 — A4 portrait full-page print fit
- Match the portrait print orientation shown in the provided PDF.
- Increase ticket height to fill the printable A4 page and enlarge schedule/table spacing.
- Keep QR visible and anchor footer/signature boxes near the bottom of the ticket.


## v1.3.7 — Standalone student-details QR
- QR now embeds student details directly as readable text instead of relying on a GitHub Pages verification URL.
- Scanning the QR can show name, standard/division, roll, GR, CTS ID, seat number, parent/guardian, parent mobile, school and exam without depending on deployed verify.html.
- Increased QR generation default size and error correction level.


## v1.3.8 — Offline QR generator
- Bundle a local QR matrix generator so Hall Ticket QR creation works when the external QRCode.js CDN is blocked or unavailable.
- QR rendering now falls back to a local canvas-based generator and does not show the misleading CDN-load error when the offline engine is present.


## v1.3.9 — Compact QR payload
- QR now carries only school name, exam name, student name, standard, CTS ID and seat number.
- Removed extra QR payload fields to reduce QR density and avoid QR generation capacity errors.


## v1.4.0 — Duplicate QR display fix
- Removed the CDN QR rendering path from Hall Ticket display; it could expose both the generated image and canvas.
- Use the bundled offline QR engine only and render exactly one canvas per QR container.
- Clear existing QR nodes before rendering and set a predictable 150px display size.


## v1.4.1 — QR data direct fix
- QR payload is now compact JSON with exactly six fields: School, Exam, Student Name, Standard, CTS ID and Seat Number.
- Removed dependency on GitHub Pages / verify.html for reading student data; any QR scanner can display the embedded text directly.


## v1.4.2 — QR print and A4 layout final fix
- Fixed print CSS that hid the offline QR canvas (`display:none`) so the generated QR is visible in print/PDF.
- Forced Hall Ticket student details and Exam Schedule tables to full printable width.
- Standardized A4 portrait ticket height and positioned footer/signature near the page bottom.
- Preserved compact six-field JSON QR payload from v1.4.1.


## v1.4.3 — QR details + PDF option
- QR now opens the hosted verify.html page with a compact encoded payload containing School Name, Exam Name, Student Name, Standard, CTS ID and Seat Number.
- Verification page decodes the new `data` token and displays the six requested fields.
- Added a Download Hall Ticket PDF action that opens the browser print dialog; choose “Save as PDF” to save a PDF copy. Added print-friendly styling that hides buttons in the saved PDF.
- Existing legacy QR payload formats remain supported.


## v1.4.4 — QR scan reliability
- Replaced the base64 `data` token QR URL with short standard query parameters (`school`, `e`, `n`, `s`, `c`, `seat`) that the verification page already supports.
- Increased on-screen QR generation size for easier phone scanning.
- Render QR canvas at its native integer-module pixel size to avoid browser interpolation blur; print QR remains 35mm.
- Verified a representative generated QR can be decoded back to the exact verification URL.


## v1.4.5 — QR verification page polish
- Preserved the working QR URL parameter format from v1.4.4.
- Improved the mobile verification screen to match the provided screenshot, with a cleaner school heading, exam title, responsive detail cards, and empty fields hidden.
- Added clear Download / Print Hall Ticket and Print Details Only actions. PDF saving uses the browser print dialog and its Save as PDF option.
- Kept support for existing QR token formats.


## v1.4.6 — QR verification Principal label cleanup
- Removed the default Principal fallback from legacy QR query parsing.
- QR verification result intentionally displays student details only; Principal/signature metadata is not rendered, avoiding duplicate “Principal Principal” text.


## v1.4.7 — Match print to on-screen view
- Updated only print layout CSS so Hall Ticket is centered on A4 and tables use the ticket width, matching the on-screen layout.
- Preserved QR generator, payload, render function, and verification behavior unchanged.


## v1.4.8 — QR removed from Hall Ticket
- Removed the QR block and SCAN TO VERIFY label from the Hall Ticket view and print output.
- Kept the rest of the Hall Ticket layout and print-fit CSS unchanged.


## v1.4.9 — Final A4 print layout and QR removal
- Forced the Hall Ticket print container and student/schedule tables to use the full A4 printable width.
- Set A4 portrait margins and consistent sizing for student information, photo, schedule, footer, and principal signature.
- Added a high-priority hide rule for QR blocks so old cached markup cannot show a QR on the ticket.
- QR generation/verification code is not changed; only QR display on the Hall Ticket is hidden.


## v1.5.0 — Final A4 print layout fix
- Added a final high-priority print stylesheet to force Hall Ticket details and exam schedule to use the full ticket width on A4 portrait.
- Fixed student information/photo grid and footer/signature layout in print preview.
- QR is hidden from print and QR rendering is disabled for the Hall Ticket screen/print; QR verification URL/payload functions and verification page were not modified.


## v1.5.1 — Match reference PDF print layout
- Changed Hall Ticket print to A4 landscape, with a full-width bordered ticket matching the uploaded reference PDF.
- Expanded student details and exam schedule tables to the available page width; retained photo, notice and principal signature blocks.
- Kept QR hidden/removed from Hall Ticket output.


## v1.5.2 — A4 Portrait Fit
- Changed Hall Ticket print from landscape to portrait A4.
- Reduced print spacing and adjusted photo, student table, schedule and footer blocks to fit the portrait page.
- Kept QR hidden from Hall Ticket output.


## v1.5.3 — Standard-wise Result / Marks Update (2026-10-14)
- Result / Marks subject list filters to the selected standard; only matching standard subjects appear.
- Standards 9 and 11 use a 50-mark maximum per subject; Standards 10 and 12 use a 100-mark maximum.
- Marks inputs are limited to the applicable maximum and pass marks default to 17/50 or 33/100.
- Subject name can be edited from Result / Marks for Standards 11 and 12 and is saved with the existing exam record.
- Result Preview / Print omits subject exam dates and shows Subject, Out Of, Marks Obtained, and Remarks.
- No database reset, schema migration, or student-record deletion performed.


## v1.5.4 — 2026-10-14
- Improved Result / Marks print layout for A4 Portrait paper.
- Added student photo to result preview and print, using the photo saved in the student record.
- Moved teacher/principal signature area toward the bottom of the marksheet.
- Kept existing modules and data storage behavior unchanged.


## v1.5.5 — 2026-10-14
- Fixed Result / Marks table width so it fills the A4 printable area rather than leaving unused space on the right.
- Applied Hind Vadodara font to the Result sheet for Gujarati text.
- Translated result table headers and student detail labels into Gujarati.
- Improved student details grid and print spacing.


## v1.5.6 — 2026-10-14
- Applied stronger print-only width rules to make the result marks table fill the full printable A4 content width.
- Prevented parent layout sizing or transforms from shrinking the result during print.


## v1.5.9 — 2026-10-16
- Added standard-wise Add / Edit / Remove Subject controls for Standards 9, 10, 11 and 12.
- Marks Entry now filters students strictly to the selected Standard and the selected subject's Standard, preventing Std 9 and Std 10 lists from mixing.
- Standard 11 and 12 can have subjects added directly even if no matching Exam Schedule subject existed before.
- No student records or existing marks were intentionally deleted.

## v1.6.5
- Fixed Hall Ticket timetable showing unrelated/blank subjects from other standards: only matching-standard entries with date and time are shown, with division and stream filtering retained.


## v1.6.6
- Fixed Result Print isolation: print only the selected result sheet; hide dashboard, student list, menus, and other app content so they do not appear on page 2+.


## v1.7.2 — Professional Result Color Theme (2026-10-16)
- Added a polished navy, teal, and gold result-sheet theme for Result View / Print preview.
- Styled school heading, student details, photo frame, subject table, total row, percentage/status, and signature area.
- Added print-color adjustment rules so supported browsers retain the intended colors on color printers.
- Kept the existing A4 portrait sizing and result-print isolation rules.
- Note: Browser print dialog must have Background graphics enabled for the most accurate color output.


## v1.7.4 — Hind Vadodara for all Result View/Print text
- Bundled the supplied Hind Vadodara Light, Regular, Medium, SemiBold, and Bold font files locally.
- Applied Hind Vadodara to all descendants of the Result View/Print sheet, including labels, student details, marks table, totals, grade/status, and signature captions.
- Kept existing website features and Supabase schema unchanged; no database migration added.


## v1.7.5 — Stream-specific result subjects
- Fixed Result View/Print so Std 11 and 12 students see only subjects assigned to their own stream (Arts or Commerce).
- Result totals, percentage, PASS/FAIL and rank calculations now use that same stream-specific subject list.
- No Supabase schema or existing student/marks data was changed.
