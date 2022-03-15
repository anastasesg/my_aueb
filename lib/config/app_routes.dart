import 'package:flutter/material.dart';

import 'package:my_aueb/presentation/views/course_detail_view.dart';
import 'package:my_aueb/presentation/views/courses_view.dart';
import 'package:my_aueb/presentation/views/exams_view.dart';
import 'package:my_aueb/presentation/views/home_view.dart';
import 'package:my_aueb/presentation/views/schedules_view.dart';
import 'package:my_aueb/presentation/views/semester_detail_view.dart';
import 'package:my_aueb/presentation/views/semesters_view.dart';
import 'package:my_aueb/presentation/views/subjects_view.dart';
import 'package:my_aueb/presentation/views/teachers_view.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomeView());
      case '/schedule':
        return _materialRoute(const SchedulsView());
      case '/subjects':
        return _materialRoute(const SubjectsView());
      case '/courses':
        return _materialRoute(const CoursesView());
      case '/semesters':
        return _materialRoute(const SemestersView());
      case '/exams':
        return _materialRoute(const ExamsView());
      case '/teachers':
        return _materialRoute(const TeachersView());
      case '/course_detail':
        return _materialRoute(CourseDetailView(id: settings.arguments! as int));
      case '/semester_detail':
        return _materialRoute(SemesterDetailView(id: settings.arguments! as int));
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return PageRouteBuilder(pageBuilder: (_, __, ___) => view);
  }
}
