import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/auth/screens/login.dart';

class LoginLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.login}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('login'),
        child: LoginScreen(),
      ),
    ];
    return pages;
  }
}
