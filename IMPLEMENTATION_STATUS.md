# Mama Bus Koi implementation status

Status values: `DONE`, `IN PROGRESS`, `BLOCKED BY EXTERNAL CONFIGURATION`.

## Foundation

| Feature | Status |
| --- | --- |
| Clean feature-first architecture | DONE |
| BLoC/Cubit state management | DONE |
| Drift offline database and migrations | DONE |
| Firebase initialization | DONE |
| Multi-institution scoping | DONE |
| Email/password authentication | DONE |
| Google authentication code | DONE |
| Google provider/SHA configuration | BLOCKED BY EXTERNAL CONFIGURATION |
| Institution selection and role routing | DONE |

## Admin and static data

| Feature | Status |
| --- | --- |
| Bus CRUD without route assignment | DONE |
| Route CRUD and ordered stops | DONE |
| Manual route drawing | DONE |
| GPS route recording | DONE |
| Schedule CRUD | DONE |
| Live bus monitor | DONE |

## Tracking

| Feature | Status |
| --- | --- |
| Geometry and route progress engine | DONE |
| Route matching and ambiguity handling | DONE |
| Direction, stop, ETA, and status engines | DONE |
| Source lease election and failover | DONE |
| Contributor presence | DONE |
| Android foreground location service | DONE |
| Active trip lifecycle | DONE |
| Debug GPS simulator | DONE |
| Multi-phone Firebase test | BLOCKED BY EXTERNAL CONFIGURATION |

## User features

| Feature | Status |
| --- | --- |
| Bus list/search/free status | DONE |
| Routes and schedules offline | DONE |
| Favorites and local notifications | DONE |
| Wallet and test-token ledger | DONE |
| Non-renewing 24-hour premium pass | DONE |
| Premium exact selected-bus stream | DONE |
| Referral claim/manual approval | DONE |
| Real-money purchase screen | DONE |
| Real-money payment provider | BLOCKED BY EXTERNAL CONFIGURATION |

## Security and delivery

| Feature | Status |
| --- | --- |
| Firestore Security Rules | DONE |
| Realtime Database Security Rules | DONE |
| Firebase rules deployment | BLOCKED BY EXTERNAL CONFIGURATION |
| Complete README | DONE |
| Unit/widget tests | DONE |
| Android debug build | DONE |
