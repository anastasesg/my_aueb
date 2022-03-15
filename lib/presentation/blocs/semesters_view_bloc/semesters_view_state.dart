part of 'semesters_view_bloc.dart';

abstract class SemestersViewState extends Equatable {
  final List<Semester>? semesters;
  const SemestersViewState({this.semesters});

  @override
  List<Object> get props => [];
}

class SemestersViewLoading extends SemestersViewState {}

class SemestersViewDone extends SemestersViewState {
  const SemestersViewDone({required List<Semester> semesters}) : super(semesters: semesters);
}
