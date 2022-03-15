import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:my_aueb/core/custom_data_types/time.dart';

class ScheduleEntity extends Equatable {
  final int id;
  final Time startTime;
  final Time endTime;
  final String room;
  final int dayValue;
  final int scheduleTypeValue;

  const ScheduleEntity({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.room,
    required this.dayValue,
    required this.scheduleTypeValue,
  });

  ScheduleEntity copyWith({
    int? id,
    Time? startTime,
    Time? endTime,
    String? room,
    int? dayValue,
    int? scheduleTypeValue,
  }) {
    return ScheduleEntity(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      room: room ?? this.room,
      dayValue: dayValue ?? this.dayValue,
      scheduleTypeValue: scheduleTypeValue ?? this.scheduleTypeValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'startTime': startTime.toMap(),
      'endTime': endTime.toMap(),
      'room': room,
      'dayValue': dayValue,
      'scheduleTypeValue': scheduleTypeValue,
    };
  }

  factory ScheduleEntity.fromMap(Map<String, dynamic> map) {
    return ScheduleEntity(
      id: map['id']?.toInt() ?? 0,
      startTime: Time.fromMap(map['startTime']),
      endTime: Time.fromMap(map['endTime']),
      room: map['room'] ?? '',
      dayValue: map['dayValue']?.toInt() ?? 0,
      scheduleTypeValue: map['scheduleTypeValue']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleEntity.fromJson(String source) => ScheduleEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Schedule(id: $id, startTime: $startTime, endTime: $endTime, room: $room, dayValue: $dayValue, scheduleTypeValue: $scheduleTypeValue)';
  }

  @override
  List<Object> get props {
    return [
      id,
      startTime,
      endTime,
      room,
      dayValue,
      scheduleTypeValue,
    ];
  }
}
