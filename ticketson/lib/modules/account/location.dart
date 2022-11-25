import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/account/screens/view_account.dart';

class ViewAccountLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.account}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('account'),
        child: ViewAccountScreen(),
      ),
    ];
    return pages;
  }
}
