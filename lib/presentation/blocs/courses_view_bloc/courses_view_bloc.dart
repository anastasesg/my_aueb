import 'package:my_aueb/data/mappers/course_mapper.dart';
import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/delete_course_use_case.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/get_all_courses_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_aueb/domain/use_cases/lectures_use_cases/delete_lectures_by_course_id_use_case.dart';

part 'courses_view_event.dart';
part 'courses_view_state.dart';

class CoursesViewBloc extends Bloc<CoursesViewEvent, CoursesViewState> {
  final CourseMapper _courseMapper;
  final GetAllCoursesUseCase _getAllCoursesUseCase;
  final DeleteCourseUseCase _deleteCourseUseCase;
  final DeleteLecturesByCourseIduseCase _deleteLecturesByCourseIduseCase;

  CoursesViewBloc(
    this._getAllCoursesUseCase,
    this._courseMapper,
    this._deleteCourseUseCase,
    this._deleteLecturesByCourseIduseCase,
  ) : super(CoursesViewLoading()) {
    on<CoursesViewGetCourses>((event, emit) async {
      emit(CoursesViewDone(courses: await _courseMapper.toModels(await _getAllCoursesUseCase())));
    });
    on<CoursesViewDeleteCourse>((event, emit) async {
      await _deleteCourseUseCase(params: _courseMapper.toEntity(event.course!));
      await _deleteLecturesByCourseIduseCase(params: event.course!.id);
      emit(CoursesViewDone(courses: await _courseMapper.toModels(await _getAllCoursesUseCase())));
    });
  }
}
