import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/teacher_entity.dart';
import 'package:my_aueb/domain/repositories/teachers_repository.dart';

class GetAllTeachersUseCase extends UseCase<List<TeacherEntity>, void> {
  final TeachersRepository _teachersRepository;
  GetAllTeachersUseCase(this._teachersRepository);

  @override
  Future<List<TeacherEntity>> call({void params}) {
    return _teachersRepository.getAllTeachers();
  }
}
