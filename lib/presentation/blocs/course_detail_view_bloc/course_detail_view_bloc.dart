import 'package:my_aueb/data/mappers/lecture_mapper.dart';
import 'package:my_aueb/domain/use_cases/lectures_use_cases/get_lectures_by_course_id_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:my_aueb/data/mappers/course_mapper.dart';
import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/data/models/exam.dart';
import 'package:my_aueb/data/models/lecture.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/get_course_by_id_use_case.dart';

part 'course_detail_view_event.dart';
part 'course_detail_view_state.dart';

class CourseDetailViewBloc extends Bloc<CourseDetailViewEvent, CourseDetailViewState> {
  final CourseMapper _courseMapper;
  final LectureMapper _lectureMapper;
  // final ExamMapper _examMapper;
  final GetCourseByIdUseCase _getCourseByIdUseCase;
  final GetLecturesByCourseIdUseCase _getLecturesByCourseIdUseCase;
  // final GetExamsByCourseUseCase _getExamsByCourseUseCase;

  CourseDetailViewBloc(
    this._courseMapper,
    this._lectureMapper,
    // this._examMapper,
    this._getCourseByIdUseCase,
    this._getLecturesByCourseIdUseCase,
    // this._getExamsByCourseUseCase,
  ) : super(CourseDetailViewLoading()) {
    on<CourseDetailViewGetDetails>((event, emit) async {
      Course course = await _courseMapper.toModel((await _getCourseByIdUseCase(params: event.id!))!);
      List<Lecture> lectures = await _lectureMapper.toModels(await _getLecturesByCourseIdUseCase(params: event.id!));
      // List<Exam> exams = await _examMapper.toModels(await _getExamsByCourseUseCase(params: event.id!));
      emit(CourseDetailViewDone(course: course, lectures: lectures)); //, lectures: lectures, exams: exams));
    });
  }
}
