# Hall Ticket System — Online Free Setup

આ package તમારી હાલની Hall Ticket + QR + Result + Student Database + Fee + Bus Fee + Reports + Hall Ticket Receipt systemને તમારા Supabase `SVD` project સાથે જોડવા માટે તૈયાર છે.

## 1) Supabase — already completed
તમારા projectનું URL:
`https://cfxwvwcjqbahidgpkcwp.supabase.co`

Database schema અને Admin Auth user તમે પહેલેથી બનાવી ચૂક્યા છો.

## 2) Publishable Key
Supabase → Settings → API Keys → **Publishable key**માંથી `sb_publishable_...` key લો.

⚠️ **Secret / service-role key ક્યારેય HTML, mobile app અથવા chatમાં ન મૂકો.**

## 3) Admin system connect
`Hall_Ticket_System_Free.html` ખોલો → Admin Login → **☁️ Online Sync**.

Project URL પહેલેથી ભરેલું છે.

અહીં ભરો:
- Supabase Publishable Key
- School Key: `main-school`
- Admin Email
- Admin Password

પછી **Connect / Login** દબાવો.

Connect થયા પછી dashboard પર **Cloud: Connected** દેખાશે.
પ્રથમ sync માટે:
1. Cloudમાં પહેલેથી data હોય તો **Download Cloud Data** પસંદ કરો.
2. Cloudમાં data ન હોય અને આ browserનું data સાચવવું હોય તો **Upload Current Data** પસંદ કરો.
3. પ્રથમ successful Upload/Download પછી જ **Auto-sync ON** થશે. આથી પ્રથમ login વખતે cloud data અજાણતાં overwrite નહીં થાય.

> પ્રથમ વખત Upload કરતાં પહેલાં backup download કરી રાખવો સારું છે.

## 4) બીજા PC / Mobile
એ જ HTML/app ખોલો:
- Publishable Key નાખો
- Admin email/passwordથી login કરો
- **Download Cloud Data** કરો

ત્યારબાદ same Supabase cloud data બધા devices પર વાપરી શકાય છે.

## 5) Public Student Portal
`student_portal.html` અને `portal_config.js`ને static hosting પર publish કરી શકાય છે.

`portal_config.js`માં Project URL પહેલેથી ભરેલું છે. Publishable Key નાખવાની રહેશે.

Student CTS IDથી portal-safe Hall Ticket અને Result જોઈ શકશે.

## 6) QR Code
Admin → Online Syncમાં published Student Portal URL save કરો.
પછી Hall Ticket QR scan કરીને online student portal ખોલી શકાય છે.

## 7) Future Updates
આ project versioned અને migration-ready છે:
- `VERSION.json`
- `CHANGELOG.md`
- `UPDATE_GUIDE.md`
- `updates/migrations/`

નવું feature ઉમેરતી વખતે database migration અલગથી રાખી શકાય છે, જેથી existing student data preserve રહે.

## 8) Backup
કોઈ મોટો update કરતા પહેલાં Admin → Backup / Import → **Download Backup** કરો.

## 9) Security
- Browser/mobileમાં **Publishable Key** વાપરો.
- Secret/service-role key ક્યારેય client-side codeમાં ન મૂકો.
- Database RLS policies ચાલુ રાખો.
- CTS ID public portalમાં માત્ર portal-safe data lookup માટે વપરાય છે.
