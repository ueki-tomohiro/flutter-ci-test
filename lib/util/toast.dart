import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ci_test/model/toast_message.dart';

class Toast {
  static debug(ToastMessage notification) {
    BotToast.showText(
      text: notification.toString(),
      contentColor: const Color.fromRGBO(51, 153, 68, 0.08),
      textStyle: const TextStyle(fontSize: 14, color: Color.fromRGBO(51, 153, 68, 1),),
    );
  }

  static error(ToastMessage notification) {
    BotToast.showText(
      text: notification.toString(),
      contentColor: const Color.fromRGBO(238, 68, 119, 0.08),
      textStyle: const TextStyle(fontSize: 14, color: Color.fromRGBO(238, 51, 51, 1),),
    );
  }
  static notice(ToastMessage notification) {
    BotToast.showText(
      text: notification.toString(),
      contentColor: const Color.fromRGBO(119, 136, 170, 0.08),
      textStyle: const TextStyle(fontSize: 14, color:  Color.fromRGBO(0, 0, 0, 1),),
    );
  }
}