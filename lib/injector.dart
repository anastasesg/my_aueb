import 'package:get_it/get_it.dart';
import 'package:my_aueb/domain/use_cases/lectures_use_cases/delete_lectures_by_course_id_use_case.dart';
import 'package:sqflite/sqflite.dart';

import 'package:my_aueb/data/datasources/local/app_database.dart';
import 'package:my_aueb/data/datasources/local/daos/courses_dao.dart';
import 'package:my_aueb/data/datasources/local/daos/exams_dao.dart';
import 'package:my_aueb/data/datasources/local/daos/lectures_dao.dart';
import 'package:my_aueb/data/datasources/local/daos/schedule_dao.dart';
import 'package:my_aueb/data/datasources/local/daos/semesters_dao.dart';
import 'package:my_aueb/data/datasources/local/daos/subjects_dao.dart';
import 'package:my_aueb/data/datasources/local/daos/teachers_dao.dart';
import 'package:my_aueb/data/mappers/course_mapper.dart';
import 'package:my_aueb/data/mappers/exam_mapper.dart';
import 'package:my_aueb/data/mappers/lecture_mapper.dart';
import 'package:my_aueb/data/mappers/schedule_mapper.dart';
import 'package:my_aueb/data/mappers/semester_mapper.dart';
import 'package:my_aueb/data/mappers/subject_mapper.dart';
import 'package:my_aueb/data/mappers/teacher_mapper.dart';
import 'package:my_aueb/data/repositories/courses_repository_impl.dart';
import 'package:my_aueb/data/repositories/exams_repository_impl.dart';
import 'package:my_aueb/data/repositories/lectures_repositoy_impl.dart';
import 'package:my_aueb/data/repositories/schedule_repository_impl.dart';
import 'package:my_aueb/data/repositories/semesters_repository_impl.dart';
import 'package:my_aueb/data/repositories/subjects_repository_impl.dart';
import 'package:my_aueb/data/repositories/teachers_repository_impl.dart';
import 'package:my_aueb/domain/repositories/courses_repository.dart';
import 'package:my_aueb/domain/repositories/exams_repository.dart';
import 'package:my_aueb/domain/repositories/lectures_repository.dart';
import 'package:my_aueb/domain/repositories/schedules_repository.dart';
import 'package:my_aueb/domain/repositories/semesters_repository.dart';
import 'package:my_aueb/domain/repositories/subjects_repository.dart';
import 'package:my_aueb/domain/repositories/teachers_repository.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/delete_course_use_case.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/get_all_courses_use_case.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/get_course_by_id_use_case.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/get_courses_by_semester_id_use_case.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/get_courses_by_subject_id_use_case.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/insert_course_use_case.dart';
import 'package:my_aueb/domain/use_cases/courses_use_cases/update_course_use_case.dart';
import 'package:my_aueb/domain/use_cases/exams_use_cases/delete_exam_use_case.dart';
import 'package:my_aueb/domain/use_cases/exams_use_cases/get_all_exams_use_case.dart';
import 'package:my_aueb/domain/use_cases/exams_use_cases/get_exams_by_id_use_case.dart';
import 'package:my_aueb/domain/use_cases/exams_use_cases/insert_exam_use_case.dart';
import 'package:my_aueb/domain/use_cases/exams_use_cases/update_exam_use_case.dart';
import 'package:my_aueb/domain/use_cases/lectures_use_cases/get_all_lectures_use_case.dart';
import 'package:my_aueb/domain/use_cases/lectures_use_cases/get_lectures_by_course_id_use_case.dart';
import 'package:my_aueb/domain/use_cases/semesters_use_cases/delete_semester_use_case.dart';
import 'package:my_aueb/domain/use_cases/semesters_use_cases/get_all_semesters_use_case.dart';
import 'package:my_aueb/domain/use_cases/semesters_use_cases/get_semester_by_id_use_case.dart';
import 'package:my_aueb/domain/use_cases/semesters_use_cases/insert_semester_use_case.dart';
import 'package:my_aueb/domain/use_cases/semesters_use_cases/update_semester_use_case.dart';
import 'package:my_aueb/domain/use_cases/subjects_use_cases/get_all_subjects_ordered_by_department_use_case.dart';
import 'package:my_aueb/domain/use_cases/subjects_use_cases/get_all_subjects_ordered_by_semester_type_use_case.dart';
import 'package:my_aueb/domain/use_cases/subjects_use_cases/get_all_subjects_ordered_by_subject_type_use_case.dart';
import 'package:my_aueb/domain/use_cases/subjects_use_cases/get_all_subjects_use_case.dart';
import 'package:my_aueb/domain/use_cases/subjects_use_cases/get_subjects_by_id_use_case.dart';
import 'package:my_aueb/domain/use_cases/subjects_use_cases/get_subjects_by_pattern_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_all_teachers_ordered_by_department_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_all_teachers_ordered_by_first_name_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_all_teachers_ordered_by_last_name_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_all_teachers_ordered_by_title_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_all_teachers_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_teacher_by_id_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_teachers_by_pattern_use_case.dart';
import 'package:my_aueb/presentation/blocs/course_detail_view_bloc/course_detail_view_bloc.dart';
import 'package:my_aueb/presentation/blocs/courses_view_bloc/courses_view_bloc.dart';
import 'package:my_aueb/presentation/blocs/exams_view_bloc/exams_view_bloc.dart';
import 'package:my_aueb/presentation/blocs/lactures_view_bloc/lectures_view_bloc.dart';
import 'package:my_aueb/presentation/blocs/semester_detail_view_bloc/semester_detail_view_bloc.dart';
import 'package:my_aueb/presentation/blocs/semesters_view_bloc/semesters_view_bloc.dart';
import 'package:my_aueb/presentation/blocs/subjects_view_bloc/subjects_view_bloc.dart';
import 'package:my_aueb/presentation/blocs/teachers_view_bloc/teachers_view_bloc.dart';

final injector = GetIt.instance;

Future<void> setupDependencies() async {
  injector.registerSingleton<Database>(await initializeDatabase());

  injector.registerSingleton<CoursesDao>(CoursesDao(injector()));
  injector.registerSingleton<ExamsDao>(ExamsDao(injector()));
  injector.registerSingleton<LecturesDao>(LecturesDao(injector()));
  injector.registerSingleton<SchedulesDao>(SchedulesDao(injector()));
  injector.registerSingleton<SemestersDao>(SemestersDao(injector()));
  injector.registerSingleton<SubjectsDao>(SubjectsDao(injector()));
  injector.registerSingleton<TeachersDao>(TeachersDao(injector()));

  injector.registerSingleton<CoursesRepository>(CoursesRepositoryImpl(injector()));
  injector.registerSingleton<ExamsRepository>(ExamsRepositoryImpl(injector()));
  injector.registerSingleton<LecturesRepository>(LecturesRepositoryImpl(injector()));
  injector.registerSingleton<SchedulesRepository>(SchedulesRepositoryImpl(injector()));
  injector.registerSingleton<SemestersRepository>(SemestersRepositoryImpl(injector()));
  injector.registerSingleton<SubjectsRepository>(SubjectsRepositoryImpl(injector()));
  injector.registerSingleton<TeachersRepository>(TeachersRepositoryImpl(injector()));

  // Courses use cases
  injector.registerSingleton<GetAllCoursesUseCase>(GetAllCoursesUseCase(injector()));
  injector.registerSingleton<GetCourseByIdUseCase>(GetCourseByIdUseCase(injector()));
  injector.registerSingleton<GetCoursesBySubjectIdUseCase>(GetCoursesBySubjectIdUseCase(injector()));
  injector.registerSingleton<GetCoursesBySemesterIdUseCase>(GetCoursesBySemesterIdUseCase(injector()));
  injector.registerSingleton<InsertCourseUseCase>(InsertCourseUseCase(injector()));
  injector.registerSingleton<UpdateCourseUseCase>(UpdateCourseUseCase(injector()));
  injector.registerSingleton<DeleteCourseUseCase>(DeleteCourseUseCase(injector()));

  // Exams use cases
  injector.registerSingleton<GetAllExamsUseCase>(GetAllExamsUseCase(injector()));
  injector.registerSingleton<GetExamByIdUseCase>(GetExamByIdUseCase(injector()));
  injector.registerSingleton<InsertExamUseCase>(InsertExamUseCase(injector()));
  injector.registerSingleton<UpdateExamUseCase>(UpdateExamUseCase(injector()));
  injector.registerSingleton<DeleteExamUseCase>(DeleteExamUseCase(injector()));

  // Lectures use cases
  injector.registerSingleton<GetAllLectuesUseCase>(GetAllLectuesUseCase(injector()));
  injector.registerSingleton<GetLecturesByCourseIdUseCase>(GetLecturesByCourseIdUseCase(injector()));
  injector.registerSingleton<DeleteLecturesByCourseIduseCase>(DeleteLecturesByCourseIduseCase(injector()));

  // Semesters use cases
  injector.registerSingleton<GetAllSemestersUseCase>(GetAllSemestersUseCase(injector()));
  injector.registerSingleton<GetSemesterByIdUseCase>(GetSemesterByIdUseCase(injector()));
  injector.registerSingleton<InsertSemesterUseCase>(InsertSemesterUseCase(injector()));
  injector.registerSingleton<UpdateSemesterUseCase>(UpdateSemesterUseCase(injector()));
  injector.registerSingleton<DeleteSemesterUseCase>(DeleteSemesterUseCase(injector()));

  // Subjects use cases
  injector.registerSingleton<GetAllSubjectsUseCase>(GetAllSubjectsUseCase(injector()));
  injector.registerSingleton<GetAllSubjectsOrderedBySubjectTypeUseCase>(
      GetAllSubjectsOrderedBySubjectTypeUseCase(injector()));
  injector.registerSingleton<GetAllSubjectsOrderedBySemesterTypeUseCase>(
      GetAllSubjectsOrderedBySemesterTypeUseCase(injector()));
  injector.registerSingleton<GetAllSubjectsOrderedByDepartmentUseCase>(
      GetAllSubjectsOrderedByDepartmentUseCase(injector()));
  injector.registerSingleton<GetSubjectsByPatternUseCase>(GetSubjectsByPatternUseCase(injector()));
  injector.registerSingleton<GetSubjectByIdUseCase>(GetSubjectByIdUseCase(injector()));

  // Teachers use cases
  injector.registerSingleton<GetAllTeachersUseCase>(GetAllTeachersUseCase(injector()));
  injector
      .registerSingleton<GetAllTeachersOrderedByFirstNameUseCase>(GetAllTeachersOrderedByFirstNameUseCase(injector()));
  injector
      .registerSingleton<GetAllTeachersOrderedByLastNameUseCase>(GetAllTeachersOrderedByLastNameUseCase(injector()));
  injector.registerSingleton<GetAllTeachersOrderedByTitleUseCase>(GetAllTeachersOrderedByTitleUseCase(injector()));
  injector.registerSingleton<GetAllTeachersOrderedByDepartmentUseCase>(
      GetAllTeachersOrderedByDepartmentUseCase(injector()));
  injector.registerSingleton<GetTeachersByPatternUseCase>(GetTeachersByPatternUseCase(injector()));
  injector.registerSingleton<GetTeacherByIdUseCase>(GetTeacherByIdUseCase(injector()));

  injector.registerSingleton<TeacherMapper>(TeacherMapper());
  injector.registerSingleton<SubjectMapper>(SubjectMapper());
  injector.registerSingleton<SemesterMapper>(SemesterMapper());
  injector.registerSingleton<ScheduleMapper>(ScheduleMapper());
  injector.registerSingleton<CourseMapper>(CourseMapper(
    injector(),
    injector(),
    injector(),
    injector(),
    injector(),
    injector(),
  ));
  injector.registerSingleton<LectureMapper>(LectureMapper(
    injector(),
    injector(),
    injector(),
    injector(),
  ));
  injector.registerSingleton<ExamMapper>(ExamMapper(
    injector(),
    injector(),
    injector(),
    injector(),
    injector(),
    injector(),
  ));

  injector.registerFactory<CoursesViewBloc>(() => CoursesViewBloc(injector(), injector(), injector(), injector()));
  injector.registerFactory<CourseDetailViewBloc>(() => CourseDetailViewBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<ExamsViewBloc>(() => ExamsViewBloc(injector(), injector()));
  injector.registerFactory<SemestersViewBloc>(() => SemestersViewBloc(injector(), injector()));
  injector.registerFactory<LecturesViewBloc>(() => LecturesViewBloc(injector(), injector()));
  injector.registerFactory<SubjectsViewBloc>(() => SubjectsViewBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<SemesterDetailViewBloc>(() => SemesterDetailViewBloc(
        injector(),
        injector(),
        injector(),
        injector(),
      ));
  injector.registerFactory<TeachersViewBloc>(() => TeachersViewBloc(
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
        injector(),
      ));
}
