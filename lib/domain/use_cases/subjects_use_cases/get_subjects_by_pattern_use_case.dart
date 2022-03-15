import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/subject_entity.dart';
import 'package:my_aueb/domain/repositories/subjects_repository.dart';

class GetSubjectsByPatternUseCase extends UseCase<List<SubjectEntity>, String> {
  final SubjectsRepository _subjectsRepository;
  GetSubjectsByPatternUseCase(this._subjectsRepository);

  @override
  Future<List<SubjectEntity>> call({required String params}) {
    return _subjectsRepository.getSubjectsByPattern(params);
  }
}
