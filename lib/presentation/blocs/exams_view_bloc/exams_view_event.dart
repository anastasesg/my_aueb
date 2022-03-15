part of 'exams_view_bloc.dart';

abstract class ExamsViewEvent extends Equatable {
  const ExamsViewEvent();

  @override
  List<Object> get props => [];
}

class ExamsViewGetExams extends ExamsViewEvent {}
