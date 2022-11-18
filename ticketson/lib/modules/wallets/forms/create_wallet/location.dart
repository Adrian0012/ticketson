import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/wallets/forms/create_wallet/screens/create_wallet.dart';

class CreateWalletLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['${Routes.createWalletForm}/*'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final pages = [
      const BeamPage(
        key: ValueKey('createWallet'),
        title: 'CreateWallet',
        child: CreateWalletScreen(),
      ),
    ];
    return pages;
  }
}
