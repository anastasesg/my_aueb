part of 'semester_detail_view_bloc.dart';

abstract class SemesterDetailViewEvent extends Equatable {
  final int? id;
  const SemesterDetailViewEvent({this.id});

  @override
  List<Object> get props => [];
}

class SemesterDetailViewGetDetails extends SemesterDetailViewEvent {
  const SemesterDetailViewGetDetails({required int id}) : super(id: id);
}
