import 'package:flutter/cupertino.dart';

import '../ui/pages/booking_page.dart';
import '../ui/pages/bottom_nav_page.dart';
import '../ui/pages/calendar_booking_page.dart';
import '../ui/pages/change_password_screen.dart';
import '../ui/pages/chip_screen.dart';
import '../ui/pages/contact_us_screen.dart';
import '../ui/pages/create_account_screen.dart';
import '../ui/pages/edit_profile_screen.dart';
import '../ui/pages/login_screen.dart';
import '../ui/pages/map_explore_page.dart';
import '../ui/pages/onboarding_screen.dart';
import '../ui/pages/portfolio_screen.dart';
import '../ui/pages/review_detail_screen.dart';
import '../ui/pages/review_screen.dart';
import '../ui/pages/salon_page.dart';
import '../ui/pages/select_categories_screen.dart';
import '../ui/pages/select_role_screen.dart';
import '../ui/pages/set_schedule_screen.dart';
import '../ui/pages/splash_page.dart';
import '../ui/pages/subscription_screen.dart';
import '../ui/pages/terms_conditions_screen.dart';
import '../ui/pages/turn_notification_page.dart';

abstract final class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> routes(RouteSettings settings) {
    // final args = settings.arguments;
    return switch (settings.name) {
      SplashScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SplashScreen.routeName),
        builder: (_) => const SplashScreen(),
      ),
      ChipScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: ChipScreen.routeName),
        builder: (_) => const ChipScreen(),
      ),
      BottomNavPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: BottomNavPage.routeName),
        builder: (_) => const BottomNavPage(),
      ),
      SelectRoleScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SelectRoleScreen.routeName),
        builder: (_) => const SelectRoleScreen(),
      ),
      LoginScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: LoginScreen.routeName),
        builder: (_) => const LoginScreen(),
      ),
      CreateAccountScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: CreateAccountScreen.routeName),
        builder: (_) => const CreateAccountScreen(),
      ),
      SubscriptionScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SubscriptionScreen.routeName),
        builder: (_) => const SubscriptionScreen(),
      ),
      MapExplorePage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: MapExplorePage.routeName),
        builder: (_) => const MapExplorePage(),
      ),
      OnboardingScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: OnboardingScreen.routeName),
        builder: (_) => const OnboardingScreen(),
      ),
      PortfolioScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: PortfolioScreen.routeName),
        builder: (_) => const PortfolioScreen(),
      ),
      SelectCategoriesScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SelectCategoriesScreen.routeName),
        builder: (_) => const SelectCategoriesScreen(),
      ),
      SetScheduleScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SetScheduleScreen.routeName),
        builder: (_) => const SetScheduleScreen(),
      ),
      CalendarBookingPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: CalendarBookingPage.routeName),
        builder: (_) => const CalendarBookingPage(),
      ),
      ReviewScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: ReviewScreen.routeName),
        builder: (_) => const ReviewScreen(),
      ),
      TermsConditionsScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: TermsConditionsScreen.routeName),
        builder: (_) => const TermsConditionsScreen(),
      ),
      EditProfileScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: EditProfileScreen.routeName),
        builder: (_) => const EditProfileScreen(),
      ),
      ChangePasswordScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: ChangePasswordScreen.routeName),
        builder: (_) => const ChangePasswordScreen(),
      ),
      SalonPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: SalonPage.routeName),
        builder: (_) => const SalonPage(),
      ),
      BookingPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: BookingPage.routeName),
        builder: (_) => const BookingPage(),
      ),
      ContactUsScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: ContactUsScreen.routeName),
        builder: (_) => const ContactUsScreen(),
      ),
      ReviewDetailScreen.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: ReviewDetailScreen.routeName),
        builder: (_) => const ReviewDetailScreen(),
      ),
      TurnNotificationPage.routeName => CupertinoPageRoute(
        settings: const RouteSettings(name: TurnNotificationPage.routeName),
        builder: (_) => const TurnNotificationPage(),
      ),

      null => throw UnimplementedError(),
      String() => throw UnimplementedError(),
    };
  }
}
