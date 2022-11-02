import 'dart:ui';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/wallet/bloc/wallet_bloc.dart';
import 'package:ticketson/modules/wallet/models/wallet.dart';
import 'package:ticketson/widgets/bottom_navbar.dart';

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
        body: _buildWallets(),
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
              return LoadingAnimationWidget.beat(
                  color: Palette.primaryColor, size: 10.0);
            } else if (state is WalletsLoading) {
              return LoadingAnimationWidget.beat(
                  color: Palette.primaryColor, size: 10.0);
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
  // set the listview builder as the container child
  return Column(
    children: <Widget>[
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Colors.yellow,
                Colors.red,
                Colors.indigo,
                Colors.teal,
              ],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 16,
                spreadRadius: 16,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 20.0,
                sigmaY: 20.0,
              ),
              child: ListView.builder(
                  itemCount: model.length,
                  itemBuilder: (BuildContext content, int index) {
                    final Wallet wallett = model[index];
                    return const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: test(),
                    );
                  }),
            ),
          ),
        ),
      )
    ],
  );
}

class test extends StatelessWidget {
  const test({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              width: 1.5,
              color: Colors.white.withOpacity(0.2),
            )),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Card',
                      style: TextStyle(color: Colors.white.withOpacity(0.75))),
                  Icon(
                    Icons.credit_card_sharp,
                    color: Colors.white.withOpacity(0.75),
                  )
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TL Templates',
                      style: TextStyle(color: Colors.white.withOpacity(0.75))),
                  Text('07/25',
                      style: TextStyle(color: Colors.white.withOpacity(0.75))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('5555 5555 5555 4444',
                      style: TextStyle(color: Colors.white.withOpacity(0.75))),
                ],
              )
            ],
          ),
        ));
  }
}
