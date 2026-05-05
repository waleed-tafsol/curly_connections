import '../../utils/enums.dart';
import 'base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  UserType userType = UserType.stylist;

  void setUserType(UserType userType) {
    this.userType = userType;
    notifyListeners();
  }
}
