import 'package:my_aueb/core/mapper/base_mapper.dart';
import 'package:my_aueb/data/mappers/semester_mapper.dart';
import 'package:my_aueb/data/mappers/subject_mapper.dart';
import 'package:my_aueb/data/mappers/teacher_mapper.dart';
import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/domain/entities/course_entity.dart';
import 'package:my_aueb/domain/repositories/semesters_repository.dart';
import 'package:my_aueb/domain/repositories/subjects_repository.dart';
import 'package:my_aueb/domain/repositories/teachers_repository.dart';
import 'package:flutter/material.dart';

class CourseMapper extends BaseMapper<CourseEntity, Course> {
  final SubjectsRepository _subjectsRepository;
  final SubjectMapper _subjectMapper;
  final SemestersRepository _semestersRepository;
  final SemesterMapper _semesterMapper;
  final TeachersRepository _teachersRepository;
  final TeacherMapper _teacherMapper;

  CourseMapper(
    this._subjectsRepository,
    this._subjectMapper,
    this._semestersRepository,
    this._semesterMapper,
    this._teachersRepository,
    this._teacherMapper,
  );

  @override
  List<CourseEntity> toEntities(List<Course> models) {
    return List.generate(models.length, (index) => toEntity(models[index]));
  }

  @override
  CourseEntity toEntity(Course model) {
    return CourseEntity(
      id: model.id,
      colorValue: model.color.value,
      subjectId: model.subject.id,
      semesterId: model.semester.id,
      teacherId: model.teacher.id,
    );
  }

  @override
  Future<Course> toModel(CourseEntity entity) async {
    final color = Color(entity.colorValue);
    final subject = await _subjectMapper.toModel((await _subjectsRepository.getSubjectById(entity.subjectId))!);
    final semester = await _semesterMapper.toModel((await _semestersRepository.getSemesterById(entity.semesterId))!);
    final teacher = await _teacherMapper.toModel((await _teachersRepository.getTeacherById(entity.teacherId))!);
    return Course(
      id: entity.id ?? -1,
      color: color,
      subject: subject,
      semester: semester,
      teacher: teacher,
    );
  }

  @override
  Future<List<Course>> toModels(List<CourseEntity> entities) {
    return Future.wait(entities.map<Future<Course>>((e) async => await toModel(e)));
  }
}
