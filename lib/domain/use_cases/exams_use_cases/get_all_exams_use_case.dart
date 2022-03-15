import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/exam_entity.dart';
import 'package:my_aueb/domain/repositories/exams_repository.dart';

class GetAllExamsUseCase extends UseCase<List<ExamEntity>, void> {
  final ExamsRepository _examsRepository;
  GetAllExamsUseCase(this._examsRepository);

  @override
  Future<List<ExamEntity>> call({void params}) {
    return _examsRepository.getAllExams();
  }
}
