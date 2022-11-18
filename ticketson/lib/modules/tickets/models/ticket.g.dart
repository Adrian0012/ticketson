// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticket _$TicketFromJson(Map<String, dynamic> json) => Ticket(
      json['uid'] as String,
      json['number'] as String,
      json['status'] as String,
      json['walletUid'] as String,
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TicketToJson(Ticket instance) => <String, dynamic>{
      'uid': instance.uid,
      'number': instance.number,
      'status': instance.status,
      'walletUid': instance.walletUid,
      'createdAt': instance.createdAt.toIso8601String(),
    };
