import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/widgets/bottom_navbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
        body: Container(
          child: Text('Ello'),
        ),
        bottomNavigationBar: const Navbar(selectedIndex: 1),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: const Icon(Icons.home),
            onPressed: () {
              Beamer.of(context).beamToNamed(Routes.dashboard);
            },
          ),
        ));
  }
}
