import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/injector.dart';
import 'package:my_aueb/presentation/blocs/courses_view_bloc/courses_view_bloc.dart';
import 'package:my_aueb/presentation/widgets/items/course_item.dart';
import 'package:my_aueb/presentation/widgets/navigation_drawer.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<CoursesViewBloc>()..add(CoursesViewGetCourses()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Courses")),
        drawer: const NavigationDrawer(currentRoute: '/courses'),
        body: BlocBuilder<CoursesViewBloc, CoursesViewState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case CoursesViewLoading:
                return const Center(child: CircularProgressIndicator());
              case CoursesViewDone:
                List<Course> courses = state.courses ?? [];
                if (courses.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("You have no courses registered."),
                        Text("To add some, press the (+) button.")
                      ],
                    ),
                  );
                } else {
                  return GroupedListView<Course, int>(
                    elements: courses,
                    padding: const EdgeInsets.all(16.0),
                    groupBy: (e) => e.semester.id,
                    groupSeparatorBuilder: (id) => Container(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        courses.where((c) => c.semester.id == id).first.semester.getSemesterName(),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    itemBuilder: (context, course) => CourseItem(
                      course: course,
                      onDelete: (Course c) {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text("Delete ${c.subject.name}?"),
                              content: Text(
                                  "If you delete ${c.subject.name} you won't be able to recover it. This action will also delete any and all lectures associated with that course."),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                    },
                                    child: const Text("Nah, let it stay")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(ctx).pop();
                                      context.read<CoursesViewBloc>().add(CoursesViewDeleteCourse(course: c));
                                    },
                                    child: const Text("Delete it")),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                }
              default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
