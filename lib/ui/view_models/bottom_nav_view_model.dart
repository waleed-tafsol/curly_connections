import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../models/ui/bottom_bar_item.dart';
import '../../utils/enums.dart';
import 'base_view_model.dart';

class BottomNavViewModel extends BaseViewModel {
  int currentPage = 0;
  static const List<BottomBarItem> _customerItems = [
    BottomBarItem(icon: TablerIcons.home, title: 'Home'),
    BottomBarItem(icon: TablerIcons.scissors, title: 'My Bookings'),
    BottomBarItem(icon: TablerIcons.calendarWeek, title: 'Calendar'),
    BottomBarItem(icon: TablerIcons.user, title: 'Profile'),
  ];
  static const List<BottomBarItem> _stylistItems = [
    BottomBarItem(icon: TablerIcons.home, title: 'Home'),
    BottomBarItem(icon: TablerIcons.scissors, title: 'My Bookings'),
    BottomBarItem(icon: TablerIcons.calendarWeek, title: 'Calendar'),
    BottomBarItem(icon: TablerIcons.user, title: 'Profile'),
  ];

  List<BottomBarItem> getBottomBarItems(UserType userType) {
    return switch (userType) {
      UserType.stylist => _stylistItems,
      UserType.client => _customerItems,
    };
  }

  void setCurrentPage(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}
