import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/wallets/screens/wallets_list.dart';

class WalletLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.wallets}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('wallets'),
        child: WalletsScreen(),
      ),
    ];
    return pages;
  }
}
