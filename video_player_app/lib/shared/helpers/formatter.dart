import 'package:intl/intl.dart';

class Formatter {
  static String humanReadableNumberFormatter(double number) {
    final numberFormat = NumberFormat.compactCurrency(decimalDigits: 0, symbol: '').format(number);
    return numberFormat;
  }
}
