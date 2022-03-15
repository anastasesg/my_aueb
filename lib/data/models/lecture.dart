import 'dart:convert';

import 'package:my_aueb/core/custom_data_types/day.dart';
import 'package:my_aueb/core/extensions/int_extensions.dart';
import 'package:equatable/equatable.dart';

import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/data/models/schedule.dart';

class Lecture extends Equatable {
  final int id;
  final Course course;
  final Schedule schedule;

  const Lecture({
    required this.id,
    required this.course,
    required this.schedule,
  });

  Lecture copyWith({
    int? id,
    Course? course,
    Schedule? schedule,
  }) {
    return Lecture(
      id: id ?? this.id,
      course: course ?? this.course,
      schedule: schedule ?? this.schedule,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'course': course.toMap(),
      'schedule': schedule.toMap(),
    };
  }

  factory Lecture.fromMap(Map<String, dynamic> map) {
    return Lecture(
      id: map['id']?.toInt() ?? 0,
      course: Course.fromMap(map['course']),
      schedule: Schedule.fromMap(map['schedule']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Lecture.fromJson(String source) => Lecture.fromMap(json.decode(source));

  @override
  String toString() => 'Lecture(id: $id, course: $course, schedule: $schedule)';

  @override
  List<Object> get props => [id, course, schedule];

  DateTime getStartTime() {
    return DateTime(
      course.semester.startDate.year,
      course.semester.startDate.month,
      course.semester.startDate.day,
      schedule.startTime.hour,
      schedule.startTime.minute,
    );
  }

  DateTime getEndTime() {
    return DateTime(
      course.semester.startDate.year,
      course.semester.startDate.month,
      course.semester.startDate.day,
      schedule.endTime.hour,
      schedule.endTime.minute,
    );
  }

  String getSubject() {
    if (schedule.scheduleType.toInt() == 1) {
      return "${course.subject.name}\n\n${schedule.room}";
    } else if (schedule.scheduleType.toInt() == 2) {
      return "Φρ. ${course.subject.name}\n\n${schedule.room}";
    } else {
      return "";
    }
  }

  String getRecurrenceRule() {
    return "FREQ=WEEKLY;BYDAY=${schedule.day.getByDay()};UNTIL=${course.semester.endDate.year}${course.semester.endDate.month.twoDigits()}${course.semester.endDate.day.twoDigits()}";
  }
}
