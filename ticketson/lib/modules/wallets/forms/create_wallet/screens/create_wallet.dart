import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/themes/custom_images.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/modules/wallets/forms/create_wallet/create_wallet_form.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletStateScreen();
}

class _CreateWalletStateScreen extends State<CreateWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: CustomImages.background,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Palette.transparent,
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
      ),
    );
  }
}
