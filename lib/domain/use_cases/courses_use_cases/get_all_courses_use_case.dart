import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/course_entity.dart';
import 'package:my_aueb/domain/repositories/courses_repository.dart';

class GetAllCoursesUseCase extends UseCase<List<CourseEntity>, void> {
  final CoursesRepository _coursesRepository;
  GetAllCoursesUseCase(this._coursesRepository);

  @override
  Future<List<CourseEntity>> call({void params}) {
    return _coursesRepository.getAllCourses();
  }
}
