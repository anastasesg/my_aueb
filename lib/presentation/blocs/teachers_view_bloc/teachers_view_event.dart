part of 'teachers_view_bloc.dart';

abstract class TeachersViewEvent extends Equatable {
  final String? pattern;
  const TeachersViewEvent({this.pattern});

  @override
  List<Object> get props => [pattern ?? ''];
}

class TeachersViewGetTeachersOrderedByFirstName extends TeachersViewEvent {}

class TeachersViewGetTeachersOrderedByLastName extends TeachersViewEvent {}

class TeachersViewGetTeachersOrderedByDepartment extends TeachersViewEvent {}

class TeachersViewGetTeachersOrderedByTitle extends TeachersViewEvent {}

class TeachersViewGetTeachersByName extends TeachersViewEvent {
  const TeachersViewGetTeachersByName({required String pattern}) : super(pattern: pattern);
}
