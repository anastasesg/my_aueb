import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/semester_entity.dart';
import 'package:my_aueb/domain/repositories/semesters_repository.dart';

class GetAllSemestersUseCase extends UseCase<List<SemesterEntity>, void> {
  final SemestersRepository _semestersRepository;
  GetAllSemestersUseCase(this._semestersRepository);

  @override
  Future<List<SemesterEntity>> call({void params}) {
    return _semestersRepository.getAllSemesters();
  }
}
