import 'package:my_aueb/core/custom_data_types/department.dart';
import 'package:my_aueb/core/custom_data_types/semester_type.dart';
import 'package:my_aueb/core/custom_data_types/subject_type.dart';
import 'package:my_aueb/core/mapper/base_mapper.dart';
import 'package:my_aueb/data/models/subject.dart';
import 'package:my_aueb/domain/entities/subject_entity.dart';

class SubjectMapper extends BaseMapper<SubjectEntity, Subject> {
  @override
  List<SubjectEntity> toEntities(List<Subject> models) {
    return List.generate(models.length, (index) => toEntity(models[index]));
  }

  @override
  SubjectEntity toEntity(Subject model) {
    return SubjectEntity(
      id: model.id,
      code: model.code,
      name: model.name,
      semesterTypeValue: model.semesterType.toInt(),
      departmentValue: model.department.toInt(),
      subjectTypeValue: model.subjectType.toInt(),
      credits: model.credits,
    );
  }

  @override
  Future<Subject> toModel(SubjectEntity entity) {
    final subjectType = SubjectType(entity.subjectTypeValue);
    final department = Department(entity.departmentValue);
    final semesterType = SemesterType(entity.semesterTypeValue);
    return Future.value(Subject(
      id: entity.id,
      code: entity.code,
      name: entity.name,
      subjectType: subjectType,
      department: department,
      semesterType: semesterType,
      credits: entity.credits,
    ));
  }

  @override
  Future<List<Subject>> toModels(List<SubjectEntity> entities) {
    return Future.wait(entities.map<Future<Subject>>((e) async => await toModel(e)));
  }
}
