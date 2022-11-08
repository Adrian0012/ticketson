import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/forms/create_wallet/create_wallet_form.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletStateScreen();
}

class _CreateWalletStateScreen extends State<CreateWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.accentColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 30.0,
          color: Colors.white,
          onPressed: () {
            Beamer.of(context).beamBack();
          },
        ),
        title: const Text('Add Wallet'),
        elevation: 0.0,
        backgroundColor: Palette.primaryColor,
      ),
      body: const CreateWalletForm(),
    );
  }
}
