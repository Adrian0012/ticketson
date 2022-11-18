// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      json['uid'] as String,
      json['name'] as String,
      json['walletType'] as String,
      json['ticketCount'] as int,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'walletType': instance.walletType,
      'ticketCount': instance.ticketCount,
      'createdAt': instance.createdAt.toIso8601String(),
    };
