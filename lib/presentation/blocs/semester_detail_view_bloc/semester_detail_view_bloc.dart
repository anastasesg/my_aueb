import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:my_aueb/data/mappers/course_mapper.dart';
import 'package:my_aueb/data/mappers/semester_mapper.dart';
import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/data/models/semester.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/get_courses_by_semester_id_use_case.dart';
import 'package:my_aueb/domain/use_cases/semesters_use_cases/get_semester_by_id_use_case.dart';

part 'semester_detail_view_event.dart';
part 'semester_detail_view_state.dart';

class SemesterDetailViewBloc extends Bloc<SemesterDetailViewEvent, SemesterDetailViewState> {
  final SemesterMapper _semesterMapper;
  final GetSemesterByIdUseCase _getSemesterByIdUseCase;
  final CourseMapper _courseMapper;
  final GetCoursesBySemesterIdUseCase _getCoursesBySemesterIdUseCase;

  SemesterDetailViewBloc(
    this._semesterMapper,
    this._getSemesterByIdUseCase,
    this._courseMapper,
    this._getCoursesBySemesterIdUseCase,
  ) : super(SemesterDetailViewLoading()) {
    on<SemesterDetailViewGetDetails>((event, emit) async {
      Semester semester = await _semesterMapper.toModel((await _getSemesterByIdUseCase(params: event.id!))!);
      List<Course> courses = await _courseMapper.toModels(await _getCoursesBySemesterIdUseCase(params: semester.id));
      emit(SemesterDetailViewDone(semester: semester, courses: courses));
    });
  }
}
