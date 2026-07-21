import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/app_user.dart';
import '../../domain/repositories/auth_repository.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

final class AuthStarted extends AuthEvent {
  const AuthStarted();
}

final class AuthEmailSubmitted extends AuthEvent {
  const AuthEmailSubmitted({
    required this.email,
    required this.password,
    this.name,
    this.register = false,
  });
  final String email, password;
  final String? name;
  final bool register;
  @override
  List<Object?> get props => [email, password, name, register];
}

final class AuthGoogleSubmitted extends AuthEvent {
  const AuthGoogleSubmitted();
}

final class AuthInstitutionSelected extends AuthEvent {
  const AuthInstitutionSelected(this.institutionId);
  final String institutionId;
  @override
  List<Object> get props => [institutionId];
}

final class AuthProfileSubmitted extends AuthEvent {
  const AuthProfileSubmitted({
    required this.fullName,
    required this.gender,
    required this.department,
  });
  final String fullName, gender, department;
  @override
  List<Object> get props => [fullName, gender, department];
}

final class AuthSignOutRequested extends AuthEvent {
  const AuthSignOutRequested();
}

final class _AuthUserChanged extends AuthEvent {
  const _AuthUserChanged(this.user);
  final AppUser? user;
  @override
  List<Object?> get props => [user];
}

enum AuthStatus { initial, loading, authenticated, unauthenticated, failure }

class AuthState extends Equatable {
  const AuthState({this.status = AuthStatus.initial, this.user, this.error});
  final AuthStatus status;
  final AppUser? user;
  final String? error;
  bool get needsInstitution =>
      user != null &&
      user?.institutionId == null &&
      user?.isPlatformAdmin != true;
  bool get needsProfile =>
      user != null &&
      user?.isPlatformAdmin != true &&
      user?.hasCompleteProfile != true;
  @override
  List<Object?> get props => [status, user, error];
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repository) : super(const AuthState()) {
    on<AuthStarted>(_onStarted);
    on<_AuthUserChanged>(
      (event, emit) => emit(
        AuthState(
          status: event.user == null
              ? AuthStatus.unauthenticated
              : AuthStatus.authenticated,
          user: event.user,
        ),
      ),
    );
    on<AuthEmailSubmitted>(_onEmail);
    on<AuthGoogleSubmitted>(_onGoogle);
    on<AuthInstitutionSelected>(_onInstitution);
    on<AuthProfileSubmitted>(_onProfile);
    on<AuthSignOutRequested>((event, emit) => _repository.signOut());
  }

  Future<void> _onProfile(
    AuthProfileSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState(status: AuthStatus.loading, user: state.user));
    try {
      await _repository.updateProfile(
        fullName: event.fullName,
        gender: event.gender,
        department: event.department,
      );
    } catch (error) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          user: state.user,
          error: error.toString(),
        ),
      );
    }
  }

  final AuthRepository _repository;
  StreamSubscription? _subscription;
  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    emit(const AuthState(status: AuthStatus.loading));
    await _subscription?.cancel();
    _subscription = _repository.watchCurrentUser().listen(
      (user) => add(_AuthUserChanged(user)),
      onError: (Object error) => addError(error),
    );
  }

  Future<void> _onEmail(
    AuthEmailSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState(status: AuthStatus.loading, user: state.user));
    try {
      if (event.register) {
        await _repository.registerWithEmail(
          name: event.name ?? '',
          email: event.email,
          password: event.password,
        );
      } else {
        await _repository.signInWithEmail(
          email: event.email,
          password: event.password,
        );
      }
    } catch (error) {
      emit(AuthState(status: AuthStatus.failure, error: error.toString()));
    }
  }

  Future<void> _onGoogle(
    AuthGoogleSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState(status: AuthStatus.loading, user: state.user));
    try {
      await _repository.signInWithGoogle();
    } catch (error) {
      emit(AuthState(status: AuthStatus.failure, error: error.toString()));
    }
  }

  Future<void> _onInstitution(
    AuthInstitutionSelected event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthState(status: AuthStatus.loading, user: state.user));
    try {
      await _repository.updateInstitution(event.institutionId);
    } catch (error) {
      emit(
        AuthState(
          status: AuthStatus.failure,
          user: state.user,
          error: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
