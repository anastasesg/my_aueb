import 'package:my_aueb/core/usecases/base_use_case.dart';
import 'package:my_aueb/domain/entities/course_entity.dart';
import 'package:my_aueb/domain/repositories/courses_repository.dart';

class GetCourseByIdUseCase extends UseCase<CourseEntity?, int> {
  final CoursesRepository _coursesRepository;
  GetCourseByIdUseCase(this._coursesRepository);

  @override
  Future<CourseEntity?> call({required int params}) {
    return _coursesRepository.getCourseById(params);
  }
}
