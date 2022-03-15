import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:my_aueb/data/mappers/lecture_mapper.dart';
import 'package:my_aueb/data/models/lecture.dart';
import 'package:my_aueb/domain/use_cases/lectures_use_cases/get_all_lectures_use_case.dart';

part 'lectures_view_event.dart';
part 'lectures_view_state.dart';

class LecturesViewBloc extends Bloc<LecturesViewEvent, LecturesViewState> {
  final GetAllLectuesUseCase _getAllLectuesUseCase;
  final LectureMapper _lectureMapper;

  LecturesViewBloc(
    this._getAllLectuesUseCase,
    this._lectureMapper,
  ) : super(LecturesViewLoading()) {
    on<LecturesViewGetLectures>((event, emit) async {
      List<Lecture> lectures = await _lectureMapper.toModels(await _getAllLectuesUseCase());
      emit(LecturesViewDone(lectures: lectures));
    });
  }
}
