import 'package:my_aueb/data/datasources/local/daos/semesters_dao.dart';
import 'package:my_aueb/domain/entities/semester_entity.dart';
import 'package:my_aueb/domain/repositories/semesters_repository.dart';

class SemestersRepositoryImpl extends SemestersRepository {
  final SemestersDao _semestersDao;
  SemestersRepositoryImpl(this._semestersDao);

  @override
  Future deleteSemester(SemesterEntity semester) {
    return _semestersDao.deleteSemester(semester);
  }

  @override
  Future<List<SemesterEntity>> getAllSemesters() {
    return _semestersDao.getAllSemesters();
  }

  @override
  Future<SemesterEntity?> getSemesterById(int id) {
    return _semestersDao.getSemesterById(id);
  }

  @override
  Future insertSemester(SemesterEntity semester) {
    return _semestersDao.insertSemester(semester);
  }

  @override
  Future updateSemester(SemesterEntity semester) {
    return _semestersDao.updateSemester(semester);
  }
}
