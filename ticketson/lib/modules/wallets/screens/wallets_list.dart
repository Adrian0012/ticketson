import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/constants/navbar_enum.dart';
import 'package:ticketson/modules/wallets/bloc/wallet_bloc.dart';
import 'package:ticketson/modules/wallets/models/wallet.dart';
import 'package:ticketson/common_widgets/bottom_navbar.dart';
import 'package:ticketson/modules/wallets/widgets/wallets_skeleton_loading.dart';

class WalletsScreen extends StatefulWidget {
  const WalletsScreen({super.key});

  @override
  State<WalletsScreen> createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {
  final WalletBloc _walletBloc = WalletBloc();

  @override
  void initState() {
    _walletBloc.add(GetWallets());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-1, -1),
          end: const Alignment(1.7, 0),
          colors: Palette.baseGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _buildWallets(),
        bottomNavigationBar: CustomBottomNavbar(
          selectedIndex: 1,
          navbarLocation: NavbarStatus.wallets.name,
        ),
      ),
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
              return const WalletsSkeletonLoading();
            } else if (state is WalletsLoading) {
              return const WalletsSkeletonLoading();
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
            physics: const AlwaysScrollableScrollPhysics(),
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
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (() {
        Beamer.of(context)
            .beamToNamed(Routes.tickets, data: {'wallet': widget.wallet});
      }),
      child: Container(
        width: size.width,
        height: size.height / 5.5,
        decoration: BoxDecoration(
          color: Palette.primaryColor.withOpacity(0.2),

          // borderRadius: BorderRadius.circular(16.0),
          // border: Border.all(
          //   width: 1.0,
          //   color: Palette.secondaryColor.withOpacity(0.5),
          // ),
          boxShadow: [
            BoxShadow(
              blurRadius: 16,
              spreadRadius: 16,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: CustomPaint(
          painter: RPSCustomPainter(),
          // child: Container(
          //   decoration: BoxDecoration(
          //     color: Palette.primaryColor.withOpacity(0.2),
          //     // borderRadius: BorderRadius.circular(16.0),
          //     border: Border.all(
          //       width: 3.0,
          //       color: Palette.secondaryColor.withOpacity(0.5),
          //     ),
          //     boxShadow: [
          //       BoxShadow(
          //         blurRadius: 16,
          //         spreadRadius: 16,
          //         color: Colors.black.withOpacity(0.1),
          //       ),
          //     ],
          //   ),
          //   width: size.width,
          //   height: size.height / 5.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.wallet_rounded,
                      size: 25.0,
                      color: Palette.primaryColor,
                    ),
                    const Padding(padding: EdgeInsets.only(right: 4.0)),
                    Text(
                      widget.wallet.name,
                      style: const TextStyle(
                        color: Palette.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
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
                      color: Palette.primaryColor,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Palette.secondaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width * 0.6480519, 0);
    path0.lineTo(size.width * 0.5989610, size.height * 0.2057931);
    path0.lineTo(size.width * 0.3892208, size.height * 0.2076552);
    path0.lineTo(size.width * 0.3256364, size.height * 0.0014483);
    path0.lineTo(0, 0);
    path0.lineTo(0, size.height);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
