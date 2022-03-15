import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/exam_entity.dart';
import 'package:my_aueb/domain/repositories/exams_repository.dart';

class UpdateExamUseCase extends UseCase<void, ExamEntity> {
  final ExamsRepository _examsRepository;
  UpdateExamUseCase(this._examsRepository);

  @override
  Future<void> call({required ExamEntity params}) {
    return _examsRepository.updateExam(params);
  }
}
