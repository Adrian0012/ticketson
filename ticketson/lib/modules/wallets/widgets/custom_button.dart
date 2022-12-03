import 'dart:ui';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/common_widgets/snackbar.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/config/urls.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    required this.width,
    required this.voidCallback,
    required this.formKey,
    required this.walletName,
    this.walletType,
  });
  final String buttonText;
  final double width;
  final VoidCallback voidCallback;
  final GlobalKey<FormState> formKey;
  final TextEditingController walletName;
  final String? walletType;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            if (widget.formKey.currentState!.validate()) {
              if (widget.walletName.text.isEmpty) {
                CustomSnackbar.showErrorMessage(
                    context, 'Please add a Wallet Name!');
              } else if (widget.walletType == null) {
                CustomSnackbar.showErrorMessage(
                    context, 'Please select a Wallet Type!');
              } else {
                CustomSnackbar.showPrimaryMessage(
                    context, 'Wallet has been successfully created!');
                Beamer.of(context).beamToNamed(Routes.wallets);
              }
            }
          },
          child: Container(
            height: size.width / 8,
            width: size.width / widget.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Palette.primaryColor.withOpacity(.6),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: Palette.white.withOpacity(.8),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
