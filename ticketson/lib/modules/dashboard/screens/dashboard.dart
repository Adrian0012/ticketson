import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/images/7.jpg"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Scaffold(
          backgroundColor: Palette.accentColor,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.person,
              ),
              iconSize: 25.0,
              color: Palette.secondaryColor,
              onPressed: () {},
            ),
            title: const Text(
              'adrian@code.je',
              style: TextStyle(
                color: Palette.secondaryColor,
              ),
            ),
            elevation: 0.0,
            backgroundColor: Palette.primaryColor,
          ),
          body: _buildWallets(),
          bottomNavigationBar: const Navbar(selectedIndex: 1),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Palette.secondaryColor,
              child: const Icon(
                Icons.add,
                color: Palette.primaryColor,
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
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.4,
              0.7,
              // 0.9,
            ],
            colors: [
              Palette.cardGradient3,
              Palette.cardGradient1,
              Palette.cardGradient2,
              // Colors.teal,
            ],
          ),
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            width: 1.5,
            color: Colors.white.withOpacity(0.2),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.wallet.name,
                    style: const TextStyle(
                      color: Palette.primaryColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    '1',
                    style: TextStyle(
                      color: Palette.primaryColor,
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(2.0)),
                  Icon(
                    Icons.airplane_ticket,
                    size: 25.0,
                    color: Palette.primaryColor,
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
