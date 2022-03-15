part of 'semesters_view_bloc.dart';

abstract class SemestersViewEvent extends Equatable {
  const SemestersViewEvent();

  @override
  List<Object> get props => [];
}

class SemestersViewGetSemesters extends SemestersViewEvent {}
