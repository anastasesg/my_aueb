import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/semester_entity.dart';
import 'package:my_aueb/domain/repositories/semesters_repository.dart';

class GetSemesterByIdUseCase extends UseCase<SemesterEntity?, int> {
  final SemestersRepository _semestersRepository;
  GetSemesterByIdUseCase(this._semestersRepository);

  @override
  Future<SemesterEntity?> call({required int params}) {
    return _semestersRepository.getSemesterById(params);
  }
}
