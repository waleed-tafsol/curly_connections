import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/enums.dart';
import 'base_view_model.dart';

class AuthViewModel extends BaseViewModel<UserType> {
  AuthViewModel._() : super(UserType.stylist);

  void setUserType(UserType userType) {
    state = userType;
  }
}

final authProvider = NotifierProvider(() => AuthViewModel._());
