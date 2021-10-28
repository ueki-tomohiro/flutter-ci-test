// Package imports:
import 'package:date_time_format/date_time_format.dart';

class DateUtil {
 static String formatBirthDay(DateTime birthday) {
    return birthday.toLocal().format('Y/n/j');
  }

  static int calcAge(DateTime birthday) {
    final birthDate = birthday.toLocal();
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age < 0 ? 0 : age;
  }
}
