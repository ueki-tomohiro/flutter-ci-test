import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ci_test/model/counseling.dart';
import 'package:flutter_ci_test/widget/list_item.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

final counseling = Counseling(
  date: DateTime.parse("2021-11-10T11:30:00+09:00"),
  id: 1,
  patient: Patient(
    id: 1,
    name: "患者太郎",
    birthday: DateTime.parse("2000-11-01T11:00:00+09:00"),
  ),
  requestedDate: DateTime.parse("2021-11-10T11:00:00+09:00"),
);

void main() {
  testWidgets('ListItem test', (WidgetTester tester) async {
    withClock(Clock.fixed(DateTime.parse("2020-11-10T11:00:00+09:00")),
        () async {
      await tester.pumpWidget(
        MaterialApp(
          title: "",
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ja', 'JP'),
          ],
          home: Scaffold(
            body: ListItem(counseling),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('患者太郎'), findsOneWidget);
      expect(find.text('相談・2000/11/1生まれ・21歳'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.print));
      await tester.pump();
    });
  });
}
