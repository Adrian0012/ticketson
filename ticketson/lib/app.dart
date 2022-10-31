import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ticketson/config/router.dart';
import 'package:ticketson/config/themes/themes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Repositories
    // AuthenticationRepository authRepository = AuthenticationRepository();
    // UserRepository userRepository = UserRepository();

    // return MultiRepositoryProvider(
    //   providers: [
    //     RepositoryProvider.value(value: authRepository),
    //     RepositoryProvider.value(value: userRepository),
    //   ],
    //   child: MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //         create: (_) => AuthenticationBloc(
    //           authenticationRepository: authRepository,
    //           userRepository: userRepository,
    //         ),
    //       ),
    //     ],
    //     child: const AppView(),
    //   ),
    // );
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routerDelegate = AppRouter.routerDelegate;
    // return BeamerProvider(
    //   routerDelegate: routerDelegate,
    //   child: BlocListener<AuthenticationBloc, AuthenticationState>(
    //     listener: (context, state) {
    //       routerDelegate.update();
    //     },
    //     child: MaterialApp.router(
    //       scaffoldMessengerKey: AppRouter.scaffoldMessengerKey,
    //       routeInformationParser: BeamerParser(),
    //       routerDelegate: routerDelegate,
    //       backButtonDispatcher: BeamerBackButtonDispatcher(
    //         delegate: routerDelegate,
    //       ),
    //       theme: Themes.primaryTheme,
    //     ),
    //   ),
    // );
    return MaterialApp.router(
      scaffoldMessengerKey: AppRouter.scaffoldMessengerKey,
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
      theme: Themes.primaryTheme,
    );
  }
}
