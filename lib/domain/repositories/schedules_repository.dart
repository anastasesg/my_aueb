import 'package:my_aueb/domain/entities/schedule_entity.dart';

abstract class SchedulesRepository {
  Future<List<ScheduleEntity>> getAllSchedules();
  Future<ScheduleEntity?> getScheduleById(int id);
}
