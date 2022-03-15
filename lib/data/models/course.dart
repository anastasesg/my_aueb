import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:my_aueb/data/models/semester.dart';
import 'package:my_aueb/data/models/subject.dart';
import 'package:my_aueb/data/models/teacher.dart';

class Course extends Equatable {
  final int id;
  final Color color;
  final Subject subject;
  final Semester semester;
  final Teacher teacher;

  const Course({
    required this.id,
    required this.color,
    required this.subject,
    required this.semester,
    required this.teacher,
  });

  Course copyWith({
    int? id,
    Color? color,
    Subject? subject,
    Semester? semester,
    Teacher? teacher,
  }) {
    return Course(
      id: id ?? this.id,
      color: color ?? this.color,
      subject: subject ?? this.subject,
      semester: semester ?? this.semester,
      teacher: teacher ?? this.teacher,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'color': color.value,
      'subject': subject.toMap(),
      'semester': semester.toMap(),
      'teacher': teacher.toMap(),
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      id: map['id']?.toInt() ?? 0,
      color: Color(map['color']),
      subject: Subject.fromMap(map['subject']),
      semester: Semester.fromMap(map['semester']),
      teacher: Teacher.fromMap(map['teacher']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Course.fromJson(String source) => Course.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Course(id: $id, color: $color, subject: $subject, semester: $semester, teacher: $teacher)';
  }

  @override
  List<Object> get props {
    return [
      id,
      color,
      subject,
      semester,
      teacher,
    ];
  }
}
