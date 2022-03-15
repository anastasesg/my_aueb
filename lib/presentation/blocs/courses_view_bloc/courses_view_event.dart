part of 'courses_view_bloc.dart';

abstract class CoursesViewEvent extends Equatable {
  final Course? course;
  const CoursesViewEvent({this.course});

  @override
  List<Object> get props => [];
}

class CoursesViewGetCourses extends CoursesViewEvent {}

class CoursesViewDeleteCourse extends CoursesViewEvent {
  const CoursesViewDeleteCourse({required Course course}) : super(course: course);
}
