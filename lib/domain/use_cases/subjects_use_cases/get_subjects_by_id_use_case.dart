import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/subject_entity.dart';
import 'package:my_aueb/domain/repositories/subjects_repository.dart';

class GetSubjectByIdUseCase extends UseCase<SubjectEntity?, int> {
  final SubjectsRepository _subjectsRepository;
  GetSubjectByIdUseCase(this._subjectsRepository);

  @override
  Future<SubjectEntity?> call({required int params}) {
    return _subjectsRepository.getSubjectById(params);
  }
}
