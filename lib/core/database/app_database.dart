import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class Institutions extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get type => text().withDefault(const Constant('university'))();
  TextColumn get shortName => text().withDefault(const Constant(''))();
  TextColumn get slug => text().withDefault(const Constant(''))();
  TextColumn get status => text().withDefault(const Constant('trial'))();
  TextColumn get plan => text().withDefault(const Constant('free'))();
  TextColumn get accessMode => text().withDefault(const Constant('public'))();
  TextColumn get location => text().withDefault(const Constant(''))();
  TextColumn get timezone => text().withDefault(const Constant('Asia/Dhaka'))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  @override
  Set<Column> get primaryKey => {id};
}

class OrganizationMemberships extends Table {
  TextColumn get organizationId => text()();
  TextColumn get userId => text()();
  TextColumn get role => text().withDefault(const Constant('user'))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column> get primaryKey => {organizationId, userId};
}

class OrganizationSubscriptions extends Table {
  TextColumn get organizationId => text()();
  TextColumn get plan => text().withDefault(const Constant('free'))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  DateTimeColumn get periodEndsAt => dateTime().nullable()();
  @override
  Set<Column> get primaryKey => {organizationId};
}

class ChatMessages extends Table {
  TextColumn get id => text()();
  TextColumn get organizationId => text()();
  TextColumn get senderId => text()();
  TextColumn get senderName => text()();
  TextColumn get messageText => text()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get expiresAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

class UserProfiles extends Table {
  TextColumn get uid => text()();
  TextColumn get displayName => text()();
  TextColumn get email => text()();
  TextColumn get role => text().withDefault(const Constant('user'))();
  TextColumn get institutionId => text().nullable()();
  TextColumn get referralCode => text().nullable()();
  TextColumn get referredBy => text().nullable()();
  TextColumn get firstName => text().nullable()();
  TextColumn get lastName => text().nullable()();
  TextColumn get gender => text().nullable()();
  TextColumn get department => text().nullable()();
  TextColumn get academicSession => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  @override
  Set<Column> get primaryKey => {uid};
}

@DataClassName('BusRow')
class Buses extends Table {
  TextColumn get id => text()();
  TextColumn get institutionId => text().references(Institutions, #id)();
  TextColumn get name => text()();
  TextColumn get busNumber => text()();
  TextColumn get plateNumber => text().nullable()();
  TextColumn get description => text().nullable()();
  IntColumn get colorValue => integer()();
  IntColumn get capacity => integer().nullable()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  @override
  Set<Column> get primaryKey => {id};
}

class Routes extends Table {
  TextColumn get id => text()();
  TextColumn get institutionId => text().references(Institutions, #id)();
  TextColumn get name => text()();
  TextColumn get startName => text()();
  TextColumn get endName => text()();
  IntColumn get distanceMeters => integer()();
  BoolColumn get bidirectional => boolean().withDefault(const Constant(true))();
  RealColumn get routeCorridorMeters =>
      real().withDefault(const Constant(150))();
  TextColumn get encodedPoints => text().withDefault(const Constant(''))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  @override
  Set<Column> get primaryKey => {id};
}

class RouteStops extends Table {
  TextColumn get id => text()();
  TextColumn get routeId => text().references(Routes, #id)();
  TextColumn get name => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  IntColumn get stopOrder => integer()();
  RealColumn get routeProgress => real().withDefault(const Constant(0))();
  @override
  Set<Column> get primaryKey => {id};
}

class BusSchedules extends Table {
  TextColumn get id => text()();
  TextColumn get institutionId => text().references(Institutions, #id)();
  TextColumn get expectedBusId => text().nullable()();
  TextColumn get expectedRouteId => text().nullable()();
  TextColumn get label => text()();
  TextColumn get departureTime => text()();
  IntColumn get weekDays => integer().withDefault(const Constant(127))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  @override
  Set<Column> get primaryKey => {id};
}

class CachedBusStatuses extends Table {
  TextColumn get busId => text()();
  BoolColumn get isLive => boolean()();
  TextColumn get detectedRouteId => text().nullable()();
  TextColumn get direction => text().withDefault(const Constant('UNKNOWN'))();
  TextColumn get nearestStop => text().nullable()();
  TextColumn get confidence => text().withDefault(const Constant('LOW'))();
  DateTimeColumn get updatedAt => dateTime()();
  @override
  Set<Column> get primaryKey => {busId};
}

class Wallets extends Table {
  TextColumn get userId => text()();
  IntColumn get tokens => integer().withDefault(const Constant(0))();
  DateTimeColumn get premiumUntil => dateTime().nullable()();
  BoolColumn get freeTokensClaimed =>
      boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey => {userId};
}

class TokenTransactions extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get type => text()();
  IntColumn get amount => integer()();
  IntColumn get balanceAfter => integer()();
  TextColumn get details => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}

class Favorites extends Table {
  TextColumn get userId => text()();
  TextColumn get institutionId => text()();
  TextColumn get busId => text()();
  BoolColumn get notificationsEnabled =>
      boolean().withDefault(const Constant(true))();
  @override
  Set<Column> get primaryKey => {userId, busId};
}

class ReferralClaims extends Table {
  TextColumn get id => text()();
  TextColumn get claimantUserId => text()();
  TextColumn get referrerUserId => text()();
  TextColumn get referralCode => text()();
  TextColumn get status => text().withDefault(const Constant('PENDING'))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get reviewedAt => dateTime().nullable()();
  @override
  Set<Column> get primaryKey => {id};
  @override
  List<Set<Column>> get uniqueKeys => [
    {claimantUserId},
  ];
}

@DriftDatabase(
  tables: [
    Institutions,
    OrganizationMemberships,
    OrganizationSubscriptions,
    ChatMessages,
    UserProfiles,
    Buses,
    Routes,
    RouteStops,
    BusSchedules,
    CachedBusStatuses,
    Wallets,
    TokenTransactions,
    Favorites,
    ReferralClaims,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'mama_bus_koi'));
  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      if (from < 2) {
        await migrator.addColumn(institutions, institutions.shortName);
        await migrator.createTable(userProfiles);
      }
      if (from < 3) {
        await migrator.addColumn(buses, buses.plateNumber);
        await migrator.addColumn(buses, buses.description);
        await migrator.addColumn(routes, routes.bidirectional);
        await migrator.addColumn(routes, routes.routeCorridorMeters);
        await migrator.addColumn(routeStops, routeStops.routeProgress);
        await migrator.createTable(favorites);
        await migrator.createTable(referralClaims);
      }
      if (from < 4) {
        await migrator.addColumn(institutions, institutions.slug);
        await migrator.addColumn(institutions, institutions.status);
        await migrator.addColumn(institutions, institutions.plan);
        await migrator.addColumn(institutions, institutions.accessMode);
        await migrator.addColumn(institutions, institutions.location);
        await migrator.addColumn(institutions, institutions.timezone);
        await migrator.createTable(organizationMemberships);
        await migrator.createTable(organizationSubscriptions);
      }
      if (from < 5) {
        await migrator.addColumn(userProfiles, userProfiles.firstName);
        await migrator.addColumn(userProfiles, userProfiles.lastName);
        await migrator.addColumn(userProfiles, userProfiles.gender);
        await migrator.addColumn(userProfiles, userProfiles.department);
        await migrator.addColumn(userProfiles, userProfiles.academicSession);
      }
      if (from < 6) {
        await migrator.createTable(chatMessages);
      }
      if (from < 7) {
        await migrator.addColumn(wallets, wallets.freeTokensClaimed);
      }
    },
  );

  Stream<List<BusRow>> watchBuses(String institution) =>
      (select(buses)..where(
            (row) =>
                row.institutionId.equals(institution) & row.active.equals(true),
          ))
          .watch();

  Stream<List<BusSchedule>> watchSchedules(String institution) =>
      (select(busSchedules)..where(
            (row) =>
                row.institutionId.equals(institution) & row.active.equals(true),
          ))
          .watch();

  Stream<Wallet?> watchWallet(String userId) => (select(
    wallets,
  )..where((row) => row.userId.equals(userId))).watchSingleOrNull();

  Stream<UserProfile?> watchUser(String uid) => (select(
    userProfiles,
  )..where((row) => row.uid.equals(uid))).watchSingleOrNull();
}
