 import 'package:intl/intl.dart';


class Utils {
  static String getFormattedDateSimple(int time) {
    DateFormat newFormat = DateFormat("yyyy - MM - dd");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }
}
