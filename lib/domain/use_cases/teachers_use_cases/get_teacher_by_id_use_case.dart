import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/teacher_entity.dart';
import 'package:my_aueb/domain/repositories/teachers_repository.dart';

class GetTeacherByIdUseCase extends UseCase<TeacherEntity?, int> {
  final TeachersRepository _teachersRepository;
  GetTeacherByIdUseCase(this._teachersRepository);

  @override
  Future<TeacherEntity?> call({required int params}) {
    return _teachersRepository.getTeacherById(params);
  }
}
