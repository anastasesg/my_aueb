import 'dart:convert';

import 'package:my_aueb/core/custom_data_types/department.dart';
import 'package:my_aueb/core/custom_data_types/teacher_title.dart';

class Teacher {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  late TeacherTitle title;
  late Department department;

  Teacher({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.title,
    required this.department,
  });

  Teacher copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    TeacherTitle? title,
    Department? department,
  }) {
    return Teacher(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      title: title ?? this.title,
      department: department ?? this.department,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'title': title.toMap(),
      'department': department.toMap(),
    };
  }

  factory Teacher.fromMap(Map<String, dynamic> map) {
    return Teacher(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      title: TeacherTitle(map['titleValue']),
      department: Department(map['departmentValue']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Teacher.fromJson(String source) => Teacher.fromMap(json.decode(source));

  @override
  String toString() {
    return "$firstName $lastName\n$title";
  }

  String getConcatedTeacherName() {
    return "${firstName.substring(0, 1)}. $lastName";
  }
}
