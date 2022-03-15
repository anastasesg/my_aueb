import 'package:my_aueb/data/datasources/local/daos/subjects_dao.dart';
import 'package:my_aueb/domain/entities/subject_entity.dart';
import 'package:my_aueb/domain/repositories/subjects_repository.dart';

class SubjectsRepositoryImpl extends SubjectsRepository {
  final SubjectsDao _subjectsDao;
  SubjectsRepositoryImpl(this._subjectsDao);

  @override
  Future<List<SubjectEntity>> getAllSubjects() {
    return _subjectsDao.getAllSubjects();
  }

  @override
  Future<List<SubjectEntity>> getSubjectsByPattern(String pattern) {
    return _subjectsDao.getSubjectsByPattern(pattern);
  }

  @override
  Future<SubjectEntity?> getSubjectById(int id) {
    return _subjectsDao.getSubjectById(id);
  }

  @override
  Future<List<SubjectEntity>> getAllSubjectsOrderedBySemesterType() {
    return _subjectsDao.getAllSubjectsOrderedBySemesterType();
  }

  @override
  Future<List<SubjectEntity>> getAllSubjectsOrderedBySubjectType() {
    return _subjectsDao.getAllSubjectsOrderedBySubjectType();
  }

  @override
  Future<List<SubjectEntity>> getAllSubjectsOrderedByDepartment() {
    return _subjectsDao.getAllSubjectsOrderedByDepartment();
  }
}
