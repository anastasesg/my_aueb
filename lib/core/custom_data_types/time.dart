import 'package:my_aueb/core/extensions/int_extensions.dart';
import 'package:flutter/material.dart';

class Time extends TimeOfDay {
  const Time({required int hour, required int minute}) : super(hour: hour, minute: minute);
  Time.fromDateTime(DateTime time) : super.fromDateTime(time);

  Map<String, int> toMap() {
    return {
      'hour': hour,
      'minute': minute,
    };
  }

  factory Time.fromMap(int mapValue) {
    return Time(hour: mapValue ~/ 3600, minute: (mapValue % 3600) ~/ 60);
  }

  @override
  String toString() {
    return "${hour.twoDigits()}:${minute.twoDigits()}";
  }
}
