import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:random_number_generator/navigation/_navigation.dart';
import 'package:random_number_generator/pages/_pages.dart';
import 'package:random_number_generator/shared/_shared.dart';

class RouterEndpoint {
  static const welcome = '/welcome';
}

final router = GoRouter(
  observers: navigatorObservers,
  navigatorKey: navigatorKey,
  redirectLimit: 5,
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) async => await GetIt.I<SetupNavigator>().redirection$(),
    ),
    GoRoute(
      path: RouterEndpoint.welcome,
      builder: (context, state) => const WelcomePage(),
    ),
  ],
);
