import 'dart:convert';

import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final int id;
  final String code;
  final String name;
  final int semesterTypeValue;
  final int departmentValue;
  final int subjectTypeValue;
  final double credits;

  const SubjectEntity({
    required this.id,
    required this.code,
    required this.name,
    required this.semesterTypeValue,
    required this.departmentValue,
    required this.subjectTypeValue,
    required this.credits,
  });

  SubjectEntity copyWith({
    int? id,
    String? code,
    String? name,
    int? semesterTypeValue,
    int? departmentValue,
    int? subjectTypeValue,
    double? credits,
  }) {
    return SubjectEntity(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      semesterTypeValue: semesterTypeValue ?? this.semesterTypeValue,
      departmentValue: departmentValue ?? this.departmentValue,
      subjectTypeValue: subjectTypeValue ?? this.subjectTypeValue,
      credits: credits ?? this.credits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'semesterTypeValue': semesterTypeValue,
      'departmentValue': departmentValue,
      'subjectTypeValue': subjectTypeValue,
      'credits': credits,
    };
  }

  factory SubjectEntity.fromMap(Map<String, dynamic> map) {
    return SubjectEntity(
      id: map['id']?.toInt() ?? 0,
      code: map['code'] ?? '',
      name: map['name'] ?? '',
      semesterTypeValue: map['semesterTypeValue']?.toInt() ?? 0,
      departmentValue: map['departmentValue']?.toInt() ?? 0,
      subjectTypeValue: map['subjectTypeValue']?.toInt() ?? 0,
      credits: map['credits']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubjectEntity.fromJson(String source) => SubjectEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubjectEntity(id: $id, code: $code, name: $name, semesterTypeValue: $semesterTypeValue, departmentValue: $departmentValue, subjectTypeValue: $subjectTypeValue, credits: $credits)';
  }

  @override
  List<Object> get props {
    return [
      id,
      code,
      name,
      semesterTypeValue,
      departmentValue,
      subjectTypeValue,
      credits,
    ];
  }
}
