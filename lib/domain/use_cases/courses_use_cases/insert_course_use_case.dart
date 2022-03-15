import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/course_entity.dart';
import 'package:my_aueb/domain/repositories/courses_repository.dart';

class InsertCourseUseCase extends UseCase<void, CourseEntity> {
  final CoursesRepository _coursesRepository;
  InsertCourseUseCase(this._coursesRepository);

  @override
  Future<void> call({required CourseEntity params}) {
    return _coursesRepository.insertCourse(params);
  }
}
