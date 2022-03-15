part of 'lectures_view_bloc.dart';

abstract class LecturesViewState extends Equatable {
  final List<Lecture>? lectures;
  const LecturesViewState({this.lectures});

  @override
  List<Object> get props => [lectures ?? []];
}

class LecturesViewLoading extends LecturesViewState {}

class LecturesViewDone extends LecturesViewState {
  const LecturesViewDone({required List<Lecture> lectures}) : super(lectures: lectures);
}
