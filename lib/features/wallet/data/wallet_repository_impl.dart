import 'package:drift/drift.dart' hide Column;
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';
import '../../../core/database/app_database.dart' as db;
import '../domain/entities/wallet.dart' as domain;
import '../domain/repositories/wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  WalletRepositoryImpl(this._local, this._remote);
  final db.AppDatabase _local;
  final FirebaseDatabase _remote;

  @override
  Stream<domain.Wallet> watchWallet(String userId) async* {
    await _local
        .into(_local.wallets)
        .insert(
          db.WalletsCompanion.insert(userId: userId),
          mode: InsertMode.insertOrIgnore,
        );
    _remote.ref('wallets/$userId').onValue.listen((event) async {
      final raw = event.snapshot.value;
      if (raw is! Map) return;
      final value = Map<String, dynamic>.from(raw);
      await _local
          .into(_local.wallets)
          .insert(
            db.WalletsCompanion.insert(
              userId: userId,
              tokens: Value((value['tokens'] as num? ?? 0).toInt()),
              premiumUntil: Value(
                value['premiumUntil'] == null
                    ? null
                    : DateTime.fromMillisecondsSinceEpoch(
                        (value['premiumUntil'] as num).toInt(),
                      ),
              ),
              freeTokensClaimed: Value(value['freeTokensClaimed'] == true),
            ),
            mode: InsertMode.insertOrReplace,
          );
    });
    yield* _local
        .watchWallet(userId)
        .where((value) => value != null)
        .map(
          (value) => domain.Wallet(
            userId: value!.userId,
            tokens: value.tokens,
            premiumUntil: value.premiumUntil,
            freeTokensClaimed: value.freeTokensClaimed,
          ),
        );
  }

  @override
  Future<bool> claimWelcomeTokens(String userId) async {
    final result = await _remote.ref('wallets/$userId').runTransaction((value) {
      final wallet = value is Map
          ? Map<String, dynamic>.from(value)
          : <String, dynamic>{};
      if (wallet['freeTokensClaimed'] == true) return Transaction.abort();
      wallet['tokens'] = (wallet['tokens'] as num? ?? 0).toInt() + 100;
      wallet['freeTokensClaimed'] = true;
      return Transaction.success(wallet);
    });
    if (!result.committed) return false;
    final balance = (result.snapshot.child('tokens').value as num).toInt();
    await _record(
      userId,
      domain.TransactionType.welcomeGift,
      100,
      balance,
      'One-time welcome gift',
    );
    return true;
  }

  @override
  Future<bool> unlockPremium(String userId) async {
    final now = await _serverNow();
    final result = await _remote.ref('wallets/$userId').runTransaction((value) {
      final wallet = value is Map
          ? Map<String, dynamic>.from(value)
          : <String, dynamic>{'tokens': 0};
      final tokens = (wallet['tokens'] as num? ?? 0).toInt();
      if (tokens < 10) return Transaction.abort();
      wallet['tokens'] = tokens - 10;
      wallet['premiumUntil'] = now + const Duration(hours: 24).inMilliseconds;
      return Transaction.success(wallet);
    });
    if (!result.committed) return false;
    final wallet = Map<String, dynamic>.from(result.snapshot.value as Map);
    await _record(
      userId,
      domain.TransactionType.passPurchase,
      -10,
      (wallet['tokens'] as num).toInt(),
      '24-hour premium access',
    );
    return true;
  }

  @override
  Stream<List<domain.TokenTransaction>> watchTransactions(String userId) =>
      (_local.select(_local.tokenTransactions)
            ..where((row) => row.userId.equals(userId))
            ..orderBy([(row) => OrderingTerm.desc(row.createdAt)]))
          .watch()
          .map(
            (rows) => rows
                .map(
                  (row) => domain.TokenTransaction(
                    id: row.id,
                    type: _type(row.type),
                    amount: row.amount,
                    balanceAfter: row.balanceAfter,
                    createdAt: row.createdAt,
                    details: row.details,
                  ),
                )
                .toList(),
          );

  @override
  Future<void> grantTestTokens(String userId, int amount) async {
    if (amount <= 0) throw ArgumentError.value(amount, 'amount');
    final result = await _remote.ref('wallets/$userId').runTransaction((value) {
      final wallet = value is Map
          ? Map<String, dynamic>.from(value)
          : <String, dynamic>{};
      wallet['tokens'] = (wallet['tokens'] as num? ?? 0).toInt() + amount;
      return Transaction.success(wallet);
    });
    final balance = (result.snapshot.child('tokens').value as num).toInt();
    await _record(
      userId,
      domain.TransactionType.adminAdjustment,
      amount,
      balance,
      'Development test tokens',
    );
  }

  Future<void> _record(
    String userId,
    domain.TransactionType type,
    int amount,
    int balance,
    String details,
  ) async {
    final id = const Uuid().v4(), created = DateTime.now();
    final value = {
      'type': _name(type),
      'amount': amount,
      'balanceAfter': balance,
      'details': details,
      'timestamp': ServerValue.timestamp,
    };
    await _remote.ref('token_transactions/$userId/$id').set(value);
    await _local
        .into(_local.tokenTransactions)
        .insert(
          db.TokenTransactionsCompanion.insert(
            id: id,
            userId: userId,
            type: _name(type),
            amount: amount,
            balanceAfter: balance,
            details: Value(details),
            createdAt: created,
          ),
        );
  }

  Future<int> _serverNow() async {
    final value = await _remote.ref('.info/serverTimeOffset').get();
    return DateTime.now().millisecondsSinceEpoch +
        ((value.value as num?)?.toInt() ?? 0);
  }

  String _name(domain.TransactionType type) => switch (type) {
    domain.TransactionType.purchase => 'PURCHASE',
    domain.TransactionType.referral => 'REFERRAL',
    domain.TransactionType.contributorReward => 'CONTRIBUTOR_REWARD',
    domain.TransactionType.adminAdjustment => 'ADMIN_ADJUSTMENT',
    domain.TransactionType.passPurchase => 'PASS_PURCHASE',
    domain.TransactionType.welcomeGift => 'WELCOME_GIFT',
  };
  domain.TransactionType _type(String value) => switch (value) {
    'PURCHASE' => domain.TransactionType.purchase,
    'REFERRAL' => domain.TransactionType.referral,
    'CONTRIBUTOR_REWARD' => domain.TransactionType.contributorReward,
    'ADMIN_ADJUSTMENT' => domain.TransactionType.adminAdjustment,
    'WELCOME_GIFT' => domain.TransactionType.welcomeGift,
    _ => domain.TransactionType.passPurchase,
  };
}
