import 'package:my_aueb/domain/entities/semester_entity.dart';

abstract class SemestersRepository {
  Future<List<SemesterEntity>> getAllSemesters();
  Future<SemesterEntity?> getSemesterById(int id);
  Future insertSemester(SemesterEntity semester);
  Future updateSemester(SemesterEntity semester);
  Future deleteSemester(SemesterEntity semester);
}
