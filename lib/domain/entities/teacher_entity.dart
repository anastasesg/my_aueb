import 'dart:convert';

import 'package:equatable/equatable.dart';

class TeacherEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final int titleValue;
  final int departmentValue;

  const TeacherEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.titleValue,
    required this.departmentValue,
  });

  TeacherEntity copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
    int? titleValue,
    int? departmentValue,
  }) {
    return TeacherEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      titleValue: titleValue ?? this.titleValue,
      departmentValue: departmentValue ?? this.departmentValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'titleValue': titleValue,
      'departmentValue': departmentValue,
    };
  }

  factory TeacherEntity.fromMap(Map<String, dynamic> map) {
    return TeacherEntity(
      id: map['id']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      titleValue: map['titleValue']?.toInt() ?? 0,
      departmentValue: map['departmentValue']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherEntity.fromJson(String source) => TeacherEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TeacherEntity(id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, titleValue: $titleValue, departmentValue: $departmentValue)';
  }

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      phone,
      email,
      titleValue,
      departmentValue,
    ];
  }
}
