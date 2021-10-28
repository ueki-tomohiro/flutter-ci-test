import 'package:flutter/foundation.dart';

class ToastMessage {
  final String title;
  final String message;

  ToastMessage({this.title = "", this.message = ""});

  @override
  String toString() {
    return "$title: $message";
  }
}

