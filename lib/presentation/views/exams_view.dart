import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_aueb/injector.dart';
import 'package:my_aueb/presentation/blocs/exams_view_bloc/exams_view_bloc.dart';
import 'package:my_aueb/presentation/widgets/items/exam_item.dart';
import 'package:my_aueb/presentation/widgets/navigation_drawer.dart';

class ExamsView extends StatefulWidget {
  const ExamsView({Key? key}) : super(key: key);

  @override
  State<ExamsView> createState() => _ExamsViewState();
}

class _ExamsViewState extends State<ExamsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<ExamsViewBloc>()..add(ExamsViewGetExams()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Exams')),
        drawer: const NavigationDrawer(currentRoute: '/exams'),
        body: BlocBuilder<ExamsViewBloc, ExamsViewState>(
          builder: (context, state) {
            if (state is ExamsViewLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is ExamsViewDone) {
              if (state.exams!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("You have no exams registered."),
                      Text("To add some, press the (+) button."),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: state.exams?.length ?? 0,
                  itemBuilder: (context, index) => ExamItem(exam: state.exams![index]),
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
