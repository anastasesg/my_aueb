import 'dart:convert';

import 'package:equatable/equatable.dart';

class CourseEntity extends Equatable {
  final int? id;
  final int colorValue;
  final int subjectId;
  final int semesterId;
  final int teacherId;

  const CourseEntity({
    this.id,
    required this.colorValue,
    required this.subjectId,
    required this.semesterId,
    required this.teacherId,
  });

  CourseEntity copyWith({
    int? id,
    int? colorValue,
    int? subjectId,
    int? semesterId,
    int? teacherId,
  }) {
    return CourseEntity(
      id: id ?? this.id,
      colorValue: colorValue ?? this.colorValue,
      subjectId: subjectId ?? this.subjectId,
      semesterId: semesterId ?? this.semesterId,
      teacherId: teacherId ?? this.teacherId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'colorValue': colorValue,
      'subjectId': subjectId,
      'semesterId': semesterId,
      'teacherId': teacherId,
    };
  }

  factory CourseEntity.fromMap(Map<String, dynamic> map) {
    return CourseEntity(
      id: map['id']?.toInt() ?? 0,
      colorValue: map['colorValue']?.toInt() ?? 0,
      subjectId: map['subjectId']?.toInt() ?? 0,
      semesterId: map['semesterId']?.toInt() ?? 0,
      teacherId: map['teacherId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CourseEntity.fromJson(String source) => CourseEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CourseEntity(id: $id, colorValue: $colorValue, subjectId: $subjectId, semesterId: $semesterId, teacherId: $teacherId)';
  }

  @override
  List<Object> get props {
    return [
      id ?? -1,
      colorValue,
      subjectId,
      semesterId,
      teacherId,
    ];
  }
}
