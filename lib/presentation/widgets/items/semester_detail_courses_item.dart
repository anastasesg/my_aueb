import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/presentation/widgets/detail_card.dart';
import 'package:my_aueb/presentation/widgets/labeled_icon.dart';
import 'package:flutter/material.dart';

class SemesterDetailCoursesItem extends StatelessWidget {
  final List<Course> courses;
  const SemesterDetailCoursesItem({Key? key, required this.courses}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return DetailCard(
      details: courses
          .map<Widget>((e) => LabeledIcon(
                icon: Icons.school_outlined,
                label: e.subject.name,
              ))
          .toList()
        ..add(
          const SizedBox(height: 10),
        ),
    );
  }
}
