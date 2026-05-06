import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String get longMonth {
    return DateFormat('MMMM').format(this);
  }

  String get shortWeekDay {
    return DateFormat('EEE').format(this);
  }
}
