part of 'subjects_view_bloc.dart';

abstract class SubjectsViewEvent extends Equatable {
  const SubjectsViewEvent();

  @override
  List<Object> get props => [];
}

class SubjectsViewGetSubjectsOrderedBySubjectType extends SubjectsViewEvent {}

class SubjectsViewGetSubjectsOrderedBySemesterType extends SubjectsViewEvent {}

class SubjectsViewGetSubjectsOrderedByDepartment extends SubjectsViewEvent {}
