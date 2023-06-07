import 'package:intl/intl.dart';

String currency(var number) {
  var numberFormat = NumberFormat.currency(locale: 'ID', symbol: 'Rp');
  return numberFormat.format(number);
}
