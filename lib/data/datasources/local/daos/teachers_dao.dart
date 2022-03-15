import 'package:my_aueb/config/constants.dart';
import 'package:my_aueb/core/extensions/string_extensions.dart';
import 'package:my_aueb/domain/entities/teacher_entity.dart';
import 'package:sqflite/sqflite.dart';

class TeachersDao {
  final Database _appDatabase;
  const TeachersDao(this._appDatabase);

  Future<List<TeacherEntity>> getAllTeachers() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kTeacherTable);
    return List.generate(maps.length, (i) => TeacherEntity.fromMap(maps[i]));
  }

  Future<List<TeacherEntity>> getAllTeachersOrderedByFirstName() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kTeacherTable, orderBy: "firstName");
    return List.generate(maps.length, (i) => TeacherEntity.fromMap(maps[i]))
      ..sort((a, b) => a.firstName.removeDiacritics().compareTo(b.firstName.removeDiacritics()));
  }

  Future<List<TeacherEntity>> getAllTeachersOrderedByLastName() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kTeacherTable, orderBy: "lastName");
    return List.generate(maps.length, (i) => TeacherEntity.fromMap(maps[i]))
      ..sort((a, b) => a.lastName.removeDiacritics().compareTo(b.lastName.removeDiacritics()));
  }

  Future<List<TeacherEntity>> getAllTeachersOrderedByDepartment() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kTeacherTable, orderBy: "departmentValue DESC");
    return List.generate(maps.length, (i) => TeacherEntity.fromMap(maps[i]));
  }

  Future<List<TeacherEntity>> getAllTeachersOrderedByTitle() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kTeacherTable, orderBy: "titleValue");
    return List.generate(maps.length, (i) => TeacherEntity.fromMap(maps[i]));
  }

  Future<List<TeacherEntity>> getTeachersByPattern(String pattern) async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(
      kTeacherTable,
      where: "firstName || ' ' || lastName LIKE ?",
      whereArgs: ["%$pattern%"],
    );
    return List.generate(maps.length, (i) => TeacherEntity.fromMap(maps[i]));
  }

  Future<TeacherEntity?> getTeacherById(int id) async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kTeacherTable, where: "id = ?", whereArgs: [id]);
    return List.generate(maps.length, (i) => TeacherEntity.fromMap(maps[i])).first;
  }
}
