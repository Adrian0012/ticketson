import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet {
  final String uid;
  final String name;
  final String walletType;
  final int ticketCount;
  final DateTime createdAt;

  Wallet(
    this.uid,
    this.name,
    this.walletType,
    this.ticketCount,
    this.createdAt,
  );

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}
