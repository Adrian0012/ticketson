import 'package:flutter/material.dart';
import 'package:ticketson/common_widgets/bottom_navbar.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/constants/navbar_enum.dart';
import 'package:lottie/lottie.dart';

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
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Palette.primaryColor),
                            minimumSize:
                                MaterialStateProperty.all(const Size(200, 50)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(
                                  color: Palette.secondaryColor,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Palette.accentColor.withOpacity(1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                        const Divider(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Palette.primaryColor),
                            minimumSize:
                                MaterialStateProperty.all(const Size(200, 50)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(
                                  color: Palette.secondaryColor,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Delete Account',
                            style: TextStyle(
                              color: Palette.accentColor.withOpacity(1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
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
