import 'package:my_aueb/core/custom_data_types/exam_period.dart';
import 'package:my_aueb/core/mapper/base_mapper.dart';
import 'package:my_aueb/data/mappers/schedule_mapper.dart';
import 'package:my_aueb/data/mappers/semester_mapper.dart';
import 'package:my_aueb/data/mappers/subject_mapper.dart';
import 'package:my_aueb/data/models/exam.dart';
import 'package:my_aueb/domain/entities/exam_entity.dart';
import 'package:my_aueb/domain/repositories/schedules_repository.dart';
import 'package:my_aueb/domain/repositories/semesters_repository.dart';
import 'package:my_aueb/domain/repositories/subjects_repository.dart';

class ExamMapper extends BaseMapper<ExamEntity, Exam> {
  final SubjectsRepository _subjectsRepository;
  final SemestersRepository _semestersRepository;
  final SchedulesRepository _schedulesRepository;

  final SubjectMapper _subjectMapper;
  final SemesterMapper _semesterMapper;
  final ScheduleMapper _scheduleMapper;

  ExamMapper(
    this._subjectsRepository,
    this._semestersRepository,
    this._schedulesRepository,
    this._subjectMapper,
    this._semesterMapper,
    this._scheduleMapper,
  );

  @override
  ExamEntity toEntity(Exam model) {
    return ExamEntity(
      id: model.id,
      date: model.date,
      score: model.score,
      subjectId: model.subject.id,
      scheduleId: model.schedule.id,
      semesterId: model.semester.id,
      examPeriodValue: model.period.toInt(),
    );
  }

  @override
  List<ExamEntity> toEntities(List<Exam> models) {
    return List.generate(models.length, (index) => toEntity(models[index]));
  }

  @override
  Future<Exam> toModel(ExamEntity entity) async {
    final subject = await _subjectMapper.toModel((await _subjectsRepository.getSubjectById(entity.subjectId))!);
    final semester = await _semesterMapper.toModel((await _semestersRepository.getSemesterById(entity.semesterId))!);
    final schedule = await _scheduleMapper.toModel((await _schedulesRepository.getScheduleById(entity.scheduleId))!);
    final period = ExamPeriod(entity.examPeriodValue);
    return Exam(
      id: entity.id,
      date: entity.date,
      score: entity.score,
      subject: subject,
      schedule: schedule,
      semester: semester,
      period: period,
    );
  }

  @override
  Future<List<Exam>> toModels(List<ExamEntity> entities) {
    return Future.wait(entities.map<Future<Exam>>((e) async => await toModel(e)));
  }
}
