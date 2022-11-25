import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/common_widgets/bottom_navbar.dart';
import 'package:ticketson/config/themes/custom_images.dart';
import 'package:ticketson/config/themes/palette.dart';

class ViewAccountScreen extends StatefulWidget {
  const ViewAccountScreen({super.key});

  @override
  State<ViewAccountScreen> createState() => _ViewAccountStateScreen();
}

class _ViewAccountStateScreen extends State<ViewAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: CustomImages.background,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            iconSize: 25.0,
            color: Palette.secondaryColor,
            onPressed: () {
              Beamer.of(context).beamBack();
            },
          ),
          title: const Text(
            'Account',
            style: TextStyle(
              color: Palette.secondaryColor,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Palette.primaryColor,
        ),
        backgroundColor: Palette.transparent,
        body: Container(child: Text('Account')),
        bottomNavigationBar: const CustomBottomNavbar(selectedIndex: 2),
      ),
    );
  }
}
