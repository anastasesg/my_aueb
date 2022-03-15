import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:my_aueb/core/custom_data_types/department.dart';
import 'package:my_aueb/core/custom_data_types/semester_type.dart';
import 'package:my_aueb/core/custom_data_types/subject_type.dart';

class Subject extends Equatable {
  final int id;
  final String code;
  final String name;
  final SubjectType subjectType;
  final Department department;
  final SemesterType semesterType;
  final double credits;

  const Subject({
    required this.id,
    required this.code,
    required this.name,
    required this.subjectType,
    required this.department,
    required this.semesterType,
    required this.credits,
  });

  Subject copyWith({
    int? id,
    String? code,
    String? name,
    SubjectType? subjectType,
    Department? department,
    SemesterType? semesterType,
    double? credits,
  }) {
    return Subject(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      subjectType: subjectType ?? this.subjectType,
      department: department ?? this.department,
      semesterType: semesterType ?? this.semesterType,
      credits: credits ?? this.credits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'subjectType': subjectType.toMap(),
      'department': department.toMap(),
      'semesterType': semesterType.toMap(),
      'credits': credits,
    };
  }

  factory Subject.fromMap(Map<String, dynamic> map) {
    return Subject(
      id: map['id']?.toInt() ?? 0,
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      subjectType: SubjectType.fromMap(map['subjectType']),
      department: Department.fromMap(map['department']),
      semesterType: SemesterType.fromMap(map['semesterType']),
      credits: map['credits']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Subject.fromJson(String source) => Subject.fromMap(json.decode(source));

  @override
  String toString() {
    if (subjectType.toInt() == SubjectType.Required.toInt()) {
      return "$name*";
    }
    return name;
  }

  @override
  List<Object> get props {
    return [
      id,
      code,
      name,
      subjectType,
      department,
      semesterType,
      credits,
    ];
  }
}
