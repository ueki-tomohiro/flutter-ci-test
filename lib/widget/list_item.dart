// Dart imports:

// Package imports:
import 'package:date_time_format/date_time_format.dart';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ci_test/model/counseling.dart';
import 'package:flutter_ci_test/util/date_util.dart';
import 'package:intl/intl.dart';

class ListItem extends StatelessWidget {
  final Counseling counseling;

  const ListItem(this.counseling, {Key? key}) : super(key: key);

  void _tapCounselingPrint(BuildContext context) {}

  void _moveCounselingDetail(BuildContext context) {}

  List<Widget> _reserveDate(Counseling counseling) {
    final date = counseling.date ?? counseling.requestedDate;
    return _dateToWidget(date);
  }

  List<Widget> _dateToWidget(DateTime date) {
    final localDate = date.toLocal();
    return [
      Text(
        "${localDate.format('n月j日')}(${DateFormat.E('ja').format(localDate)})",
      ),
      Text(
        localDate.format("H:i"),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _moveCounselingDetail(context),
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Color.fromRGBO(0, 0, 0, 0.12),
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 120,
              child: Column(
                children: _dateToWidget(counseling.requestedDate),
              ),
            ),
            SizedBox(
              width: 120,
              child: Column(
                children: _reserveDate(counseling),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        Text(
                          counseling.patient.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Text(
                          "様",
                          style: TextStyle(
                              color: Color.fromRGBO(119, 136, 170, 1)),
                        )
                      ]),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '相談・${DateUtil.formatBirthDay(counseling.patient.birthday)}生まれ・${DateUtil.calcAge(counseling.patient.birthday)}歳',
                        style: const TextStyle(
                            color: Color.fromRGBO(119, 136, 170, 1)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 60,
              child: IconButton(
                onPressed: () => _tapCounselingPrint(context),
                icon: const Icon(Icons.print),
                tooltip: "印刷",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
