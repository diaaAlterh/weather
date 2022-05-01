import 'package:intl/intl.dart';

class Utils {
  /// here is functions frequently used
  String format(String format, DateTime? dateTime) {
    try {
      return DateFormat(format).format(dateTime!);
    } catch (e) {
      return '';
    }
  }
}

Utils utils = Utils();
