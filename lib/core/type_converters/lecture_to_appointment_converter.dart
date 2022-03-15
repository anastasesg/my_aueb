import 'package:my_aueb/data/models/lecture.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class LecturesDataSource extends CalendarDataSource<Lecture> {
  LecturesDataSource({required List<Lecture> source}) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) => appointments![index].getStartTime();

  @override
  DateTime getEndTime(int index) => appointments![index].getEndTime();

  @override
  String getSubject(int index) => appointments![index].getSubject();

  @override
  Color getColor(int index) => appointments![index].course.color;

  @override
  String getRecurrenceRule(int index) => appointments![index].getRecurrenceRule();

  @override
  Lecture convertAppointmentToObject(Lecture customData, Appointment appointment) {
    return customData;
  }
}
