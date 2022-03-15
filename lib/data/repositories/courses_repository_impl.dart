import 'package:my_aueb/data/datasources/local/daos/courses_dao.dart';
import 'package:my_aueb/domain/entities/course_entity.dart';
import 'package:my_aueb/domain/repositories/courses_repository.dart';

class CoursesRepositoryImpl extends CoursesRepository {
  final CoursesDao _coursesDao;
  CoursesRepositoryImpl(this._coursesDao);

  @override
  Future deleteCourse(CourseEntity course) {
    return _coursesDao.deleteCourse(course);
  }

  @override
  Future<List<CourseEntity>> getAllCourses() {
    return _coursesDao.getAllCourses();
  }

  @override
  Future<CourseEntity?> getCourseById(int id) {
    return _coursesDao.getCourseById(id);
  }

  @override
  Future<List<CourseEntity>> getCoursesBySubjectId(int id) {
    return _coursesDao.getCoursesBySubjectId(id);
  }

  @override
  Future insertCourse(CourseEntity course) {
    return _coursesDao.insertCourse(course);
  }

  @override
  Future updateCourse(CourseEntity course) {
    return _coursesDao.updateCourse(course);
  }

  @override
  Future<List<CourseEntity>> getCoursesBySemesterId(int id) {
    return _coursesDao.getCoursesBySemesterId(id);
  }
}
