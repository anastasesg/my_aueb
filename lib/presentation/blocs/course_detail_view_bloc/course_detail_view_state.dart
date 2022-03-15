part of 'course_detail_view_bloc.dart';

abstract class CourseDetailViewState extends Equatable {
  final Course? course;
  final List<Lecture>? lectures;
  final List<Exam>? exams;
  const CourseDetailViewState({this.course, this.lectures, this.exams});

  @override
  List<Object> get props => [];
}

class CourseDetailViewLoading extends CourseDetailViewState {}

class CourseDetailViewDone extends CourseDetailViewState {
  const CourseDetailViewDone({
    required Course course,
    required List<Lecture> lectures,
    // required List<Exam> exams,
  }) : super(
          course: course,
          lectures: lectures,
          // exams: exams,
        );
}
