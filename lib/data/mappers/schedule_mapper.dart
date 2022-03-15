import 'package:my_aueb/core/custom_data_types/day.dart';
import 'package:my_aueb/core/custom_data_types/schedule_type.dart';
import 'package:my_aueb/core/mapper/base_mapper.dart';
import 'package:my_aueb/data/models/schedule.dart';
import 'package:my_aueb/domain/entities/schedule_entity.dart';

class ScheduleMapper extends BaseMapper<ScheduleEntity, Schedule> {
  @override
  List<ScheduleEntity> toEntities(List<Schedule> models) {
    return List.generate(models.length, (index) => toEntity(models[index]));
  }

  @override
  ScheduleEntity toEntity(Schedule model) {
    return ScheduleEntity(
      id: model.id,
      startTime: model.startTime,
      endTime: model.endTime,
      room: model.room,
      dayValue: model.day.toInt(),
      scheduleTypeValue: model.scheduleType.toInt(),
    );
  }

  @override
  Future<Schedule> toModel(ScheduleEntity entity) {
    final day = Day.Undefined.fromInt(entity.dayValue);
    final scheduleType = ScheduleType(entity.scheduleTypeValue);
    return Future.value(Schedule(
        id: entity.id,
        startTime: entity.startTime,
        endTime: entity.endTime,
        room: entity.room,
        day: day,
        scheduleType: scheduleType));
  }

  @override
  Future<List<Schedule>> toModels(List<ScheduleEntity> entities) {
    return Future.wait(entities.map<Future<Schedule>>((e) async => await toModel(e)));
  }
}
