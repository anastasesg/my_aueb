import 'package:my_aueb/core/custom_data_types/department.dart';
import 'package:my_aueb/core/custom_data_types/teacher_title.dart';
import 'package:my_aueb/core/mapper/base_mapper.dart';
import 'package:my_aueb/data/models/teacher.dart';
import 'package:my_aueb/domain/entities/teacher_entity.dart';

class TeacherMapper extends BaseMapper<TeacherEntity, Teacher> {
  @override
  List<TeacherEntity> toEntities(List<Teacher> models) {
    return List.generate(models.length, (index) => toEntity(models[index]));
  }

  @override
  TeacherEntity toEntity(Teacher model) {
    return TeacherEntity(
      id: model.id,
      firstName: model.firstName,
      lastName: model.lastName,
      phone: model.phone,
      email: model.email,
      titleValue: model.title.toInt(),
      departmentValue: model.department.toInt(),
    );
  }

  @override
  Future<Teacher> toModel(TeacherEntity entity) {
    final title = TeacherTitle(entity.titleValue);
    final department = Department(entity.departmentValue);
    return Future.value(Teacher(
      id: entity.id,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phone: entity.phone,
      email: entity.email,
      title: title,
      department: department,
    ));
  }

  @override
  Future<List<Teacher>> toModels(List<TeacherEntity> entities) {
    return Future.wait(entities.map<Future<Teacher>>((e) async => await toModel(e)));
  }
}
