import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/lecture_entity.dart';
import 'package:my_aueb/domain/repositories/lectures_repository.dart';

class GetLecturesByCourseIdUseCase extends UseCase<List<LectureEntity>, int> {
  final LecturesRepository _lecturesRepository;
  GetLecturesByCourseIdUseCase(this._lecturesRepository);

  @override
  Future<List<LectureEntity>> call({required int params}) {
    return _lecturesRepository.getLecturesByCourseId(params);
  }
}
