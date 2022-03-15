import 'package:my_aueb/data/mappers/semester_mapper.dart';
import 'package:my_aueb/data/models/semester.dart';
import 'package:my_aueb/domain/use_cases/semesters_use_cases/get_all_semesters_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'semesters_view_event.dart';
part 'semesters_view_state.dart';

class SemestersViewBloc extends Bloc<SemestersViewEvent, SemestersViewState> {
  final GetAllSemestersUseCase _getAllSemestersUseCase;
  final SemesterMapper _semesterMapper;

  SemestersViewBloc(this._getAllSemestersUseCase, this._semesterMapper) : super(SemestersViewLoading()) {
    on<SemestersViewGetSemesters>((event, emit) async {
      emit(SemestersViewDone(semesters: await _semesterMapper.toModels(await _getAllSemestersUseCase())));
    });
  }
}
