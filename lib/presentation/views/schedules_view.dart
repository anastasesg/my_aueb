import 'package:my_aueb/core/type_converters/lecture_to_appointment_converter.dart';
import 'package:my_aueb/data/models/lecture.dart';
import 'package:my_aueb/injector.dart';
import 'package:my_aueb/presentation/blocs/lactures_view_bloc/lectures_view_bloc.dart';
import 'package:my_aueb/presentation/widgets/navigation_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SchedulsView extends StatefulWidget {
  const SchedulsView({Key? key}) : super(key: key);

  @override
  State<SchedulsView> createState() => _SchedulsViewState();
}

class _SchedulsViewState extends State<SchedulsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<LecturesViewBloc>()..add(LecturesViewGetLectures()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Schedule')),
        drawer: const NavigationDrawer(currentRoute: '/schedule'),
        body: BlocBuilder<LecturesViewBloc, LecturesViewState>(builder: (context, state) {
          if (state is LecturesViewLoading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is LecturesViewDone) {
            List<Lecture> lectures = state.lectures ?? [];
            return SfCalendar(
              view: CalendarView.workWeek,
              onTap: (CalendarTapDetails calendarTapDetails) {
                if (calendarTapDetails.appointments == null) return;
                Navigator.pushNamed(
                  context,
                  '/course_detail',
                  arguments: calendarTapDetails.appointments![0].course.id,
                );
              },
              dataSource: LecturesDataSource(source: lectures),
              showDatePickerButton: true,
              timeSlotViewSettings: const TimeSlotViewSettings(
                timeIntervalHeight: 100,
                timeInterval: Duration(hours: 2),
                startHour: 9,
                endHour: 21,
              ),
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
