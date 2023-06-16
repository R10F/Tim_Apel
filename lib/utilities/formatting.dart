import 'package:intl/intl.dart';

var currencyFormat = NumberFormat.currency(locale: 'ID', symbol: 'Rp');

String currency(var number) {
  return currencyFormat.format(number);
}
