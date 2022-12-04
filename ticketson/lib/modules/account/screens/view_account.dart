import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketson/common_widgets/bottom_navbar.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/constants/navbar_enum.dart';
import 'package:lottie/lottie.dart';
import 'package:ticketson/modules/account/widgets/custom_button.dart';

class ViewAccountScreen extends StatefulWidget {
  const ViewAccountScreen({super.key});

  @override
  State<ViewAccountScreen> createState() => _ViewAccountStateScreen();
}

class _ViewAccountStateScreen extends State<ViewAccountScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Lottie.asset(
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                  'assets/lottie/account.json',
                  controller: _controller,
                  onLoaded: (composition) {
                    _controller
                      ..duration = composition.duration
                      ..repeat();
                  },
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'adrian@code.je',
                    style: TextStyle(
                      color: Palette.white,
                      fontSize: 16.0,
                      letterSpacing: 0.2,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                            buttonText: 'Edit Profile',
                            width: 2.58,
                            voidCallback: () {
                              HapticFeedback.lightImpact();
                            }),
                        const Divider(
                          height: 20.0,
                        ),
                        CustomButton(
                            buttonText: 'Delete Account',
                            width: 2.58,
                            voidCallback: () {
                              HapticFeedback.lightImpact();
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: CustomBottomNavbar(
          selectedIndex: 2,
          navbarLocation: NavbarStatus.account.name,
        ),
      ),
    );
  }
}
