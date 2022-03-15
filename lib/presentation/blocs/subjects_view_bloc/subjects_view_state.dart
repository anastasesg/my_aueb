part of 'subjects_view_bloc.dart';

abstract class SubjectsViewState extends Equatable {
  final List<Subject>? subjects;
  final int Function(Subject)? groupBy;
  final Widget Function(BuildContext, int)? groupSeparator;
  const SubjectsViewState({this.subjects, this.groupBy, this.groupSeparator});

  @override
  List<Object> get props => [
        subjects ?? [],
        groupBy ?? (e) => 0,
        groupSeparator ?? (c, e) => Container(),
      ];
}

class SubjectsViewLoading extends SubjectsViewState {}

class SubjectsViewDone extends SubjectsViewState {
  const SubjectsViewDone({
    required List<Subject> subjects,
    required int Function(Subject) groupBy,
    required Widget Function(BuildContext, int) groupSeparator,
  }) : super(
          subjects: subjects,
          groupBy: groupBy,
          groupSeparator: groupSeparator,
        );
}
