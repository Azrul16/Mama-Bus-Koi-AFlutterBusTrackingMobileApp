import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  const Wallet({
    required this.userId,
    required this.tokens,
    this.premiumUntil,
    this.freeTokensClaimed = false,
  });
  final String userId;
  final int tokens;
  final DateTime? premiumUntil;
  final bool freeTokensClaimed;
  bool get hasPremium => premiumUntil?.isAfter(DateTime.now()) ?? false;
  @override
  List<Object?> get props => [userId, tokens, premiumUntil, freeTokensClaimed];
}

enum TransactionType {
  purchase,
  referral,
  contributorReward,
  adminAdjustment,
  passPurchase,
  welcomeGift,
}

class TokenTransaction extends Equatable {
  const TokenTransaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.balanceAfter,
    required this.createdAt,
    this.details,
  });
  final String id;
  final String? details;
  final TransactionType type;
  final int amount, balanceAfter;
  final DateTime createdAt;
  @override
  List<Object?> get props => [
    id,
    type,
    amount,
    balanceAfter,
    createdAt,
    details,
  ];
}
