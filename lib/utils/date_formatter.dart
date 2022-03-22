import 'package:intl/intl.dart';

class DateFormatter {
  /// this function takes (oldFormat, oldDate, newFormat) and returns a new formatted date string.
  static String formatStringDate(
      String oldFormat, String oldDate, String newFormat) {
    var oldFormatter = DateFormat(oldFormat);
    var newFormatter = DateFormat(newFormat);

    return newFormatter.format(oldFormatter.parse(oldDate));
  }

  /// this function will return difference in seconds.
  static int calculateTimeBetweenTwoDates(
      DateTime startdate, DateTime endDate) {
    return endDate.difference(startdate).inSeconds;
  }
}
