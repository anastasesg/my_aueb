import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:my_aueb/core/custom_data_types/day.dart';
import 'package:my_aueb/core/custom_data_types/schedule_type.dart';
import 'package:my_aueb/core/custom_data_types/time.dart';

class Schedule extends Equatable {
  final int id;
  final Time startTime;
  final Time endTime;
  final String room;
  final Day day;
  final ScheduleType scheduleType;

  const Schedule({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.room,
    required this.day,
    required this.scheduleType,
  });

  Schedule copyWith({
    int? id,
    Time? startTime,
    Time? endTime,
    String? room,
    Day? day,
    ScheduleType? scheduleType,
  }) {
    return Schedule(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      room: room ?? this.room,
      day: day ?? this.day,
      scheduleType: scheduleType ?? this.scheduleType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'startTime': startTime.toMap(),
      'endTime': endTime.toMap(),
      'room': room,
      'day': day.toInt(),
      'scheduleType': scheduleType.toMap(),
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      id: map['id']?.toInt() ?? 0,
      startTime: Time.fromMap(map['startTime']),
      endTime: Time.fromMap(map['endTime']),
      room: map['room'] ?? '',
      day: Day.Undefined.fromInt(map['day']),
      scheduleType: ScheduleType.fromMap(map['scheduleType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) => Schedule.fromMap(json.decode(source));

  @override
  String toString() {
    return "$startTime - $endTime";
  }

  String getRoom() {
    if (room.split(' ').length < 2) {
      return room;
    } else {
      return "${room.split(' ')[0].substring(0, 3)}. ${room.split(' ')[1].substring(0, 4)}.";
    }
  }

  @override
  List<Object> get props {
    return [
      id,
      startTime,
      endTime,
      room,
      day,
      scheduleType,
    ];
  }
}
