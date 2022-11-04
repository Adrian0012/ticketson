import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/wallet/models/wallet.dart';
import 'package:ticketson/widgets/bottom_navbar.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key, required this.wallet});
  final Wallet wallet;

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.person),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          title: const Text('Hello - insert user'),
          elevation: 0.0,
          backgroundColor: Palette.primaryColor,
        ),
        body: Container(),
        bottomNavigationBar: const Navbar(selectedIndex: 1),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add),
            onPressed: () {
              Beamer.of(context).beamToNamed(Routes.dashboard);
            },
          ),
        ));
  }

  // Widget _buildWallets() {
  //   return BlocProvider(
  //     create: (_) => _walletBloc,
  //     child: BlocListener<WalletBloc, WalletState>(
  //       listener: (context, state) {
  //         if (state is WalletsError) {
  //           ScaffoldMessenger.of(context).showSnackBar(
  //             SnackBar(
  //               content: Text(state.errorMessage),
  //             ),
  //           );
  //         }
  //       },
  //       child: BlocBuilder<WalletBloc, WalletState>(
  //         builder: (context, state) {
  //           if (state is WalletsInitial) {
  //             return LoadingAnimationWidget.beat(
  //                 color: Palette.primaryColor, size: 10.0);
  //           } else if (state is WalletsLoading) {
  //             return LoadingAnimationWidget.beat(
  //                 color: Palette.primaryColor, size: 10.0);
  //           } else if (state is WalletsLoaded) {
  //             return _buildWalletItems(context, state.wallets);
  //           } else {
  //             return Container();
  //           }
  //         },
  //       ),
  //     ),
  //   );
  // }
}
