import 'dart:convert';

import 'package:equatable/equatable.dart';

class SemesterEntity extends Equatable {
  final int id;
  final int semesterTypeValue;
  final DateTime startDate;
  final DateTime endDate;
  final double maxCredits;

  const SemesterEntity({
    required this.id,
    required this.semesterTypeValue,
    required this.startDate,
    required this.endDate,
    required this.maxCredits,
  });

  SemesterEntity copyWith({
    int? id,
    int? semesterTypeValue,
    DateTime? startDate,
    DateTime? endDate,
    double? maxCredits,
  }) {
    return SemesterEntity(
      id: id ?? this.id,
      semesterTypeValue: semesterTypeValue ?? this.semesterTypeValue,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      maxCredits: maxCredits ?? this.maxCredits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'semesterTypeValue': semesterTypeValue,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'maxCredits': maxCredits,
    };
  }

  factory SemesterEntity.fromMap(Map<String, dynamic> map) {
    return SemesterEntity(
      id: map['id']?.toInt() ?? 0,
      semesterTypeValue: map['semesterTypeValue']?.toInt() ?? 0,
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate']),
      maxCredits: map['maxCredits']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SemesterEntity.fromJson(String source) => SemesterEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SemesterEntity(id: $id, semesterTypeValue: $semesterTypeValue, startDate: $startDate, endDate: $endDate, maxCredits: $maxCredits)';
  }

  @override
  List<Object> get props {
    return [
      id,
      semesterTypeValue,
      startDate,
      endDate,
      maxCredits,
    ];
  }
}
