import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:my_aueb/core/custom_data_types/department.dart';
import 'package:my_aueb/core/custom_data_types/semester_type.dart';
import 'package:my_aueb/core/custom_data_types/subject_type.dart';
import 'package:my_aueb/data/mappers/subject_mapper.dart';
import 'package:my_aueb/data/models/subject.dart';
import 'package:my_aueb/domain/use_cases/subjects_use_cases/get_all_subjects_ordered_by_department_use_case.dart';
import 'package:my_aueb/domain/use_cases/subjects_use_cases/get_all_subjects_ordered_by_semester_type_use_case.dart';
import 'package:my_aueb/domain/use_cases/subjects_use_cases/get_all_subjects_ordered_by_subject_type_use_case.dart';

part 'subjects_view_event.dart';
part 'subjects_view_state.dart';

class SubjectsViewBloc extends Bloc<SubjectsViewEvent, SubjectsViewState> {
  final GetAllSubjectsOrderedBySubjectTypeUseCase _getAllSubjectsOrderedBySubjectTypeUseCase;
  final GetAllSubjectsOrderedBySemesterTypeUseCase _getAllSubjectsOrderedBySemesterTypeUseCase;
  final GetAllSubjectsOrderedByDepartmentUseCase _getAllSubjectsOrderedByDepartmentUseCase;
  final SubjectMapper _subjectMapper;
  SubjectsViewBloc(
    this._subjectMapper,
    this._getAllSubjectsOrderedBySubjectTypeUseCase,
    this._getAllSubjectsOrderedBySemesterTypeUseCase,
    this._getAllSubjectsOrderedByDepartmentUseCase,
  ) : super(SubjectsViewLoading()) {
    on<SubjectsViewGetSubjectsOrderedBySubjectType>((event, emit) async {
      List<Subject> subjects = await _subjectMapper.toModels(await _getAllSubjectsOrderedBySubjectTypeUseCase());
      emit(
        SubjectsViewDone(
          subjects: subjects,
          groupBy: (e) => e.subjectType.toInt(),
          groupSeparator: (context, value) => Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                SubjectType(value).toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
      );
    });
    on<SubjectsViewGetSubjectsOrderedBySemesterType>((event, emit) async {
      List<Subject> subjects = await _subjectMapper.toModels(await _getAllSubjectsOrderedBySemesterTypeUseCase());
      emit(
        SubjectsViewDone(
          subjects: subjects,
          groupBy: (e) => e.semesterType.toInt(),
          groupSeparator: (context, value) => Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                SemesterType(value).toString(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
      );
    });
    on<SubjectsViewGetSubjectsOrderedByDepartment>((event, emit) async {
      List<Subject> subjects = await _subjectMapper.toModels(await _getAllSubjectsOrderedByDepartmentUseCase());
      emit(
        SubjectsViewDone(
          subjects: subjects,
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
        ),
      );
    });
  }
}
