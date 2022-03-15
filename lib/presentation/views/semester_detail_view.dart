import 'package:my_aueb/core/extensions/courses_list_extensions.dart';
import 'package:my_aueb/presentation/widgets/items/semester_detail_courses_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/data/models/semester.dart';
import 'package:my_aueb/injector.dart';
import 'package:my_aueb/presentation/blocs/semester_detail_view_bloc/semester_detail_view_bloc.dart';
import 'package:my_aueb/presentation/widgets/items/semester_detail_item.dart';
import 'package:my_aueb/presentation/widgets/vertical_scrollable.dart';

class SemesterDetailView extends StatefulWidget {
  final int id;
  const SemesterDetailView({Key? key, required this.id}) : super(key: key);

  @override
  State<SemesterDetailView> createState() => _SemesterDetailViewState();
}

class _SemesterDetailViewState extends State<SemesterDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<SemesterDetailViewBloc>()..add(SemesterDetailViewGetDetails(id: widget.id)),
      child: BlocBuilder<SemesterDetailViewBloc, SemesterDetailViewState>(
        builder: (context, state) {
          if (state is SemesterDetailViewLoading) {
            return const CupertinoActivityIndicator();
          } else if (state is SemesterDetailViewDone) {
            Semester semester = state.semester!;
            List<Course> courses = state.courses!;
            return Scaffold(
              appBar: AppBar(title: Text(semester.semesterType.toString())),
              body: VerticalScrollable(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SemesterDetailItem(
                        semester: semester,
                        declaredCredits: courses.getCredits(),
                        actualCredits: courses.getActualCredits(),
                      ),
                      SemesterDetailCoursesItem(courses: courses),
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
