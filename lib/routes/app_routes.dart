import 'package:flutter/cupertino.dart';

import '../ui/pages/chip_screen.dart';
import '../ui/pages/splash_page.dart';

abstract final class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> routes(RouteSettings settings) {
    return switch (settings.name) {
      SplashPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SplashPage.routeName),
        builder: (_) => const SplashPage(),
      ),
      ChipScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: ChipScreen.routeName),
        builder: (_) => const ChipScreen(),
      ),
      null => throw UnimplementedError(),
      String() => throw UnimplementedError(),
    };
  }
}
