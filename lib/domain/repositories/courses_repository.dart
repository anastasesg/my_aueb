import 'package:my_aueb/domain/entities/course_entity.dart';

abstract class CoursesRepository {
  Future<List<CourseEntity>> getAllCourses();
  Future<List<CourseEntity>> getCoursesBySubjectId(int id);
  Future<List<CourseEntity>> getCoursesBySemesterId(int id);
  Future<CourseEntity?> getCourseById(int id);
  Future insertCourse(CourseEntity course);
  Future updateCourse(CourseEntity course);
  Future deleteCourse(CourseEntity course);
}
