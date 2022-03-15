import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/data/models/lecture.dart';
import 'package:my_aueb/injector.dart';
import 'package:my_aueb/presentation/blocs/course_detail_view_bloc/course_detail_view_bloc.dart';
import 'package:my_aueb/presentation/widgets/items/course_detail_item.dart';
import 'package:my_aueb/presentation/widgets/items/course_detail_lectures_item.dart';
import 'package:my_aueb/presentation/widgets/themed_app_bar.dart';
import 'package:my_aueb/presentation/widgets/vertical_scrollable.dart';

class CourseDetailView extends StatefulWidget {
  final int id;

  const CourseDetailView({Key? key, required this.id}) : super(key: key);

  @override
  State<CourseDetailView> createState() => _CourseDetailViewState();
}

class _CourseDetailViewState extends State<CourseDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<CourseDetailViewBloc>()..add(CourseDetailViewGetDetails(id: widget.id)),
      child: BlocBuilder<CourseDetailViewBloc, CourseDetailViewState>(
        builder: (context, state) {
          if (state is CourseDetailViewLoading) {
            return const CupertinoActivityIndicator();
          } else if (state is CourseDetailViewDone) {
            Course course = state.course!;
            List<Lecture> lectures = state.lectures ?? [];
            // List<Exam> exams = state.exams!;
            return Scaffold(
              appBar: ThemedAppBar(
                title: Text(course.subject.name),
                backgroundColor: course.color,
                elevation: 4,
              ),
              body: VerticalScrollable(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CourseDetailItem(course: course),
                      CourseDetailLecturesItem(course: course, lectures: lectures)
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
