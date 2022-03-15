import 'package:my_aueb/data/mappers/exam_mapper.dart';
import 'package:my_aueb/data/models/exam.dart';
import 'package:my_aueb/domain/use_cases/exams_use_cases/get_all_exams_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'exams_view_event.dart';
part 'exams_view_state.dart';

class ExamsViewBloc extends Bloc<ExamsViewEvent, ExamsViewState> {
  final GetAllExamsUseCase _getAllExamsUseCase;
  final ExamMapper _examMapper;
  ExamsViewBloc(this._getAllExamsUseCase, this._examMapper) : super(ExamsViewLoading()) {
    on<ExamsViewGetExams>((event, emit) async {
      emit(ExamsViewDone(exams: await _examMapper.toModels(await _getAllExamsUseCase())));
    });
  }
}
