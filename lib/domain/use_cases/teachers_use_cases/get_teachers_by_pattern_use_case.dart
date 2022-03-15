import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/teacher_entity.dart';
import 'package:my_aueb/domain/repositories/teachers_repository.dart';

class GetTeachersByPatternUseCase extends UseCase<List<TeacherEntity>, String> {
  final TeachersRepository _teachersRepository;
  GetTeachersByPatternUseCase(this._teachersRepository);

  @override
  Future<List<TeacherEntity>> call({required String params}) {
    return _teachersRepository.getTeachersByPattern(params);
  }
}
