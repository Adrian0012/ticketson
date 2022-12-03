import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/tickets/forms/create_ticket/screens/create_ticket.dart';

class CreateTicketLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.createTicketForm}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('createTicket'),
        child: CreateTicketScreen(),
      ),
    ];
    return pages;
  }
}
