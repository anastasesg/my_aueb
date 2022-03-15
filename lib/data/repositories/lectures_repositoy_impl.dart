import 'package:my_aueb/data/datasources/local/daos/lectures_dao.dart';
import 'package:my_aueb/domain/entities/lecture_entity.dart';
import 'package:my_aueb/domain/repositories/lectures_repository.dart';

class LecturesRepositoryImpl extends LecturesRepository {
  final LecturesDao _lecturesDao;
  LecturesRepositoryImpl(this._lecturesDao);

  @override
  Future deleteLecture(LectureEntity lecture) {
    return _lecturesDao.deleteLecture(lecture);
  }

  @override
  Future<List<LectureEntity>> getAllLectures() {
    return _lecturesDao.getAllLectures();
  }

  @override
  Future<LectureEntity?> getLectureById(int id) {
    return _lecturesDao.getLectureById(id);
  }

  @override
  Future<List<LectureEntity>> getLecturesByCourseId(int id) {
    return _lecturesDao.getLecturesByCourseId(id);
  }

  @override
  Future insertLecture(LectureEntity lecture) {
    return _lecturesDao.insertLecture(lecture);
  }

  @override
  Future updateLecture(LectureEntity lecture) {
    return _lecturesDao.updateLecture(lecture);
  }

  @override
  Future deleteLecturesByCourseId(int courseId) {
    return _lecturesDao.deleteLecturesByCourseId(courseId);
  }
}
