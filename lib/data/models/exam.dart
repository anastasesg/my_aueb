import 'dart:convert';

import 'package:my_aueb/data/models/schedule.dart';
import 'package:my_aueb/data/models/semester.dart';
import 'package:my_aueb/data/models/subject.dart';
import 'package:equatable/equatable.dart';

import 'package:my_aueb/core/custom_data_types/exam_period.dart';
import 'package:my_aueb/core/extensions/int_extensions.dart';

class Exam extends Equatable {
  final int id;
  final DateTime date;
  final double? score;
  final Subject subject;
  final Schedule schedule;
  final Semester semester;
  final ExamPeriod period;

  const Exam({
    required this.id,
    required this.date,
    this.score,
    required this.subject,
    required this.schedule,
    required this.semester,
    required this.period,
  });

  Exam copyWith({
    int? id,
    DateTime? date,
    double? score,
    Subject? subject,
    Schedule? schedule,
    Semester? semester,
    ExamPeriod? period,
  }) {
    return Exam(
      id: id ?? this.id,
      date: date ?? this.date,
      score: score ?? this.score,
      subject: subject ?? this.subject,
      schedule: schedule ?? this.schedule,
      semester: semester ?? this.semester,
      period: period ?? this.period,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'score': score,
      'subject': subject.toMap(),
      'schedule': schedule.toMap(),
      'semester': semester.toMap(),
      'period': period.toMap(),
    };
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      id: map['id']?.toInt() ?? 0,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      score: map['score']?.toDouble(),
      subject: Subject.fromMap(map['subject']),
      schedule: Schedule.fromMap(map['schedule']),
      semester: Semester.fromMap(map['semester']),
      period: ExamPeriod.fromMap(map['period']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Exam.fromJson(String source) => Exam.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Exam(id: $id, date: $date, score: $score, subject: $subject, schedule: $schedule, semester: $semester, period: $period)';
  }

  @override
  List<Object> get props {
    return [
      id,
      date,
      score ?? 0,
      subject,
      schedule,
      semester,
      period,
    ];
  }

  String getDate() {
    String sDay = schedule.day.toString();
    String sDate = "${date.day.twoDigits()}/${date.month.twoDigits()}/${date.year}";
    String sStartTime = "${schedule.startTime.hour.twoDigits()}:${schedule.startTime.minute.twoDigits()}";
    String sEndTime = "${schedule.endTime.hour.twoDigits()}:${schedule.endTime.minute.twoDigits()}";
    return "$sDay $sDate @ $sStartTime - $sEndTime";
  }
}
