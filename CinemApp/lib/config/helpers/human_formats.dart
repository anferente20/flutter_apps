import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number, [int decimals = 0]) {
    final formatNumber =
        NumberFormat.compactCurrency(decimalDigits: decimals, symbol: '', locale: 'en');

    return formatNumber.format(number);
  }

  static String shortDate(DateTime date, String locale) {
    final format = DateFormat.yMMMEd(locale);
    return format.format(date);
  }
}
