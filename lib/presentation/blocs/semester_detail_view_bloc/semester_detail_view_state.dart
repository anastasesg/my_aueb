part of 'semester_detail_view_bloc.dart';

abstract class SemesterDetailViewState extends Equatable {
  final Semester? semester;
  final List<Course>? courses;
  const SemesterDetailViewState({this.semester, this.courses});

  @override
  List<Object> get props => [];
}

class SemesterDetailViewLoading extends SemesterDetailViewState {}

class SemesterDetailViewDone extends SemesterDetailViewState {
  const SemesterDetailViewDone({
    required Semester semester,
    required List<Course> courses,
  }) : super(
          semester: semester,
          courses: courses,
        );
}
