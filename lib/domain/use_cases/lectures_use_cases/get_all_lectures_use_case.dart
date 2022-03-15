import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/lecture_entity.dart';
import 'package:my_aueb/domain/repositories/lectures_repository.dart';

class GetAllLectuesUseCase extends UseCase<List<LectureEntity>, void> {
  final LecturesRepository _lecturesRepository;
  GetAllLectuesUseCase(this._lecturesRepository);

  @override
  Future<List<LectureEntity>> call({void params}) {
    return _lecturesRepository.getAllLectures();
  }
}
