import 'package:my_aueb/config/constants.dart';
import 'package:my_aueb/domain/entities/course_entity.dart';
import 'package:sqflite/sqflite.dart';

class CoursesDao {
  final Database _appDatabase;
  const CoursesDao(this._appDatabase);

  Future<List<CourseEntity>> getAllCourses() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kCourseTable);
    return List.generate(maps.length, (index) => CourseEntity.fromMap(maps[index]));
  }

  Future<List<CourseEntity>> getCoursesBySubjectId(int id) async {
    final List<Map<String, dynamic>> maps =
        await _appDatabase.query(kCourseTable, where: "subjectId = ?", whereArgs: [id]);
    return List.generate(maps.length, (index) => CourseEntity.fromMap(maps[index]));
  }

  Future<List<CourseEntity>> getCoursesBySemesterId(int id) async {
    final List<Map<String, dynamic>> maps =
        await _appDatabase.query(kCourseTable, where: "semesterId = ?", whereArgs: [id]);
    return List.generate(maps.length, (index) => CourseEntity.fromMap(maps[index]));
  }

  Future<CourseEntity?> getCourseById(int id) async {
    final Map<String, dynamic> map = (await _appDatabase.query(kCourseTable, where: "id = ?", whereArgs: [id])).first;
    return CourseEntity.fromMap(map);
  }

  Future insertCourse(CourseEntity course) async {
    await _appDatabase.insert(kCourseTable, course.toMap());
  }

  Future updateCourse(CourseEntity course) async {
    await _appDatabase.update(kCourseTable, course.toMap(), where: "id = ?", whereArgs: [course.id]);
  }

  Future deleteCourse(CourseEntity course) async {
    await _appDatabase.delete(kCourseTable, where: "id = ?", whereArgs: [course.id]);
  }
}
