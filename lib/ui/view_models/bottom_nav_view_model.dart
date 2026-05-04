import 'base_view_model.dart';

class BottomNavViewModel extends BaseViewModel {
  int currentPage = 0;

  void setCurrentPage(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}
