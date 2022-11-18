import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:ticketson/modules/tickets/models/ticket.dart';

class TicketProvider {
  Future<List<Ticket>> getTickets(String walletUid) async {
    String response = await rootBundle.loadString('assets/tickets.json');
    Map<String, dynamic> result = json.decode(response);
    final List<Ticket> data = List<Ticket>.from(
        result['data'].map((e) => Ticket.fromJson(e)).toList());
    await Future.delayed(const Duration(seconds: 2));
    return data;
  }
}
