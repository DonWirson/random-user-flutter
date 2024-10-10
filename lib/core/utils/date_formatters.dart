import 'package:intl/intl.dart';

class DateFormatters {
  static String DDMMyyyFormat(DateTime dateTime) {
    return DateFormat("dd-MM-yyyy").format(dateTime);
  }
}
