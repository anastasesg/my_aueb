import 'package:my_aueb/data/datasources/local/daos/exams_dao.dart';
import 'package:my_aueb/domain/entities/exam_entity.dart';
import 'package:my_aueb/domain/repositories/exams_repository.dart';

class ExamsRepositoryImpl extends ExamsRepository {
  final ExamsDao _examsDao;
  ExamsRepositoryImpl(this._examsDao);

  @override
  Future deleteExam(ExamEntity exam) {
    return _examsDao.deleteExam(exam);
  }

  @override
  Future<List<ExamEntity>> getAllExams() {
    return _examsDao.getAllExams();
  }

  @override
  Future<ExamEntity?> getExamById(int id) {
    return _examsDao.getExamById(id);
  }

  @override
  Future insertExam(ExamEntity exam) {
    return _examsDao.insertExam(exam);
  }

  @override
  Future updateExam(ExamEntity exam) {
    return _examsDao.updateExam(exam);
  }

  @override
  Future<List<ExamEntity>> getExamsBySubjectId(int id) {
    return _examsDao.getExamsBySubjectId(id);
  }
}
