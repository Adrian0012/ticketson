import 'package:flutter/material.dart';
import 'package:ticketson/config/themes/palette.dart';

class CustomSnackbar {
  static void showErrorMessage(BuildContext context, String? error) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            '$error',
            style: const TextStyle(
              color: Palette.accentColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Palette.primaryColor,
        ),
      );
  }

  static void showPrimaryMessage(BuildContext context, String message,
      {VoidCallback? onClose}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
              content: Text(
                message,
                style: const TextStyle(
                  color: Palette.accentColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: Palette.primaryColor))
          .closed
          .then((value) => null != onClose ? onClose() : null);
  }

  static void showSecondaryMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              color: Palette.accentColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Palette.primaryColor));
  }
}
