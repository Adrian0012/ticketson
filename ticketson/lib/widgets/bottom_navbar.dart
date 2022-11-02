import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/urls.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key, required this.selectedIndex}) : super(key: key);
  final int selectedIndex;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: widget.selectedIndex,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Account')
          ],
          onTap: (index) {
            if (index == 0) {
              Beamer.of(context).beamToNamed(Routes.dashboard);
            } else if (index == 2) {
              Beamer.of(context).beamToNamed(Routes.dashboard);
            }
          },
        ),
      ),
    );
  }
}
