import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/exam_entity.dart';
import 'package:my_aueb/domain/repositories/exams_repository.dart';

class GetExamByIdUseCase extends UseCase<ExamEntity?, int> {
  final ExamsRepository _examsRepository;
  GetExamByIdUseCase(this._examsRepository);

  @override
  Future<ExamEntity?> call({required int params}) {
    return _examsRepository.getExamById(params);
  }
}
