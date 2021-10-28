import 'package:clock/clock.dart';
import 'package:flutter_ci_test/util/date_util.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('calcAge', () {
    withClock(Clock.fixed(DateTime.parse("2020-11-10T11:00:00+09:00")), () {
      expect(DateUtil.calcAge(DateTime.utc(1999, 11, 1)), 21);
    });
  });

  test('formatBirthDay', () {
    withClock(Clock.fixed(DateTime.parse("2020-11-10T11:00:00+09:00")), () {
      expect(DateUtil.formatBirthDay(DateTime.utc(1999, 11, 1)), "1999/11/1");
    });
  });
}
