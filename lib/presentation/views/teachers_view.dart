import 'package:my_aueb/data/models/teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_aueb/injector.dart';
import 'package:my_aueb/presentation/blocs/teachers_view_bloc/teachers_view_bloc.dart';
import 'package:my_aueb/presentation/widgets/items/teacher_item.dart';
import 'package:my_aueb/presentation/widgets/navigation_drawer.dart';
import 'package:grouped_list/grouped_list.dart';

class TeachersView extends StatefulWidget {
  const TeachersView({Key? key}) : super(key: key);

  @override
  State<TeachersView> createState() => _TeachersViewState();
}

class _TeachersViewState extends State<TeachersView> {
  String orderValue = "Ανά Όνομα";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<TeachersViewBloc>()..add(TeachersViewGetTeachersOrderedByFirstName()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Teachers')),
        drawer: const NavigationDrawer(currentRoute: '/teachers'),
        body: BlocBuilder<TeachersViewBloc, TeachersViewState>(
          builder: (context, state) {
            if (state is TeachersViewLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is TeachersViewDone) {
              List<Teacher> teachers = state.teachers ?? [];
              dynamic Function(Teacher)? groupBy = state.groupBy;
              Widget Function(BuildContext, dynamic)? groupSeparator = state.groupSeparator;

              if (groupBy == null || groupSeparator == null) {
                return ListView.builder(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  itemCount: teachers.length,
                  itemBuilder: (context, id) => TeacherItem(teacher: teachers[id]),
                );
              } else {
                return GroupedListView<Teacher, dynamic>(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  stickyHeaderBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  useStickyGroupSeparators: true,
                  sort: false,
                  elements: teachers,
                  groupBy: groupBy,
                  groupSeparatorBuilder: (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      groupSeparator(context, e),
                      DropdownButton(
                        isDense: true,
                        value: orderValue,
                        underline: Container(),
                        items: [
                          DropdownMenuItem(
                            child: const Text("Ανά Όνομα"),
                            value: "Ανά Όνομα",
                            onTap: () {
                              context.read<TeachersViewBloc>().add(TeachersViewGetTeachersOrderedByFirstName());
                            },
                          ),
                          DropdownMenuItem(
                            child: const Text("Ανά Επίθετο"),
                            value: "Ανά Επίθετο",
                            onTap: () {
                              context.read<TeachersViewBloc>().add(TeachersViewGetTeachersOrderedByLastName());
                            },
                          ),
                          DropdownMenuItem(
                            child: const Text("Ανά Τμήμα"),
                            value: "Ανά Τμήμα",
                            onTap: () {
                              context.read<TeachersViewBloc>().add(TeachersViewGetTeachersOrderedByDepartment());
                            },
                          ),
                          DropdownMenuItem(
                            child: const Text("Ανά Τίτλο"),
                            value: "Ανά Τίτλο",
                            onTap: () {
                              context.read<TeachersViewBloc>().add(TeachersViewGetTeachersOrderedByTitle());
                            },
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(
                            () {
                              orderValue = value ?? "";
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  itemBuilder: (context, teacher) => TeacherItem(teacher: teacher),
                );
              }
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
