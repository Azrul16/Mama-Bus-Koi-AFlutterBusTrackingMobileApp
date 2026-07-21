# Mama Bus Koi

Mama Bus Koi is an Android-first, multi-tenant transport SaaS for schools, colleges, universities, and other organizations. Each organization owns an isolated workspace while using the same crowdsourced tracking engine. Any authorized member can explicitly tap **“I'm in this bus”** and temporarily contribute GPS data.

The MVP is designed for Firebase's zero-billing tier. Real-money token purchasing is intentionally not implemented.

## Product invariants

- Bus and route are independent. `Bus` never contains a permanent `routeId`.
- Only an active trip temporarily connects a bus, detected route, direction, and GPS source.
- Every operational entity and realtime path is scoped by `organizationId`.
- Access is granted by an active organization membership, never by trusting a tenant ID from Flutter.
- A person may belong to multiple organizations; `currentOrganizationId` is only the selected workspace.
- Personal token wallets and organization SaaS subscriptions are separate models.
- Free status contains no latitude or longitude.
- Exact selected-bus coordinates are read only by premium users, contributors, or admins.
- GPS updates use Realtime Database; static data uses Firestore and is cached in Drift.
- Location sharing starts only after explicit confirmation and always shows an Android foreground notification.
- Premium lasts 24 hours, costs 10 tokens, and never auto-renews.

## Implemented MVP

- Email/password and Google Firebase authentication
- Native Android Google account chooser (no browser redirect flow)
- Required member profile: Google account full name, gender, and department
- Self-service organization creation, discovery/joining, memberships, and workspace selection
- `PLATFORM_ADMIN`, `ORGANIZATION_OWNER`, `ORGANIZATION_ADMIN`, and `USER` authorization
- Admin bus CRUD without route assignment
- Admin route drawing, foreground GPS recording, simplification, ordered stops, and route CRUD
- Admin schedule CRUD, live monitor, referral approval, and test-token grants
- User bus search, coarse live status, routes, schedules, wallet, ledger, favorites, and reminders
- MapLibre maps using OpenFreeMap
- Native Kotlin location foreground service that survives normal background use and screen lock
- Contributor presence, 60-second primary-source lease, 20-second renewal, and automatic failover
- Haversine geometry, projection, polyline distance/progress, and Douglas–Peucker simplification
- Multi-sample route matching, shared-road ambiguity, confirmation, and switching hysteresis
- Direction noise resistance, nearest/next stop, ETA, MOVING/STOPPED/ARRIVED/GPS_LOST states
- Automatic active-trip creation and trip-summary completion
- Free `bus_status` and premium `bus_live` separation
- Organization-isolated chat with Drift cache and two-hour message expiry
- Drift offline cache and migrations
- Debug-only GPS simulator
- Firestore and Realtime Database rule sources

See [IMPLEMENTATION_STATUS.md](IMPLEMENTATION_STATUS.md) for external configuration and field-test status.

## Stack

| Concern | Technology |
| --- | --- |
| App | Flutter / Dart |
| Architecture | Feature-first clean architecture |
| State | BLoC / Cubit |
| Navigation | go_router |
| Authentication | Firebase Authentication |
| Static cloud data | Cloud Firestore |
| Live state | Firebase Realtime Database |
| Offline data | Drift / SQLite |
| Map | MapLibre GL + OpenFreeMap |
| Foreground GPS | Native Kotlin + fused location provider |
| Notifications | flutter_local_notifications; FCM package prepared |
| Tests | Flutter Test and BLoC Test |

The profile department selector currently supports CSE, Agriculture, BBA,
Fisheries, LLA, ESDM, NFS, EEE, and Oceanography.

No Google Maps, Mapbox paid API, Cloud Storage, Cloud Functions, paid routing, paid location SDK, AI route detection, or required custom backend is used.

## Architecture

```text
Presentation → Domain ← Data
```

Widgets depend on BLoCs and repository contracts, never directly on Firebase or Drift.

```text
lib/
├── app/                         # composition, router, splash
├── core/
│   ├── config/                  # tracking thresholds
│   ├── database/                # Drift schema and generated code
│   ├── di/                      # dependency composition
│   ├── firebase/                # path helpers
│   ├── location/                # foreground service bridge
│   ├── map/                     # reusable OpenFreeMap widget
│   ├── notifications/
│   ├── permissions/
│   └── utils/                   # deterministic geometry
├── features/
│   ├── admin/
│   ├── auth/
│   ├── buses/
│   ├── favorites/
│   ├── institution/             # organization feature; legacy folder name
│   ├── referrals/
│   ├── routes/
│   ├── schedules/
│   ├── tracking/
│   └── wallet/
├── firebase_options.dart
└── main.dart
```

Each feature is split into `data`, `domain`, and `presentation` as needed.

## Firebase data

Firestore:

```text
users/{uid}
users/{uid}/favorites/{busId}
organizations/{organizationId}
organizations/{organizationId}/buses/{busId}
organizations/{organizationId}/routes/{routeId}
organizations/{organizationId}/schedules/{scheduleId}
organizations/{organizationId}/chat_messages/{messageId}
organization_memberships/{organizationId}_{uid}
organization_subscriptions/{organizationId}
referralClaims/{claimantUid}
```

Realtime Database:

```text
organization_memberships/{organizationId}/{uid}
bus_status/{organizationId}/{busId}
bus_live/{organizationId}/{busId}
contributors/{organizationId}/{busId}/{uid}
source_leases/{organizationId}/{busId}
active_trips/{organizationId}/{busId}
trip_history/{organizationId}/{tripId}
wallets/{uid}
token_transactions/{uid}/{transactionId}
```

`bus_status` is a lightweight free feed. `bus_live` is subscribed only while viewing one premium bus. The app does not store raw personal GPS history.

Chat messages contain an `expiresAt` timestamp exactly two hours after creation. The UI removes expired messages immediately and connected clients securely purge expired documents in batches. Managed Firestore TTL was not enabled because this project has billing disabled; enable TTL on the `chat_messages.expiresAt` collection-group field if the project later moves to a billing plan and must delete while no client is online.

## Prerequisites

- Flutter stable and Dart compatible with `^3.12.2`
- Android Studio, Android SDK 36+, and Java 21 (Android Studio's bundled JBR)
- Firebase CLI and FlutterFire CLI for configuration/deployment
- A Firebase project with Authentication, Firestore, and Realtime Database

```bash
flutter doctor
flutter pub get
dart run build_runner build
```

## Firebase setup

Create the ignored local environment file from the committed template, then
replace every placeholder with values from Firebase project settings:

```bash
cp .env.example .env
```

The `.env` file uses JSON syntax because Flutter reads it natively through
`--dart-define-from-file`. Run and build the app with:

```bash
flutter run --dart-define-from-file=.env
flutter build apk --release --dart-define-from-file=.env
```

The Android client also expects a local `android/app/google-services.json` for
Google services and native Google Sign-In. Download it from Firebase Console
after registering the Android app. It is ignored by Git and must never be
committed. Apple builds similarly keep `GoogleService-Info.plist` local and
ignored. CI should materialize these platform files from encrypted repository
secrets immediately before building.

Never add `.env`, Firebase Admin service-account JSON, private signing keys, or
`android/key.properties` to the repository. Values passed with Dart defines are
compiled into the client application and therefore are configuration, not a
safe store for server-side secrets; secure Firebase access with Authentication,
Security Rules, App Check, and API-key restrictions.

`firebase_options.dart` reads Android, iOS, macOS, web, and Windows configuration
from Dart defines and fails early with a setup message when required values are
missing.
Linux Firebase initialization is intentionally unsupported until a Linux-capable
Firebase implementation and configuration are selected.

### Firebase keys and secret-scanning alerts

Firebase client API keys identify the Firebase project but do not authorize
database access by themselves. They are still kept out of Git so repository
history and automated secret scanners remain clean. Apply Android package and
SHA certificate restrictions, web referrer restrictions, and API restrictions
to every client key in Google Cloud Console. Firebase Security Rules and App
Check remain mandatory because an environment file cannot hide values compiled
into a distributed mobile or web application.

If a key is accidentally committed:

1. Restrict or rotate the exposed key in Google Cloud Console.
2. Replace it in the ignored local `.env` and platform configuration files.
3. Remove it from every reachable Git branch and tag; deleting only the latest
   file does not remove it from earlier commits.
4. Rebuild and test authentication with the replacement configuration.
5. Resolve the GitHub secret-scanning alert only after documenting the action
   taken. Contact GitHub Support if an old pull-request object still exposes a
   rewritten commit.

Never store Firebase Admin SDK credentials or other server-side secrets in Dart
defines. Keep them exclusively in a trusted backend or encrypted CI secret
store, and revoke them immediately if they are exposed.

### Google sign-in

Android uses the native Google account chooser. Add both debug and release SHA-1
and SHA-256 fingerprints to the matching Firebase Android app, download an
updated local `google-services.json`, and update the matching values in `.env`.
The Android application ID and Firebase client must match exactly.

In Firebase Console:

1. Enable Email/Password and Google providers.
2. Add Android SHA-1 and SHA-256 fingerprints for Google sign-in.
3. Create Firestore and Realtime Database.
4. Review and deploy the included rules:

```bash
firebase deploy --only firestore:rules,database
```

The rule sources are [firestore.rules](firestore.rules) and [database.rules.json](database.rules.json). Do not run production with test-mode/global rules.

## Create the first organization

Register normally, choose **Create organization**, and enter its name, type, and location. The app creates these records atomically:

```text
organizations/{organizationId}                         status=trial, plan=free
organization_memberships/{organizationId}_{ownerUid}  role=organization_owner
organization_subscriptions/{organizationId}           plan=free
```

PSTU is not seeded or hardcoded. It can be created through the same flow as every other customer. A platform operator is provisioned only through a trusted environment by setting `users/{uid}.role` to `platform_admin`; a client cannot grant that role.

Public organizations can be joined directly. `code_required`, `approval_required`, and `private` are represented in the model; their trusted invite/approval workflows should be completed with a backend before production use.

Firestore is the membership source of truth. Because Realtime Database rules cannot read Firestore, a trusted backend or Firebase extension must mirror active memberships to `organization_memberships/{organizationId}/{uid}` before live tracking is available. Client writes to this authorization mirror are denied; never loosen that rule to make onboarding appear to work.

The organization owner can then:

1. Create the organization's fleet under **Buses**.
2. Draw a route or record the actual route under **Routes**.
3. Add stops at recorded/drawn points and save.
4. Create departure schedules in `HH:mm` format.
5. Grant test tokens to known UIDs.
6. Approve pending referral claims.

Expected schedule bus/route IDs are hints only; they never create a permanent bus-route relationship.

## Android foreground service

`BusLocationService.kt` is declared with `foregroundServiceType="location"`. It uses Android's fused location provider, publishes samples through an EventChannel, and displays an ongoing **Sharing [bus]’s location** notification with a stop action.

Configured permissions include internet, precise/coarse location, background location, foreground service/location, and notifications. Android may require background permission in a separate settings step. The app does not request location from general users.

## OpenFreeMap

The reusable map uses:

```text
https://tiles.openfreemap.org/styles/liberty
```

No key is required. For a large rollout, review OpenFreeMap's current public-service policy or self-host compatible tiles/styles; the provider URL is isolated in the map component.

## Offline behavior

Drift caches organizations, memberships, SaaS subscription metadata, profiles, buses, routes, stops, schedules, coarse statuses, wallets, transactions, favorites, and referral records. Static screens continue from cache when Firestore is unavailable. Exact cached coordinates are never presented as current live data; status freshness converts stale data to GPS LOST.

After changing Drift tables:

```bash
dart run build_runner build
```

Increment `schemaVersion` and add a migration. Do not erase user databases instead of migrating.

## Android build compatibility

Flutter 3.44 introduced the AGP 9 built-in Kotlin migration. Until upstream
releases remove their plugin-owned Kotlin Gradle Plugin application, this repo
uses documented compatibility copies under `third_party/firebase_database` and
`third_party/maplibre_gl`. Their Dart and native implementations match the
corresponding pub.dev releases; only Android Gradle integration is adapted.
Remove the path dependencies after equivalent upstream releases are available.

## Multi-phone live test

1. Deploy rules and create an organization, buses, routes, and member accounts.
2. Install the debug APK on Phones A, B, and C.
3. On Phone A, open a test bus and tap **I'm in this bus**.
4. Grant precise/background location and notification permissions.
5. Lock Phone A; confirm its persistent sharing notification remains visible.
6. Phone B should see free route/direction/nearest-stop status without exact coordinates.
7. Grant Phone B test tokens from admin; spend 10 tokens to unlock exact tracking for 24 hours.
8. Join the same bus from Phone C. It should remain standby while A renews the lease.
9. Disable A's network. C should claim the source lease after expiry and begin uploading.
10. Verify reverse direction, arrival, and GPS-loss behavior.

## Debug GPS simulator

Admin debug builds expose **GPS Simulator**. Select a bus/route and simulate progress, reverse direction, stopped state, GPS noise, GPS loss, or offline state. The entry is protected by `kDebugMode` and is omitted from release builds.

## Notifications

Tap the notification icon beside a schedule to create a local daily reminder:

> Mama, your bus is scheduled soon.

FCM packages are prepared, but automatic server-triggered FCM is deferred because this zero-billing MVP has no trusted Cloud Functions/custom backend.

## Wallet and referrals

- Admins grant test tokens and every change creates a ledger record.
- Ten tokens atomically unlock premium for 24 hours.
- Premium does not renew automatically.
- Users may create one referral claim.
- Admin approval grants 50 test tokens to the referrer.
- The token-purchase screen is intentionally disabled until a trusted payment provider/backend exists.

Client-only rewards cannot provide payment-grade trust. Before handling real value, migrate wallet, payment, referral, and contributor rewards to a trusted backend.

## Validation

```bash
dart format lib test
flutter analyze
flutter test
flutter build apk --debug
```

The debug APK is written to `build/app/outputs/flutter-apk/app-debug.apk`.

Tests cover authentication/BLoC state, bus filtering, haversine distance, segment/polyline projection, route progress, simplification, route confirmation, shared-road ambiguity, bad GPS, direction/noise, next stops, ETA, stale GPS, arrival, lease expiry, and premium expiry.

## Known limitations

- Real-money payment processing is intentionally absent.
- Firebase provider activation, SHA fingerprints, rule deployment, admin provisioning, and physical multi-phone testing require external configuration.
- Organization discovery currently depends on deployed Firestore rules matching the included `firestore.rules`; stale deployed rules produce `PERMISSION_DENIED`.
- Referral/test-token approval is performed by an admin client. Move value-bearing rewards to a trusted backend before public monetization.
- Public OpenFreeMap availability is external to this repository.
- Android vendors differ in battery management; test supported pilot devices under screen lock.
- Route matching thresholds in `TrackingConfig` require calibration with real organization routes.
- FCM server automation is deferred; schedule reminders are local.
- A trusted membership-mirroring process is required for newly joined users to access Realtime Database tracking. This cross-database authorization step cannot be performed securely by the Flutter client.

## License

No license has been selected. Add a `LICENSE` before public distribution or accepting external contributions.
