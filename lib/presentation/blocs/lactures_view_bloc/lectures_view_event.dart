part of 'lectures_view_bloc.dart';

abstract class LecturesViewEvent extends Equatable {
  const LecturesViewEvent();

  @override
  List<Object> get props => [];
}

class LecturesViewGetLectures extends LecturesViewEvent {}
