import 'package:my_aueb/data/datasources/local/daos/teachers_dao.dart';
import 'package:my_aueb/domain/entities/teacher_entity.dart';
import 'package:my_aueb/domain/repositories/teachers_repository.dart';

class TeachersRepositoryImpl extends TeachersRepository {
  final TeachersDao _teachersDao;
  TeachersRepositoryImpl(this._teachersDao);

  @override
  Future<List<TeacherEntity>> getAllTeachers() {
    return _teachersDao.getAllTeachers();
  }

  @override
  Future<List<TeacherEntity>> getTeachersByPattern(String pattern) {
    return _teachersDao.getTeachersByPattern(pattern);
  }

  @override
  Future<TeacherEntity?> getTeacherById(int id) {
    return _teachersDao.getTeacherById(id);
  }

  @override
  Future<List<TeacherEntity>> getAllTeachersOrderedByDepartment() {
    return _teachersDao.getAllTeachersOrderedByDepartment();
  }

  @override
  Future<List<TeacherEntity>> getAllTeachersOrderedByFirstName() {
    return _teachersDao.getAllTeachersOrderedByFirstName();
  }

  @override
  Future<List<TeacherEntity>> getAllTeachersOrderedByLastName() {
    return _teachersDao.getAllTeachersOrderedByLastName();
  }

  @override
  Future<List<TeacherEntity>> getAllTeachersOrderedByTitle() {
    return _teachersDao.getAllTeachersOrderedByTitle();
  }
}
