import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:my_aueb/core/custom_data_types/department.dart';
import 'package:my_aueb/core/custom_data_types/teacher_title.dart';
import 'package:my_aueb/core/extensions/string_extensions.dart';
import 'package:my_aueb/data/mappers/teacher_mapper.dart';
import 'package:my_aueb/data/models/teacher.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_all_teachers_ordered_by_department_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_all_teachers_ordered_by_first_name_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_all_teachers_ordered_by_last_name_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_all_teachers_ordered_by_title_use_case.dart';
import 'package:my_aueb/domain/use_cases/teachers_use_cases/get_teachers_by_pattern_use_case.dart';

part 'teachers_view_event.dart';
part 'teachers_view_state.dart';

class TeachersViewBloc extends Bloc<TeachersViewEvent, TeachersViewState> {
  final GetTeachersByPatternUseCase _getTeachersByPatternUseCase;
  final GetAllTeachersOrderedByFirstNameUseCase _getAllTeachersOrderedByFirstNameUseCase;
  final GetAllTeachersOrderedByLastNameUseCase _getAllTeachersOrderedByLastNameUseCase;
  final GetAllTeachersOrderedByDepartmentUseCase _getAllTeachersOrderedByDepartmentUseCase;
  final GetAllTeachersOrderedByTitleUseCase _getAllTeachersOrderedByTitleUseCase;
  final TeacherMapper _teacherMapper;

  TeachersViewBloc(
    this._getTeachersByPatternUseCase,
    this._getAllTeachersOrderedByFirstNameUseCase,
    this._getAllTeachersOrderedByLastNameUseCase,
    this._getAllTeachersOrderedByDepartmentUseCase,
    this._getAllTeachersOrderedByTitleUseCase,
    this._teacherMapper,
  ) : super(TeachersViewLoading()) {
    on<TeachersViewGetTeachersByName>((event, emit) async {
      List<Teacher> teachers =
          await _teacherMapper.toModels(await _getTeachersByPatternUseCase(params: event.pattern ?? ''));
      teachers.sort((a, b) => a.firstName.removeDiacritics().compareTo(b.firstName.removeDiacritics()));
      emit(TeachersViewDone(teachers: teachers));
    });
    on<TeachersViewGetTeachersOrderedByFirstName>((event, emit) async {
      List<Teacher> teachers = await _teacherMapper.toModels(await _getAllTeachersOrderedByFirstNameUseCase());
      teachers.sort((a, b) => a.firstName.removeDiacritics().compareTo(b.firstName.removeDiacritics()));
      emit(TeachersViewDone(
        teachers: teachers,
        groupBy: (e) => e.firstName.substring(0, 1).removeDiacritics(),
        groupSeparator: (context, value) => Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ));
    });
    on<TeachersViewGetTeachersOrderedByLastName>((event, emit) async {
      List<Teacher> teachers = await _teacherMapper.toModels(await _getAllTeachersOrderedByLastNameUseCase());
      teachers.sort((a, b) => a.lastName.removeDiacritics().compareTo(b.lastName.removeDiacritics()));
      emit(TeachersViewDone(
        teachers: teachers,
        groupBy: (e) => e.lastName.substring(0, 1).removeDiacritics(),
        groupSeparator: (context, value) => Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ));
    });
    on<TeachersViewGetTeachersOrderedByDepartment>((event, emit) async {
      List<Teacher> teachers = await _teacherMapper.toModels(await _getAllTeachersOrderedByDepartmentUseCase());
      emit(TeachersViewDone(
        teachers: teachers,
        groupBy: (e) => e.department.toInt(),
        groupSeparator: (context, value) => Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              Department(value).toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ));
    });
    on<TeachersViewGetTeachersOrderedByTitle>((event, emit) async {
      List<Teacher> teachers = await _teacherMapper.toModels(await _getAllTeachersOrderedByTitleUseCase());
      emit(TeachersViewDone(
        teachers: teachers,
        groupBy: (e) => e.title.toInt(),
        groupSeparator: (context, value) => Expanded(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              TeacherTitle(value).toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ));
    });
  }
}
