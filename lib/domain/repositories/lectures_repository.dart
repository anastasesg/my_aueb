import 'package:my_aueb/domain/entities/lecture_entity.dart';

abstract class LecturesRepository {
  Future<List<LectureEntity>> getAllLectures();
  Future<List<LectureEntity>> getLecturesByCourseId(int id);
  Future<LectureEntity?> getLectureById(int id);
  Future insertLecture(LectureEntity lecture);
  Future updateLecture(LectureEntity lecture);
  Future deleteLecture(LectureEntity lecture);
  Future deleteLecturesByCourseId(int courseId);
}
