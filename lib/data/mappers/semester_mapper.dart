import 'package:my_aueb/core/custom_data_types/semester_type.dart';
import 'package:my_aueb/core/mapper/base_mapper.dart';
import 'package:my_aueb/data/models/semester.dart';
import 'package:my_aueb/domain/entities/semester_entity.dart';

class SemesterMapper extends BaseMapper<SemesterEntity, Semester> {
  @override
  List<SemesterEntity> toEntities(List<Semester> models) {
    return List.generate(models.length, (index) => toEntity(models[index]));
  }

  @override
  SemesterEntity toEntity(Semester model) {
    return SemesterEntity(
      id: model.id,
      semesterTypeValue: model.semesterType.toInt(),
      startDate: model.startDate,
      endDate: model.endDate,
      maxCredits: model.maxCredits,
    );
  }

  @override
  Future<Semester> toModel(SemesterEntity entity) {
    final semesterType = SemesterType(entity.semesterTypeValue);
    return Future.value(Semester(
        id: entity.id,
        semesterType: semesterType,
        startDate: entity.startDate,
        endDate: entity.endDate,
        maxCredits: entity.maxCredits));
  }

  @override
  Future<List<Semester>> toModels(List<SemesterEntity> entities) {
    return Future.wait(entities.map<Future<Semester>>((e) async => await toModel(e)));
  }
}
