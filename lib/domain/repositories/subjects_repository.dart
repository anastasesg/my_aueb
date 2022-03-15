import 'package:my_aueb/domain/entities/subject_entity.dart';

abstract class SubjectsRepository {
  Future<List<SubjectEntity>> getAllSubjects();
  Future<List<SubjectEntity>> getAllSubjectsOrderedBySemesterType();
  Future<List<SubjectEntity>> getAllSubjectsOrderedBySubjectType();
  Future<List<SubjectEntity>> getAllSubjectsOrderedByDepartment();
  Future<List<SubjectEntity>> getSubjectsByPattern(String pattern);
  Future<SubjectEntity?> getSubjectById(int id);
}
