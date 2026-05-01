import 'package:curly_connection/ui/pages/splash_page.dart';
import 'package:flutter/cupertino.dart';

abstract final class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> routes(RouteSettings settings) {
    return switch (settings.name) {
      SplashPage.routeName => CupertinoPageRoute(builder: (_) => SplashPage()),
      null => throw UnimplementedError(),
      String() => throw UnimplementedError(),
    };
  }
}
