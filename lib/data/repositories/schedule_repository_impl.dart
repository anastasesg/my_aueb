import 'package:my_aueb/data/datasources/local/daos/schedule_dao.dart';
import 'package:my_aueb/domain/entities/schedule_entity.dart';
import 'package:my_aueb/domain/repositories/schedules_repository.dart';

class SchedulesRepositoryImpl extends SchedulesRepository {
  final SchedulesDao _schedulesDao;
  SchedulesRepositoryImpl(this._schedulesDao);

  @override
  Future<List<ScheduleEntity>> getAllSchedules() {
    return _schedulesDao.getAllSchedules();
  }

  @override
  Future<ScheduleEntity?> getScheduleById(int id) {
    return _schedulesDao.getScheduleById(id);
  }
}
