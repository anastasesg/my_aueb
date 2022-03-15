import 'package:my_aueb/domain/entities/exam_entity.dart';

abstract class ExamsRepository {
  Future<List<ExamEntity>> getAllExams();
  Future<List<ExamEntity>> getExamsBySubjectId(int id);
  Future<ExamEntity?> getExamById(int id);
  Future insertExam(ExamEntity exam);
  Future updateExam(ExamEntity exam);
  Future deleteExam(ExamEntity exam);
}
