import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../ui/pages/chip_screen.dart';
import '../ui/pages/customer_bottom_nav_page.dart';
import '../ui/pages/get_started_screen.dart';
import '../ui/pages/select_role_screen.dart';
import '../ui/pages/splash_page.dart';
import '../ui/view_models/bottom_nav_view_model.dart';

abstract final class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> routes(RouteSettings settings) {
    return switch (settings.name) {
      SplashScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SplashScreen.routeName),
        builder: (_) => const SplashScreen(),
      ),
      ChipScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: ChipScreen.routeName),
        builder: (_) => const ChipScreen(),
      ),
      GetStartedScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: GetStartedScreen.routeName),
        builder: (_) => const GetStartedScreen(),
      ),
      SelectRoleScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SelectRoleScreen.routeName),
        builder: (_) => const SelectRoleScreen(),
      ),
      CustomerBottomNavPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: CustomerBottomNavPage.routeName),
        builder: (_) => ChangeNotifierProvider(
          create: (_) => BottomNavViewModel(),
          child: const CustomerBottomNavPage(),
        ),
      ),
      null => throw UnimplementedError(),
      String() => throw UnimplementedError(),
    };
  }
}
