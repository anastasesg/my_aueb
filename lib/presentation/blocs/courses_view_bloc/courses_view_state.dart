part of 'courses_view_bloc.dart';

abstract class CoursesViewState extends Equatable {
  final List<Course>? courses;
  const CoursesViewState({this.courses});

  @override
  List<Object> get props => [courses ?? []];
}

class CoursesViewLoading extends CoursesViewState {}

class CoursesViewDone extends CoursesViewState {
  const CoursesViewDone({required List<Course> courses}) : super(courses: courses);
}
