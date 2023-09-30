 import 'package:intl/intl.dart';


class Utils {
  static String getFormattedDateSimple(int time) {
    DateFormat newFormat = DateFormat("dd / MMMM, yyyy");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }
}
