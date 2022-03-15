import 'package:my_aueb/core/mapper/base_mapper.dart';
import 'package:my_aueb/data/mappers/course_mapper.dart';
import 'package:my_aueb/data/mappers/schedule_mapper.dart';
import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/data/models/lecture.dart';
import 'package:my_aueb/data/models/schedule.dart';
import 'package:my_aueb/domain/entities/lecture_entity.dart';
import 'package:my_aueb/domain/repositories/courses_repository.dart';
import 'package:my_aueb/domain/repositories/schedules_repository.dart';

class LectureMapper extends BaseMapper<LectureEntity, Lecture> {
  final CoursesRepository _coursesRepository;
  final CourseMapper _courseMapper;
  final SchedulesRepository _schedulesRepository;
  final ScheduleMapper _scheduleMapper;

  LectureMapper(
    this._coursesRepository,
    this._courseMapper,
    this._schedulesRepository,
    this._scheduleMapper,
  );

  @override
  List<LectureEntity> toEntities(List<Lecture> models) {
    return List.generate(models.length, (index) => toEntity(models[index]));
  }

  @override
  LectureEntity toEntity(Lecture model) {
    return LectureEntity(
      id: model.id,
      courseId: model.course.id,
      scheduleId: model.schedule.id,
    );
  }

  @override
  Future<Lecture> toModel(LectureEntity entity) async {
    final Course course = await _courseMapper.toModel((await _coursesRepository.getCourseById(entity.courseId))!);
    final Schedule schedule =
        await _scheduleMapper.toModel((await _schedulesRepository.getScheduleById(entity.scheduleId))!);
    return Lecture(
      id: entity.id,
      course: course,
      schedule: schedule,
    );
  }

  @override
  Future<List<Lecture>> toModels(List<LectureEntity> entities) {
    return Future.wait(entities.map<Future<Lecture>>((e) async => await toModel(e)));
  }
}
