import 'dart:async';

import 'package:ticketson/modules/ticket/models/ticket.dart';
import 'package:ticketson/modules/ticket/provider/ticket_provider.dart';

class TicketRepository {
  final _ticketProvider = TicketProvider();

  Future<List<Ticket>> getTickets(String walletUid) {
    return _ticketProvider.getTickets(walletUid);
  }
}

class NetworkError extends Error {}
