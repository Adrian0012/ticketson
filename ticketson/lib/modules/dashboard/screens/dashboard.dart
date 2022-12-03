import 'package:flutter/material.dart';
import 'package:ticketson/common_widgets/bottom_navbar.dart';
import 'package:ticketson/common_widgets/work_in_progress.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/constants/navbar_enum.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const Alignment(-1, -1),
          end: const Alignment(1.7, .5),
          colors: Palette.baseGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Palette.transparent,
        body: const WorkInProgress(),
        bottomNavigationBar: CustomBottomNavbar(
          selectedIndex: 0,
          navbarLocation: NavbarStatus.dashboard.name,
        ),
      ),
    );
  }
}
