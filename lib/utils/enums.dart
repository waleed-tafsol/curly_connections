import 'package:flutter/material.dart';

import '../ui/resources/app_colors.dart';

enum BaseUrl {
  production(''),
  staging('');

  final String url;

  const BaseUrl(this.url);
}

enum UserType { stylist, client }

enum ServiceRequest {
  bookingRequest,
  reschedulingRequest,
  cancellationRequest;

  String get label {
    switch (this) {
      case ServiceRequest.bookingRequest:
        return 'Booking Request';
      case ServiceRequest.reschedulingRequest:
        return 'Rescheduling Request';
      case ServiceRequest.cancellationRequest:
        return 'Cancellation Request';
    }
  }
}

enum Status {
  booked,
  pending,
  confirmed,
  completed,
  canceled;

  String get label {
    switch (this) {
      case Status.booked:
        return '• Booked';
      case Status.pending:
        return '• Pending';
      case Status.canceled:
        return '• Canceled';
      case Status.confirmed:
        return '• Confirmed';
        case Status.completed:
        return '• Completed';
    }
  }

  Color get color {
    switch (this) {
      case Status.booked:
        return AppColors.textYellow;

      case Status.pending:
        return AppColors.textYellow;
      case Status.canceled:
        return AppColors.darkGrey;
      case Status.confirmed:
        return AppColors.greenColor;
        case Status.completed:
        return AppColors.greenColor;
    }
  }
}

enum Endpoint {
  login('/login');

  final String value;

  const Endpoint(this.value);
}
