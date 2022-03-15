part of 'exams_view_bloc.dart';

abstract class ExamsViewState extends Equatable {
  final List<Exam>? exams;
  const ExamsViewState({this.exams});

  @override
  List<Object> get props => [exams ?? []];
}

class ExamsViewLoading extends ExamsViewState {}

class ExamsViewDone extends ExamsViewState {
  const ExamsViewDone({required List<Exam> exams}) : super(exams: exams);
}
