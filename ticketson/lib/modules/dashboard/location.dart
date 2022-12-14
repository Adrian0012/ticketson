import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/dashboard/screens/dashboard.dart';

class DashboardLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.dashboard}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('dashboard'),
        child: DashboardScreen(),
      )
    ];
    return pages;
  }
}
