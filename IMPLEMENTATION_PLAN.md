# Mama Bus Koi implementation plan

Last updated: 2026-07-21

## Current repository assessment

- Flutter project exists; Android is the MVP target.
- FlutterFire configuration exists for `mama-bus-koi-e4bb9`; Android contains `google-services.json` and the Gradle plugin.
- Firebase Core, Auth, Firestore, and Realtime Database packages are installed.
- Feature-first domain/data/presentation folders, BLoC, and a generated Drift database already exist.
- Bus, route, schedule, tracking, wallet, and transaction models are separated. `Bus` has no `routeId`.

## Architecture decisions

- Feature-first clean architecture: `presentation → domain ← data`.
- BLoC/Cubit replaces the specification's Riverpod preference per product-owner instruction.
- Drift is the offline source of truth for static data; repositories refresh it from Firestore.
- Realtime Database owns expiring public/live state. Exact coordinates never enter the free status model.
- `go_router` owns authentication, institution, and role guards.
- Every data operation is institution-scoped. Only an active trip may connect a bus and route.

## Dependencies

- App: `flutter_bloc`, `equatable`, `go_router`, `drift`, `drift_flutter`
- Firebase: `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_database`
- Tooling: `build_runner`, `drift_dev`, `bloc_test`, `mocktail`
- Map, foreground-location, permission, and notification packages are deferred to their dependent phases.

## Firebase configuration requirements

- Enable Email/Password and Google providers in Firebase Authentication.
- Create Firestore and Realtime Database on Spark.
- Add Android SHA-1/SHA-256 fingerprints before Google sign-in testing.
- Deploy role- and institution-aware rules before production use.
- Never commit service-account credentials.

## Phase checklist

- [x] Phase 1: foundation, Firebase, BLoC, router, theme, auth, user/institution models, selection, role navigation.
- [ ] Phase 2: Admin bus CRUD and user synchronization.
- [ ] Phase 3: Route CRUD, ordered stops, MapLibre/OpenFreeMap, route drawing.
- [ ] Phase 4: Route recording and foreground GPS foundation.
- [ ] Phase 5: Contributor flow and selected-bus live tracking.
- [ ] Phase 6: Source lease election and failover.
- [ ] Phase 7: Geometry route matcher and ambiguity handling.
- [ ] Phase 8: Direction, stops, ETA, and status engine.
- [ ] Phase 9: Free/premium rules and validation.
- [ ] Phase 10: Local schedule notifications and favorites.
- [ ] Phase 11: Wallet/referral UI with manual trusted rewards.
- [ ] Phase 12: Debug GPS simulator and pilot hardening.

## Phase 1 acceptance

- Firebase initializes from generated options.
- Signed-out users reach Login.
- Users without an institution reach Institution Selection.
- Users reach User Home; admins reach Admin Dashboard.
- Institutions and profiles are cached in Drift.
- Formatter, analyzer, tests, and Android debug build pass.
