import 'package:intl/intl.dart';

class Util {
  static String appId = "yourapikeyhere";

  static String getFormatedDate(DateTime dateTime) {
    return new DateFormat("EEEE, MMM d, y").format(dateTime);
  }
}
