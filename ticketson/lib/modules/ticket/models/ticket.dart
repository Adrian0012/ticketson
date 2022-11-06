import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';

@JsonSerializable()
class Ticket {
  final String uid;
  final String number;
  final String status;
  final String walletUid;
  final DateTime createdAt;

  Ticket(
    this.uid,
    this.number,
    this.status,
    this.walletUid,
    this.createdAt,
  );

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}
