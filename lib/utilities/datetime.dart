import 'package:intl/intl.dart';

String dateFormat = 'dd MMM yyyy';
String timeFormat = 'HH:mm';

DateTime now = DateTime.now();

String stringifyDate(DateTime date) {
  return DateFormat(dateFormat).format(date);
}

DateTime parseDate(String date) {
  return DateFormat(dateFormat).parse(date);
}

String getCurrentTime() {
  return DateFormat(timeFormat).format(now);
}

String getTodayDate() {
  return DateFormat(dateFormat).format(now);
}

String getPreviousDate(int ndays) {
  DateTime yesterday = now.subtract(Duration(days: ndays));
  return DateFormat(dateFormat).format(yesterday);
}
