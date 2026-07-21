import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/wallet.dart';
import '../../domain/repositories/wallet_repository.dart';

class WalletState extends Equatable {
  const WalletState({this.wallet, this.processing = false, this.message});
  final Wallet? wallet;
  final bool processing;
  final String? message;
  @override
  List<Object?> get props => [wallet, processing, message];
}

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(this._repository) : super(const WalletState());
  final WalletRepository _repository;
  String? userId;
  StreamSubscription? _subscription;
  Future<void> start(String scope) async {
    if (userId == scope && _subscription != null) return;
    userId = scope;
    await _subscription?.cancel();
    _subscription = _repository
        .watchWallet(scope)
        .listen((wallet) => emit(WalletState(wallet: wallet)));
  }

  Future<bool> unlockPremium() async {
    final scope = userId;
    if (scope == null) return false;
    emit(WalletState(wallet: state.wallet, processing: true));
    final result = await _repository.unlockPremium(scope);
    emit(
      WalletState(
        wallet: state.wallet,
        message: result
            ? 'Premium unlocked for 24 hours.'
            : 'You need at least 10 tokens.',
      ),
    );
    return result;
  }

  Future<bool> claimWelcomeTokens() async {
    final scope = userId;
    if (scope == null) return false;
    emit(WalletState(wallet: state.wallet, processing: true));
    try {
      final claimed = await _repository.claimWelcomeTokens(scope);
      emit(
        WalletState(
          wallet: state.wallet,
          message: claimed
              ? '100 free tokens added.'
              : 'Welcome tokens already claimed.',
        ),
      );
      return claimed;
    } catch (error) {
      emit(WalletState(wallet: state.wallet, message: error.toString()));
      return false;
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
