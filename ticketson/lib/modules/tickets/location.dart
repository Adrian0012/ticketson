import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/tickets/screens/tickets_list.dart';

class TicketLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.tickets}/*'];

  Map get _data => (data as Map);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      BeamPage(
          key: const ValueKey('wallet/tickets'),
          child: TicketsScreen(wallet: _data['wallet'])),
    ];
    return pages;
  }
}
