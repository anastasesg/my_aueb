import 'package:my_aueb/domain/entities/teacher_entity.dart';

abstract class TeachersRepository {
  Future<List<TeacherEntity>> getAllTeachers();
  Future<List<TeacherEntity>> getAllTeachersOrderedByFirstName();
  Future<List<TeacherEntity>> getAllTeachersOrderedByLastName();
  Future<List<TeacherEntity>> getAllTeachersOrderedByDepartment();
  Future<List<TeacherEntity>> getAllTeachersOrderedByTitle();
  Future<List<TeacherEntity>> getTeachersByPattern(String pattern);
  Future<TeacherEntity?> getTeacherById(int id);
}
