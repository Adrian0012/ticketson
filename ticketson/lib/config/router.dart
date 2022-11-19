import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/urls.dart';
import 'package:ticketson/modules/tickets/location.dart';
import 'package:ticketson/modules/wallets/forms/create_wallet/location.dart';
import 'package:ticketson/modules/wallets/location.dart';

class AppRouter {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  static BuildContext get context => scaffoldMessengerKey.currentState!.context;

  static final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        DashboardLocation(),
        TicketLocation(),
        CreateWalletLocation(),
      ],
    ),
    // guards: [
    //   BeamGuard(
    //     pathPatterns: [
    //       '${Routes.login}*',
    //     ],
    //     check: (context, state) =>
    //         !context.read<AuthenticationBloc>().isAuthenticated,
    //     beamToNamed: (origin, target) => Routes.intro,
    //   ),
    //   BeamGuard(
    //     pathPatterns: [
    //       '${Routes.intro}*',
    //       '${Routes.account}*',
    //       '${Routes.dashboard}*',
    //       '${Routes.stats}*',
    //     ],
    //     check: (context, state) =>
    //         context.read<AuthenticationBloc>().isAuthenticated,
    //     beamToNamed: (origin, target) => Routes.login,
    //   ),
    // ],
    initialPath: Routes.dashboard,
  );
}
