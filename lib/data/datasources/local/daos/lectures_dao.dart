import 'package:my_aueb/config/constants.dart';
import 'package:my_aueb/domain/entities/lecture_entity.dart';
import 'package:sqflite/sqflite.dart';

class LecturesDao {
  final Database _appDatabase;
  const LecturesDao(this._appDatabase);

  Future<List<LectureEntity>> getAllLectures() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kLectureTable);
    return List.generate(maps.length, (index) => LectureEntity.fromMap(maps[index]));
  }

  Future<List<LectureEntity>> getLecturesByCourseId(int id) async {
    final List<Map<String, dynamic>> maps =
        await _appDatabase.query(kLectureTable, where: "courseId = ?", whereArgs: [id]);
    return List.generate(maps.length, (index) => LectureEntity.fromMap(maps[index]));
  }

  Future<LectureEntity?> getLectureById(int id) async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kLectureTable, where: "id = ?", whereArgs: [id]);
    return List.generate(maps.length, (index) => LectureEntity.fromMap(maps[index])).first;
  }

  Future insertLecture(LectureEntity lecture) async {
    await _appDatabase.insert(kLectureTable, lecture.toMap());
  }

  Future updateLecture(LectureEntity lecture) async {
    await _appDatabase.update(kLectureTable, lecture.toMap(), where: "id = ?", whereArgs: [lecture.id]);
  }

  Future deleteLecture(LectureEntity lecture) async {
    await _appDatabase.delete(kLectureTable, where: "id = ?", whereArgs: [lecture.id]);
  }

  Future deleteLecturesByCourseId(int courseId) async {
    await _appDatabase.delete(kLectureTable, where: "courseId = ?", whereArgs: [courseId]);
  }
}
