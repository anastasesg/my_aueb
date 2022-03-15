part of 'course_detail_view_bloc.dart';

abstract class CourseDetailViewEvent extends Equatable {
  final int? id;
  const CourseDetailViewEvent({this.id});

  @override
  List<Object> get props => [];
}

class CourseDetailViewGetDetails extends CourseDetailViewEvent {
  const CourseDetailViewGetDetails({required int id}) : super(id: id);
}
