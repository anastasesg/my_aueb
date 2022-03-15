import 'package:my_aueb/config/constants.dart';
import 'package:my_aueb/domain/entities/semester_entity.dart';
import 'package:sqflite/sqflite.dart';

class SemestersDao {
  final Database _appDatabase;
  const SemestersDao(this._appDatabase);

  Future<List<SemesterEntity>> getAllSemesters() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kSemesterTable);
    return List.generate(maps.length, (i) => SemesterEntity.fromMap(maps[i]));
  }

  Future<SemesterEntity?> getSemesterById(int id) async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kSemesterTable, where: "id = ?", whereArgs: [id]);
    return List.generate(maps.length, (i) => SemesterEntity.fromMap(maps[i])).first;
  }

  Future insertSemester(SemesterEntity semester) async {
    await _appDatabase.insert(kSemesterTable, semester.toMap());
  }

  Future updateSemester(SemesterEntity semester) async {
    await _appDatabase.update(kSemesterTable, semester.toMap(), where: "id = ?", whereArgs: [semester.id]);
  }

  Future deleteSemester(SemesterEntity semester) async {
    await _appDatabase.delete(kSemesterTable, where: "id = ?", whereArgs: [semester.id]);
  }
}
