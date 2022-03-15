import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/subject_entity.dart';
import 'package:my_aueb/domain/repositories/subjects_repository.dart';

class GetAllSubjectsOrderedBySemesterTypeUseCase extends UseCase<List<SubjectEntity>, void> {
  final SubjectsRepository _subjectsRepository;
  GetAllSubjectsOrderedBySemesterTypeUseCase(this._subjectsRepository);

  @override
  Future<List<SubjectEntity>> call({void params}) {
    return _subjectsRepository.getAllSubjectsOrderedBySemesterType();
  }
}
