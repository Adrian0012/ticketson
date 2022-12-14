import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketson/modules/auth/widgets/custom_button.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'dart:async';
import 'dart:ui';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController controller1;
  late AnimationController controller2;
  late Animation<double> animation1;
  late Animation<double> animation2;
  late Animation<double> animation3;
  late Animation<double> animation4;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation1 = Tween<double>(begin: .1, end: .15).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller1.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller1.forward();
        }
      });
    animation2 = Tween<double>(begin: .02, end: .04).animate(
      CurvedAnimation(
        parent: controller1,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 5,
      ),
    );
    animation3 = Tween<double>(begin: .41, end: .38).animate(CurvedAnimation(
      parent: controller2,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller2.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller2.forward();
        }
      });
    animation4 = Tween<double>(begin: 170, end: 190).animate(
      CurvedAnimation(
        parent: controller2,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });

    Timer(const Duration(milliseconds: 2500), () {
      controller1.forward();
    });

    controller2.forward();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-1, -1),
          end: const Alignment(1.7, .5),
          colors: Palette.loginBackgroundGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Palette.transparent,
        body: ScrollConfiguration(
          behavior: MyBehavior(),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (() {
              FocusScope.of(context).unfocus();
            }),
            child: SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Stack(
                  children: [
                    Positioned(
                      top: size.height * (animation2.value + .58),
                      left: size.width * .21,
                      child: CustomPaint(
                        painter: MyPainter(50),
                      ),
                    ),
                    Positioned(
                      top: size.height * .98,
                      left: size.width * .1,
                      child: CustomPaint(
                        painter: MyPainter(animation4.value - 30),
                      ),
                    ),
                    Positioned(
                      top: size.height * .5,
                      left: size.width * (animation2.value + .8),
                      child: CustomPaint(
                        painter: MyPainter(30),
                      ),
                    ),
                    Positioned(
                      top: size.height * animation3.value,
                      left: size.width * (animation1.value + .1),
                      child: CustomPaint(
                        painter: MyPainter(60),
                      ),
                    ),
                    Positioned(
                      top: size.height * .1,
                      left: size.width * .8,
                      child: CustomPaint(
                        painter: MyPainter(animation4.value),
                      ),
                    ),
                    Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * .1),
                            child: Text(
                              'Tickets|ON',
                              style: TextStyle(
                                color: Palette.white.withOpacity(.7),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                wordSpacing: 4,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              component1(Icons.email_outlined, 'Email...',
                                  false, true),
                              component1(Icons.lock_outline, 'Password...',
                                  true, false),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    buttonText: 'LOGIN',
                                    width: 2.58,
                                    voidCallback: () {
                                      HapticFeedback.lightImpact();
                                    },
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                  SizedBox(width: size.width / 20),
                                  CustomButton(
                                    buttonText: 'Forgotten password!',
                                    width: 2.58,
                                    voidCallback: () {
                                      HapticFeedback.lightImpact();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                buttonText: 'Create a new Account',
                                width: 2,
                                voidCallback: () {
                                  HapticFeedback.lightImpact();
                                },
                              ),
                              SizedBox(height: size.height * .05),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget component1(
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 8,
          width: size.width / 1.2,
          alignment: Alignment.center,
          padding: EdgeInsets.only(right: size.width / 30),
          decoration: BoxDecoration(
            color: Palette.primaryColor.withOpacity(.6),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: isEmail ? _emailController : _passwordController,
            style: TextStyle(color: Palette.white.withOpacity(.8)),
            cursorColor: Palette.white,
            obscureText: isPassword,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: Palette.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(.5),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double radius;

  MyPainter(this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
              colors: Palette.loginAnimationGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)
          .createShader(Rect.fromCircle(
        center: const Offset(0, 0),
        radius: radius,
      ));

    canvas.drawCircle(Offset.zero, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
