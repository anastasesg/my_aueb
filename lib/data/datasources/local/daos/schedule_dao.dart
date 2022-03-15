import 'package:my_aueb/config/constants.dart';
import 'package:my_aueb/domain/entities/schedule_entity.dart';
import 'package:sqflite/sqflite.dart';

class SchedulesDao {
  final Database _appDatabase;
  const SchedulesDao(this._appDatabase);

  Future<List<ScheduleEntity>> getAllSchedules() async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kScheduleTable);
    return List.generate(
      maps.length,
      (i) => ScheduleEntity.fromMap(maps[i]),
    );
  }

  Future<ScheduleEntity?> getScheduleById(int id) async {
    final List<Map<String, dynamic>> maps = await _appDatabase.query(kScheduleTable, where: "id = ?", whereArgs: [id]);
    return List.generate(maps.length, (i) => ScheduleEntity.fromMap(maps[i])).first;
  }
}
