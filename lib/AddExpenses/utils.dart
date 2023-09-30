 import 'package:intl/intl.dart';
import "DateTimePicker.dart";

class Utils {
  static String getFormattedDateSimple(int time) {
    DateFormat newFormat = DateFormat("dd / MMMM, yyyy");
    return newFormat.format(DateTime.fromMillisecondsSinceEpoch(time));
  }
}
