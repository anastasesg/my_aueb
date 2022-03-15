import 'dart:convert';

import 'package:equatable/equatable.dart';

class LectureEntity extends Equatable {
  final int id;
  final int courseId;
  final int scheduleId;

  const LectureEntity({
    required this.id,
    required this.courseId,
    required this.scheduleId,
  });

  LectureEntity copyWith({
    int? id,
    int? courseId,
    int? scheduleId,
  }) {
    return LectureEntity(
      id: id ?? this.id,
      courseId: courseId ?? this.courseId,
      scheduleId: scheduleId ?? this.scheduleId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'courseId': courseId,
      'scheduleId': scheduleId,
    };
  }

  factory LectureEntity.fromMap(Map<String, dynamic> map) {
    return LectureEntity(
      id: map['id']?.toInt() ?? 0,
      courseId: map['courseId']?.toInt() ?? 0,
      scheduleId: map['scheduleId']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory LectureEntity.fromJson(String source) => LectureEntity.fromMap(json.decode(source));

  @override
  String toString() => 'Lecture(id: $id, courseId: $courseId, scheduleId: $scheduleId)';

  @override
  List<Object> get props => [id, courseId, scheduleId];
}
