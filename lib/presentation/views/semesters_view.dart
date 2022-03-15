import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_aueb/injector.dart';
import 'package:my_aueb/presentation/blocs/semesters_view_bloc/semesters_view_bloc.dart';
import 'package:my_aueb/presentation/widgets/items/semester_item.dart';
import 'package:my_aueb/presentation/widgets/navigation_drawer.dart';

class SemestersView extends StatefulWidget {
  const SemestersView({Key? key}) : super(key: key);

  @override
  State<SemestersView> createState() => _SemestersViewState();
}

class _SemestersViewState extends State<SemestersView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<SemestersViewBloc>()..add(SemestersViewGetSemesters()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Semesters')),
        drawer: const NavigationDrawer(currentRoute: '/semesters'),
        body: BlocBuilder<SemestersViewBloc, SemestersViewState>(
          builder: (context, state) {
            if (state is SemestersViewLoading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is SemestersViewDone) {
              if (state.semesters!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("You have no semesters registered."),
                      Text("To add some, press the (+) button.")
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: state.semesters!.length,
                  itemBuilder: (context, index) => SemesterItem(semester: state.semesters![index]),
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
