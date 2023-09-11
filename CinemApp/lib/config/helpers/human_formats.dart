import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    final formatNumber = NumberFormat.compactCurrency(
        decimalDigits: 0, symbol: '', locale: 'en');

    return formatNumber.format(number);
  }
}
