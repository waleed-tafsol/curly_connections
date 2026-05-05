import 'package:flutter/material.dart';

import '../ui/resources/app_colors.dart';

enum BaseUrl {
  production(''),
  staging('');

  final String url;

  const BaseUrl(this.url);
}

enum UserType { stylist, client }

enum Status {
  pending,
  confirmed,
  canceled;

  String get label {
    switch (this) {
      case Status.pending:
        return '• Pending';
      case Status.canceled:
        return '• Canceled';
      case Status.confirmed:
        return '• Confirmed';
    }
  }

  Color get color {
    switch (this) {
      case Status.pending:
        return AppColors.textYellow;
      case Status.canceled:
        return AppColors.darkGrey;
      case Status.confirmed:
        return AppColors.greenColor;
    }
  }
}

enum Endpoint {
  login('/login');

  final String value;

  const Endpoint(this.value);
}
