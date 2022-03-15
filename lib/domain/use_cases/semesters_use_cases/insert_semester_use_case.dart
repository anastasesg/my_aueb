import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/semester_entity.dart';
import 'package:my_aueb/domain/repositories/semesters_repository.dart';

class InsertSemesterUseCase extends UseCase<void, SemesterEntity> {
  final SemestersRepository _semestersRepository;
  InsertSemesterUseCase(this._semestersRepository);

  @override
  Future<void> call({required SemesterEntity params}) {
    return _semestersRepository.insertSemester(params);
  }
}
