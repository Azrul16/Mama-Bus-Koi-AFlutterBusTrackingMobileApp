import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import '../features/admin/presentation/pages/admin_dashboard_page.dart';
import '../features/admin/presentation/pages/platform_admin_page.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/profile_completion_page.dart';
import '../features/buses/presentation/pages/app_shell.dart';
import '../features/institution/presentation/pages/institution_selection_page.dart';
import 'splash_page.dart';

abstract final class AppRoutes {
  static const splash = '/splash';
  static const login = '/login';
  static const institution = '/institution';
  static const profileSetup = '/profile-setup';
  static const userHome = '/home';
  static const adminHome = '/admin';
  static const platformAdminHome = '/platform-admin';
}

class AppRouter {
  AppRouter(AuthBloc authBloc)
    : router = GoRouter(
        initialLocation: AppRoutes.splash,
        refreshListenable: _BlocRefreshListenable(authBloc.stream),
        redirect: (context, state) {
          final auth = authBloc.state;
          if (auth.status == AuthStatus.initial ||
              auth.status == AuthStatus.loading) {
            return state.matchedLocation == AppRoutes.splash
                ? null
                : AppRoutes.splash;
          }
          if (auth.status == AuthStatus.unauthenticated ||
              (auth.status == AuthStatus.failure && auth.user == null)) {
            return state.matchedLocation == AppRoutes.login
                ? null
                : AppRoutes.login;
          }
          if (auth.needsInstitution) {
            return state.matchedLocation == AppRoutes.institution
                ? null
                : AppRoutes.institution;
          }
          if (auth.needsProfile) {
            return state.matchedLocation == AppRoutes.profileSetup
                ? null
                : AppRoutes.profileSetup;
          }
          final destination = auth.user!.isPlatformAdmin
              ? AppRoutes.platformAdminHome
              : auth.user!.isAdmin
              ? AppRoutes.adminHome
              : AppRoutes.userHome;
          final allowed = state.matchedLocation == destination;
          return allowed ? null : destination;
        },
        routes: [
          GoRoute(
            path: AppRoutes.splash,
            builder: (_, _) => const SplashPage(),
          ),
          GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginPage()),
          GoRoute(
            path: AppRoutes.institution,
            builder: (_, _) => const InstitutionSelectionPage(),
          ),
          GoRoute(
            path: AppRoutes.profileSetup,
            builder: (_, _) => const ProfileCompletionPage(),
          ),
          GoRoute(
            path: AppRoutes.userHome,
            builder: (_, _) => const AppShell(),
          ),
          GoRoute(
            path: AppRoutes.adminHome,
            builder: (_, _) => const AdminDashboardPage(),
          ),
          GoRoute(
            path: AppRoutes.platformAdminHome,
            builder: (_, _) => const PlatformAdminPage(),
          ),
        ],
      );
  final GoRouter router;
}

class _BlocRefreshListenable extends ChangeNotifier {
  _BlocRefreshListenable(Stream<Object?> stream) {
    _subscription = stream.listen((_) => notifyListeners());
  }
  late final StreamSubscription<Object?> _subscription;
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
