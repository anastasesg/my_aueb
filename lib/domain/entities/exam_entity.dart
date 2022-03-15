import 'dart:convert';

import 'package:equatable/equatable.dart';

class ExamEntity extends Equatable {
  final int id;
  final DateTime date;
  final double? score;
  final int subjectId;
  final int scheduleId;
  final int semesterId;
  final int examPeriodValue;

  const ExamEntity({
    required this.id,
    required this.date,
    this.score,
    required this.subjectId,
    required this.scheduleId,
    required this.semesterId,
    required this.examPeriodValue,
  });

  ExamEntity copyWith({
    int? id,
    DateTime? date,
    double? score,
    int? subjectId,
    int? scheduleId,
    int? semesterId,
    int? examPeriodValue,
  }) {
    return ExamEntity(
      id: id ?? this.id,
      date: date ?? this.date,
      score: score ?? this.score,
      subjectId: subjectId ?? this.subjectId,
      scheduleId: scheduleId ?? this.scheduleId,
      semesterId: semesterId ?? this.semesterId,
      examPeriodValue: examPeriodValue ?? this.examPeriodValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'score': score,
      'subjectId': subjectId,
      'scheduleId': scheduleId,
      'semesterId': semesterId,
      'examPeriodValue': examPeriodValue,
    };
  }

  factory ExamEntity.fromMap(Map<String, dynamic> map) {
    return ExamEntity(
      id: map['id']?.toInt() ?? 0,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      score: map['score']?.toDouble(),
      subjectId: map['subjectId']?.toInt() ?? 0,
      scheduleId: map['scheduleId']?.toInt() ?? 0,
      semesterId: map['semesterId']?.toInt() ?? 0,
      examPeriodValue: map['examPeriodValue']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExamEntity.fromJson(String source) => ExamEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExamEntity(id: $id, date: $date, score: $score, subjectId: $subjectId, scheduleId: $scheduleId, semesterId: $semesterId, examPeriodValue: $examPeriodValue)';
  }

  @override
  List<Object> get props {
    return [
      id,
      date,
      score ?? 0,
      subjectId,
      scheduleId,
      semesterId,
      examPeriodValue,
    ];
  }
}
