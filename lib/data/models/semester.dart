import 'dart:convert';

import 'package:my_aueb/core/custom_data_types/semester_type.dart';
import 'package:equatable/equatable.dart';

import 'package:my_aueb/core/extensions/int_extensions.dart';

class Semester extends Equatable {
  final int id;
  final SemesterType semesterType;
  final DateTime startDate;
  final DateTime endDate;
  final double maxCredits;

  const Semester({
    required this.id,
    required this.semesterType,
    required this.startDate,
    required this.endDate,
    required this.maxCredits,
  });

  Semester copyWith({
    int? id,
    SemesterType? semesterType,
    DateTime? startDate,
    DateTime? endDate,
    double? maxCredits,
  }) {
    return Semester(
      id: id ?? this.id,
      semesterType: semesterType ?? this.semesterType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      maxCredits: maxCredits ?? this.maxCredits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'semesterType': semesterType.toMap(),
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'maxCredits': maxCredits,
    };
  }

  factory Semester.fromMap(Map<String, dynamic> map) {
    return Semester(
      id: map['id']?.toInt() ?? 0,
      semesterType: SemesterType.fromMap(map['semesterType']),
      startDate: DateTime.fromMillisecondsSinceEpoch(map['startDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(map['endDate']),
      maxCredits: map['maxCredits']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Semester.fromJson(String source) => Semester.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Semester(id: $id, semesterType: $semesterType, startDate: $startDate, endDate: $endDate, maxCredits: $maxCredits)';
  }

  @override
  List<Object> get props {
    return [
      id,
      semesterType,
      startDate,
      endDate,
      maxCredits,
    ];
  }

  String getSemesterName() {
    return "${semesterType.toString()} Εξάμηνο | ${getAcademicYear()}";
  }

  String getSemesterDates() {
    return "${startDate.day.twoDigits()}/${startDate.month.twoDigits()}/${startDate.year} - ${endDate.day.twoDigits()}/${endDate.month.twoDigits()}/${endDate.year}";
  }

  String getAcademicYear() {
    if (startDate.year == endDate.year) {
      return "${startDate.year - 1} - ${endDate.year}";
    } else {
      return "${startDate.year} - ${endDate.year}";
    }
  }
}
