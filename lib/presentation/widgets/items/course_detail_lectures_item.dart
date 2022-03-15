import 'package:flutter/material.dart';
import 'package:my_aueb/core/custom_data_types/day.dart';

import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/data/models/lecture.dart';
import 'package:my_aueb/presentation/widgets/day_widget.dart';
import 'package:my_aueb/presentation/widgets/labeled_icon.dart';
import 'package:my_aueb/presentation/widgets/show_more_card.dart';

class CourseDetailLecturesItem extends StatefulWidget {
  final Course course;
  final List<Lecture> lectures;
  const CourseDetailLecturesItem({Key? key, required this.course, required this.lectures}) : super(key: key);

  @override
  _CourseDetailLecturesItemState createState() => _CourseDetailLecturesItemState();
}

class _CourseDetailLecturesItemState extends State<CourseDetailLecturesItem> {
  @override
  Widget build(BuildContext context) {
    final Course course = widget.course;
    final List<Lecture> lectures = widget.lectures;

    int mondayCount = lectures.where((element) => element.schedule.day == Day.Monday).length;
    int tuesdayCount = lectures.where((element) => element.schedule.day == Day.Tuesday).length;
    int wednesdayCount = lectures.where((element) => element.schedule.day == Day.Wednesday).length;
    int thursdayCount = lectures.where((element) => element.schedule.day == Day.Thursday).length;
    int fridayCount = lectures.where((element) => element.schedule.day == Day.Friday).length;

    return ShowMoreCard(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DayWidget(day: 'M', color: course.color, count: mondayCount),
          DayWidget(day: 'T', color: course.color, count: tuesdayCount),
          DayWidget(day: 'W', color: course.color, count: wednesdayCount),
          DayWidget(day: 'T', color: course.color, count: thursdayCount),
          DayWidget(day: 'F', color: course.color, count: fridayCount),
        ],
      ),
      details: lectures.isNotEmpty
          ? Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(0.25),
                1: FlexColumnWidth(0.35),
                2: FlexColumnWidth(0.4),
              },
              children: lectures.map<TableRow>((e) {
                return TableRow(
                  children: [
                    LabeledIcon(
                      icon: Icons.calendar_month_outlined,
                      label: "${e.schedule.day.getName().substring(0, 3)}.",
                      size: 20,
                    ),
                    LabeledIcon(
                      icon: Icons.location_on_outlined,
                      label: e.schedule.getRoom(),
                      size: 20,
                    ),
                    LabeledIcon(
                      icon: Icons.watch_later_outlined,
                      label: e.schedule.toString(),
                      size: 20,
                    ),
                  ],
                );
              }).toList(),
            )
          : null,
    );
  }
}
