import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:my_aueb/data/models/subject.dart';
import 'package:my_aueb/injector.dart';
import 'package:my_aueb/presentation/blocs/subjects_view_bloc/subjects_view_bloc.dart';
import 'package:my_aueb/presentation/widgets/items/subject_item.dart';
import 'package:my_aueb/presentation/widgets/navigation_drawer.dart';

class SubjectsView extends StatefulWidget {
  const SubjectsView({Key? key}) : super(key: key);

  @override
  State<SubjectsView> createState() => _SubjectsViewState();
}

class _SubjectsViewState extends State<SubjectsView> {
  String orderValue = "Ανά εξάμηνο";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<SubjectsViewBloc>()..add(SubjectsViewGetSubjectsOrderedBySemesterType()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Subjects')),
        drawer: const NavigationDrawer(currentRoute: '/subjects'),
        body: BlocBuilder<SubjectsViewBloc, SubjectsViewState>(
          builder: (context, state) {
            if (state is SubjectsViewLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is SubjectsViewDone) {
              List<Subject> subjects = state.subjects ?? [];
              int Function(Subject) groupBy = state.groupBy ?? (e) => 0;
              Widget Function(BuildContext, int) groupSeparator = state.groupSeparator ?? (c, e) => Container();
              if (subjects.isEmpty) {
                return const Center(
                  child: Text("You have no subjects registered."),
                );
              } else {
                return GroupedListView<Subject, int>(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                  stickyHeaderBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  useStickyGroupSeparators: true,
                  sort: false,
                  elements: subjects,
                  groupBy: groupBy,
                  groupSeparatorBuilder: (e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      groupSeparator(context, e),
                      DropdownButton(
                        isDense: true,
                        value: orderValue,
                        underline: Container(),
                        items: [
                          DropdownMenuItem(
                            child: const Text("Ανά εξάμηνο"),
                            value: "Ανά εξάμηνο",
                            onTap: () {
                              context.read<SubjectsViewBloc>().add(SubjectsViewGetSubjectsOrderedBySemesterType());
                            },
                          ),
                          DropdownMenuItem(
                            child: const Text("Ανά τμήμα"),
                            value: "Ανά τμήμα",
                            onTap: () {
                              context.read<SubjectsViewBloc>().add(SubjectsViewGetSubjectsOrderedByDepartment());
                            },
                          ),
                          DropdownMenuItem(
                            child: const Text("Ανά είδος"),
                            value: "Ανά είδος",
                            onTap: () {
                              context.read<SubjectsViewBloc>().add(SubjectsViewGetSubjectsOrderedBySubjectType());
                            },
                          )
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
                  itemBuilder: (context, subject) => SubjectItem(subject: subject),
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
