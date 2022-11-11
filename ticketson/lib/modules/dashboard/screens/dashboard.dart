import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketson/config/themes/custom_images.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/wallet/bloc/wallet_bloc.dart';
import 'package:ticketson/modules/wallet/models/wallet.dart';
import 'package:ticketson/widgets/bottom_navbar.dart';
import 'package:ticketson/widgets/loading.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final WalletBloc _walletBloc = WalletBloc();

  @override
  void initState() {
    _walletBloc.add(GetWallets());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(CustomImages.background),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Palette.transparent,
          body: _buildWallets(),
          bottomNavigationBar: const Navbar(selectedIndex: 1),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Palette.accentColor,
              child: const Icon(
                Icons.add,
                color: Palette.secondaryColor,
                size: 25.0,
              ),
              onPressed: () {
                Beamer.of(context).beamToNamed(Routes.createWalletForm);
              },
            ),
          )),
    );
  }

  Widget _buildWallets() {
    return BlocProvider(
      create: (_) => _walletBloc,
      child: BlocListener<WalletBloc, WalletState>(
        listener: (context, state) {
          if (state is WalletsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (context, state) {
            if (state is WalletsInitial) {
              return const Loading();
            } else if (state is WalletsLoading) {
              return const Loading();
            } else if (state is WalletsLoaded) {
              return _buildWalletItems(context, state.wallets);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

Widget _buildWalletItems(BuildContext context, List<Wallet> model) {
  return Column(
    children: <Widget>[
      Expanded(
        child: ListView.builder(
            itemCount: model.length,
            itemBuilder: (BuildContext content, int index) {
              final Wallet wallet = model[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: WalletItem(wallet: wallet),
              );
            }),
      ),
    ],
  );
}

class WalletItem extends StatefulWidget {
  const WalletItem({
    Key? key,
    required this.wallet,
  }) : super(key: key);
  final Wallet wallet;

  @override
  State<WalletItem> createState() => _WalletItemState();
}

class _WalletItemState extends State<WalletItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Beamer.of(context)
            .beamToNamed(Routes.tickets, data: {'wallet': widget.wallet});
      }),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.primaryColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            width: 2.0,
            color: Palette.accentColor.withOpacity(0.5),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              spreadRadius: 16,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        width: 360,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.wallet,
                    size: 25.0,
                    color: Palette.accentColor,
                  ),
                  const Padding(padding: EdgeInsets.only(right: 4.0)),
                  Text(
                    widget.wallet.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.wallet.ticketCount.toString(),
                    style: const TextStyle(
                      color: Palette.secondaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(2.0)),
                  const Icon(
                    Icons.airplane_ticket,
                    size: 30.0,
                    color: Palette.accentColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
