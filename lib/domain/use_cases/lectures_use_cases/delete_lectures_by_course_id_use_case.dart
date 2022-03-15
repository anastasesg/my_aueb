import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/repositories/lectures_repository.dart';

class DeleteLecturesByCourseIduseCase extends UseCase<void, int> {
  final LecturesRepository _lecturesRepository;
  DeleteLecturesByCourseIduseCase(this._lecturesRepository);

  @override
  Future<void> call({required int params}) {
    return _lecturesRepository.deleteLecturesByCourseId(params);
  }
}
