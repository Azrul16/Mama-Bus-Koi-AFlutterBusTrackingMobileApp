import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/di/app_dependencies.dart';
import '../core/theme/app_theme.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/buses/presentation/bloc/buses_bloc.dart';
import '../features/institution/presentation/bloc/institutions_cubit.dart';
import '../features/schedules/presentation/bloc/schedules_cubit.dart';
import '../features/routes/presentation/bloc/routes_cubit.dart';
import '../features/tracking/presentation/bloc/contributor_cubit.dart';
import '../features/wallet/presentation/bloc/wallet_cubit.dart';
import '../features/chat/presentation/bloc/chat_cubit.dart';
import 'router.dart';

class MamaBusKoiApp extends StatefulWidget {
  const MamaBusKoiApp({super.key, required this.dependencies});
  final AppDependencies dependencies;
  @override
  State<MamaBusKoiApp> createState() => _MamaBusKoiAppState();
}

class _MamaBusKoiAppState extends State<MamaBusKoiApp> {
  late final AuthBloc authBloc;
  late final BusesBloc busesBloc;
  late final InstitutionsCubit institutionsCubit;
  late final SchedulesCubit schedulesCubit;
  late final WalletCubit walletCubit;
  late final RoutesCubit routesCubit;
  late final ContributorCubit contributorCubit;
  late final ChatCubit chatCubit;
  late final AppRouter appRouter;

  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc(widget.dependencies.authRepository)
      ..add(const AuthStarted());
    busesBloc = BusesBloc(widget.dependencies.busRepository);
    institutionsCubit = InstitutionsCubit(
      widget.dependencies.institutionRepository,
    )..start();
    schedulesCubit = SchedulesCubit(widget.dependencies.scheduleRepository);
    walletCubit = WalletCubit(widget.dependencies.walletRepository);
    routesCubit = RoutesCubit(widget.dependencies.routeRepository);
    contributorCubit = ContributorCubit(
      widget.dependencies.trackingRepository,
      widget.dependencies.locationPermissionService,
    );
    chatCubit = ChatCubit(widget.dependencies.chatRepository);
    appRouter = AppRouter(authBloc);
  }

  @override
  void dispose() {
    appRouter.router.dispose();
    authBloc.close();
    busesBloc.close();
    institutionsCubit.close();
    schedulesCubit.close();
    walletCubit.close();
    routesCubit.close();
    contributorCubit.close();
    chatCubit.close();
    widget.dependencies.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
    providers: [
      RepositoryProvider.value(value: widget.dependencies.authRepository),
      RepositoryProvider.value(
        value: widget.dependencies.institutionRepository,
      ),
      RepositoryProvider.value(value: widget.dependencies.busRepository),
      RepositoryProvider.value(value: widget.dependencies.scheduleRepository),
      RepositoryProvider.value(value: widget.dependencies.walletRepository),
      RepositoryProvider.value(value: widget.dependencies.routeRepository),
      RepositoryProvider.value(value: widget.dependencies.trackingRepository),
      RepositoryProvider.value(value: widget.dependencies.favoritesRepository),
      RepositoryProvider.value(value: widget.dependencies.referralRepository),
      RepositoryProvider.value(value: widget.dependencies.notificationService),
      RepositoryProvider.value(value: widget.dependencies.debugGpsSimulator),
      RepositoryProvider.value(
        value: widget.dependencies.foregroundLocationService,
      ),
      RepositoryProvider.value(
        value: widget.dependencies.locationPermissionService,
      ),
      RepositoryProvider.value(
        value: widget.dependencies.contributionRewardRepository,
      ),
      RepositoryProvider.value(value: widget.dependencies.chatRepository),
    ],
    child: MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authBloc),
        BlocProvider.value(value: busesBloc),
        BlocProvider.value(value: institutionsCubit),
        BlocProvider.value(value: schedulesCubit),
        BlocProvider.value(value: walletCubit),
        BlocProvider.value(value: routesCubit),
        BlocProvider.value(value: contributorCubit),
        BlocProvider.value(value: chatCubit),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          final user = state.user;
          if (user == null) return;
          walletCubit.start(user.uid);
          final scope = user.institutionId;
          if (scope != null) {
            busesBloc.add(BusesInstitutionChanged(scope));
            schedulesCubit.start(scope);
            routesCubit.start(scope);
            chatCubit.start(scope);
          }
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Mama Bus Koi',
          theme: AppTheme.light,
          routerConfig: appRouter.router,
        ),
      ),
    ),
  );
}
