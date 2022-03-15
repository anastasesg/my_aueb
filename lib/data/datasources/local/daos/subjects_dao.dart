import 'package:my_aueb/config/constants.dart';
import 'package:my_aueb/domain/entities/subject_entity.dart';
import 'package:sqflite/sqflite.dart';

class SubjectsDao {
  final Database _appDatabase;
  const SubjectsDao(this._appDatabase);

  Future<List<SubjectEntity>> getAllSubjects() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kSubjectTable);
    return List.generate(maps.length, (i) => SubjectEntity.fromMap(maps[i]));
  }

  Future<List<SubjectEntity>> getAllSubjectsOrderedBySubjectType() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(
      kSubjectTable,
      orderBy: "subjectTypeValue, departmentValue DESC",
    );
    return List.generate(maps.length, (i) => SubjectEntity.fromMap(maps[i]));
  }

  Future<List<SubjectEntity>> getAllSubjectsOrderedBySemesterType() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(
      kSubjectTable,
      orderBy: "semesterTypeValue, departmentValue DESC",
    );
    return List.generate(maps.length, (i) => SubjectEntity.fromMap(maps[i]));
  }

  Future<List<SubjectEntity>> getAllSubjectsOrderedByDepartment() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(
      kSubjectTable,
      orderBy: "departmentValue DESC",
    );
    return List.generate(maps.length, (i) => SubjectEntity.fromMap(maps[i]));
  }

  Future<List<SubjectEntity>> getSubjectsByPattern(String pattern) async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(
      kSubjectTable,
      where: "name LIKE ? or code LIKE ?",
      whereArgs: ["%$pattern%", "%$pattern%"],
    );
    return List.generate(maps.length, (i) => SubjectEntity.fromMap(maps[i]));
  }

  Future<SubjectEntity?> getSubjectById(int id) async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kSubjectTable, where: "id = ?", whereArgs: [id]);
    return List.generate(maps.length, (i) => SubjectEntity.fromMap(maps[i])).first;
  }
}
