import '../entities/wallet.dart';

abstract interface class WalletRepository {
  Stream<Wallet> watchWallet(String userId);
  Future<bool> unlockPremium(String userId);
  Future<bool> claimWelcomeTokens(String userId);
  Stream<List<TokenTransaction>> watchTransactions(String userId);
  Future<void> grantTestTokens(String userId, int amount);
}
