import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../ui/pages/bottom_nav_page.dart';
import '../ui/pages/chip_screen.dart';
import '../ui/pages/splash_page.dart';
import '../ui/view_models/bottom_nav_view_model.dart';

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
      BottomNavPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: BottomNavPage.routeName),
        builder: (_) => ChangeNotifierProvider(
          create: (_) => BottomNavViewModel(),
          child: const BottomNavPage(),
        ),
      ),
      null => throw UnimplementedError(),
      String() => throw UnimplementedError(),
    };
  }
}
