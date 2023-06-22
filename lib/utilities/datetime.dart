import 'package:intl/intl.dart';

String dateFormat = 'dd MMM yyyy';
String timeFormat = 'HH:mm';

DateTime now = DateTime.now();

String getCurrentTime() {
  return DateFormat(timeFormat).format(now);
}

String getTodayDate() {
  return DateFormat(dateFormat).format(now);
}

String getYesterdayDate() {
  DateTime yesterday = now.subtract(const Duration(days: 1));
  return DateFormat(dateFormat).format(yesterday);
}
