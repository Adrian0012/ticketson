// import 'package:beamer/beamer.dart';
// import 'package:flutter/material.dart';
// import 'package:ticketson/config/themes/palette.dart';
// import 'package:ticketson/config/urls.dart';

// class CustomBottomNavbar extends StatefulWidget {
//   const CustomBottomNavbar({Key? key, required this.selectedIndex})
//       : super(key: key);
//   final int selectedIndex;

//   @override
//   State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
// }

// class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
//   @override
//   Widget build(BuildContext context) {
//     // todo add spining icons when chlicked
//     // check app
//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 4.0,
//       clipBehavior: Clip.antiAlias,
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.shifting,
//         currentIndex: widget.selectedIndex,
//         selectedItemColor: Colors.black,
//         unselectedFontSize: 14.0,
//         unselectedItemColor: Palette.secondaryColor,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             backgroundColor: Palette.primaryColor,
//             icon: Icon(
//               size: 25.0,
//               Icons.notifications,
//               color: Palette.accentColor,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//               backgroundColor: Palette.primaryColor,
//               icon: Icon(
//                 Icons.home,
//                 color: Colors.transparent,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//             backgroundColor: Palette.primaryColor,
//             icon: Icon(
//               size: 25.0,
//               Icons.settings,
//               color: Palette.accentColor,
//             ),
//             label: '',
//           )
//         ],
//         onTap: (index) {
//           if (index == 0) {
//             Beamer.of(context).beamToNamed(Routes.wallets);
//           } else if (index == 2) {
//             Beamer.of(context).beamToNamed(Routes.account);
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ticketson/config/themes/palette.dart';
import 'package:ticketson/constants/navbar_enum.dart';

import '../config/urls.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({
    Key? key,
    required this.selectedIndex,
    required this.navbarLocation,
  }) : super(key: key);
  final int selectedIndex;
  final String navbarLocation;

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    currentIndex = widget.selectedIndex;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      height: screenWidth * .155,
      decoration: BoxDecoration(
        color: Palette.primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.15),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
      ),
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: screenWidth * 0.10,
        ),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              HapticFeedback.lightImpact();
            });
            if (index == 0) {
              Beamer.of(context).beamToNamed(Routes.wallets);
            } else if (index == 1) {
              if (widget.navbarLocation == NavbarStatus.wallets.name) {
                Beamer.of(context).beamToNamed(Routes.createWalletForm);
              } else if (widget.navbarLocation == NavbarStatus.tickets.name) {
                // Beamer.of(context).beamToNamed(Routes.createTicketForm);
              } else if (widget.navbarLocation == NavbarStatus.account.name) {
                Beamer.of(context).beamToNamed(Routes.wallets);
              }
            } else if (index == 2) {
              Beamer.of(context).beamToNamed(Routes.account);
            }
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Stack(
            children: [
              SizedBox(
                width: screenWidth * .2125,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? screenWidth * .12 : 0,
                    width: index == currentIndex ? screenWidth * .2125 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Palette.accentColor.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth * .2125,
                alignment: Alignment.center,
                child: Icon(
                  widget.navbarLocation == NavbarStatus.account.name
                      ? accountListOfIcons[index]
                      : baseListOfIcons[index],
                  size: screenWidth * .076,
                  color: index == currentIndex ? Palette.white : Colors.black26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<IconData> baseListOfIcons = [
    Icons.dashboard_rounded,
    Icons.add_box_rounded,
    Icons.person_rounded,
  ];

  List<IconData> accountListOfIcons = [
    Icons.dashboard_rounded,
    Icons.home_rounded,
    Icons.person_rounded,
  ];
}
