import 'package:my_aueb/config/constants.dart';
import 'package:my_aueb/domain/entities/exam_entity.dart';
import 'package:sqflite/sqflite.dart';

class ExamsDao {
  final Database _appDatabase;
  const ExamsDao(this._appDatabase);

  Future<List<ExamEntity>> getAllExams() async {
    final List<Map<String, dynamic>> examMaps = await _appDatabase.query(kExamTable);
    return List.generate(examMaps.length, (index) => ExamEntity.fromMap(examMaps[index]));
  }

  Future<List<ExamEntity>> getExamsBySubjectId(int id) async {
    final List<Map<String, dynamic>> maps =
        await _appDatabase.query(kExamTable, where: "subjectId = ?", whereArgs: [id]);
    return List.generate(maps.length, (i) => ExamEntity.fromMap(maps[i]));
  }

  Future<ExamEntity?> getExamById(int id) async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kExamTable, where: "id = ?", whereArgs: [id]);
    return List.generate(maps.length, (i) => ExamEntity.fromMap(maps[i])).first;
  }

  Future insertExam(ExamEntity exam) async {
    await _appDatabase.insert(kExamTable, exam.toMap());
  }

  Future updateExam(ExamEntity exam) async {
    await _appDatabase.update(kExamTable, exam.toMap(), where: "id = ?", whereArgs: [exam.id]);
  }

  Future deleteExam(ExamEntity exam) async {
    await _appDatabase.delete(kExamTable, where: "id = ?", whereArgs: [exam.id]);
  }
}
