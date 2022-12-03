import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ticketson/config/themes/palette.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.walletNameController,
  });
  final TextEditingController walletNameController;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
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
            controller: widget.walletNameController,
            style: TextStyle(color: Palette.white.withOpacity(.8)),
            cursorColor: Palette.white,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              prefixIcon: Icon(
                Icons.wallet_rounded,
                color: Palette.white.withOpacity(.7),
              ),
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: 'Wallet Name',
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
