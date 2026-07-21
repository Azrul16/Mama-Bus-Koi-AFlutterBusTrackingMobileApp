import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../features/auth/data/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/institution/data/institution_repository_impl.dart';
import '../../features/institution/domain/repositories/institution_repository.dart';
import '../../features/routes/data/route_repository_impl.dart';
import '../../features/routes/domain/repositories/route_repository.dart';
import '../../features/tracking/data/tracking_repository_impl.dart';
import '../../features/tracking/domain/repositories/tracking_repository.dart';
import '../location/foreground_location_service.dart';
import '../permissions/location_permission_service.dart';
import '../../features/buses/data/bus_repository_impl.dart';
import '../../features/buses/domain/repositories/bus_repository.dart';
import '../../features/schedules/data/schedule_repository_impl.dart';
import '../../features/schedules/domain/repositories/schedule_repository.dart';
import '../../features/wallet/data/wallet_repository_impl.dart';
import '../../features/wallet/domain/repositories/wallet_repository.dart';
import '../database/app_database.dart';
import '../notifications/notification_service.dart';
import '../../features/favorites/data/favorites_repository_impl.dart';
import '../../features/favorites/domain/repositories/favorites_repository.dart';
import '../../features/referrals/data/referral_repository_impl.dart';
import '../../features/referrals/domain/repositories/referral_repository.dart';
import '../../features/tracking/data/debug_gps_simulator.dart';
import '../../features/tracking/data/contribution_reward_repository_impl.dart';
import '../../features/tracking/domain/repositories/contribution_reward_repository.dart';
import '../../features/chat/data/chat_repository_impl.dart';
import '../../features/chat/domain/repositories/chat_repository.dart';

class AppDependencies {
  AppDependencies._({
    required this.database,
    required this.busRepository,
    required this.scheduleRepository,
    required this.walletRepository,
    required this.authRepository,
    required this.institutionRepository,
    required this.routeRepository,
    required this.trackingRepository,
    required this.locationPermissionService,
    required this.favoritesRepository,
    required this.referralRepository,
    required this.notificationService,
    required this.debugGpsSimulator,
    required this.foregroundLocationService,
    required this.contributionRewardRepository,
    required this.chatRepository,
  });
  final AppDatabase database;
  final BusRepository busRepository;
  final ScheduleRepository scheduleRepository;
  final WalletRepository walletRepository;
  final AuthRepository authRepository;
  final InstitutionRepository institutionRepository;
  final RouteRepository routeRepository;
  final TrackingRepository trackingRepository;
  final LocationPermissionService locationPermissionService;
  final FavoritesRepository favoritesRepository;
  final ReferralRepository referralRepository;
  final NotificationService notificationService;
  final DebugGpsSimulator debugGpsSimulator;
  final ForegroundLocationService foregroundLocationService;
  final ContributionRewardRepository contributionRewardRepository;
  final ChatRepository chatRepository;

  factory AppDependencies.create() {
    final database = AppDatabase();
    final routeRepository = RouteRepositoryImpl(
      database,
      FirebaseFirestore.instance,
    );
    final walletRepository = WalletRepositoryImpl(
      database,
      FirebaseDatabase.instance,
    );
    final foregroundLocationService = ForegroundLocationService();
    return AppDependencies._(
      database: database,
      busRepository: BusRepositoryImpl(
        database,
        FirebaseFirestore.instance,
        FirebaseDatabase.instance,
      ),
      scheduleRepository: ScheduleRepositoryImpl(
        database,
        FirebaseFirestore.instance,
      ),
      walletRepository: walletRepository,
      authRepository: AuthRepositoryImpl(
        FirebaseAuth.instance,
        FirebaseFirestore.instance,
        database,
      ),
      institutionRepository: InstitutionRepositoryImpl(
        database,
        FirebaseFirestore.instance,
      ),
      routeRepository: routeRepository,
      trackingRepository: TrackingRepositoryImpl(
        FirebaseDatabase.instance,
        foregroundLocationService,
      ),
      locationPermissionService: LocationPermissionService(),
      favoritesRepository: FavoritesRepositoryImpl(
        database,
        FirebaseFirestore.instance,
      ),
      referralRepository: ReferralRepositoryImpl(
        FirebaseFirestore.instance,
        walletRepository,
      ),
      notificationService: NotificationService(),
      debugGpsSimulator: DebugGpsSimulator(FirebaseDatabase.instance),
      foregroundLocationService: foregroundLocationService,
      contributionRewardRepository: ContributionRewardRepositoryImpl(
        FirebaseDatabase.instance,
        walletRepository,
      ),
      chatRepository: ChatRepositoryImpl(database, FirebaseFirestore.instance),
    );
  }
  Future<void> dispose() async {
    if (authRepository case final AuthRepositoryImpl implementation) {
      await implementation.dispose();
    }
    await database.close();
  }
}
