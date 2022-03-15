part of 'teachers_view_bloc.dart';

abstract class TeachersViewState extends Equatable {
  final List<Teacher>? teachers;
  final dynamic Function(Teacher)? groupBy;
  final Widget Function(BuildContext, dynamic)? groupSeparator;
  const TeachersViewState({this.teachers, this.groupBy, this.groupSeparator});

  @override
  List<Object> get props => [
        teachers ?? [],
        groupBy ?? (e) => 0,
        groupSeparator ?? (c, e) => Container(),
      ];
}

class TeachersViewLoading extends TeachersViewState {}

class TeachersViewDone extends TeachersViewState {
  const TeachersViewDone({
    required List<Teacher> teachers,
    dynamic Function(Teacher)? groupBy,
    Widget Function(BuildContext, dynamic)? groupSeparator,
  }) : super(
          teachers: teachers,
          groupBy: groupBy,
          groupSeparator: groupSeparator,
        );
}
