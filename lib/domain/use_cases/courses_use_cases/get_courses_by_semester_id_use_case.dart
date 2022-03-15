import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/course_entity.dart';
import 'package:my_aueb/domain/repositories/courses_repository.dart';

class GetCoursesBySemesterIdUseCase extends UseCase<List<CourseEntity>, int> {
  final CoursesRepository _coursesRepository;
  GetCoursesBySemesterIdUseCase(this._coursesRepository);

  @override
  Future<List<CourseEntity>> call({required int params}) {
    return _coursesRepository.getCoursesBySemesterId(params);
  }
}
