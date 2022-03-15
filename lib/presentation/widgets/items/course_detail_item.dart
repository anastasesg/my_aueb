import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/presentation/widgets/detail_card.dart';
import 'package:my_aueb/presentation/widgets/labeled_icon.dart';
import 'package:flutter/material.dart';

class CourseDetailItem extends StatefulWidget {
  final Course course;
  const CourseDetailItem({Key? key, required this.course}) : super(key: key);

  @override
  _CourseDetailItemState createState() => _CourseDetailItemState();
}

class _CourseDetailItemState extends State<CourseDetailItem> {
  @override
  Widget build(BuildContext context) {
    final Course course = widget.course;

    return DetailCard(
      details: [
        LabeledIcon(icon: Icons.label_outlined, label: course.subject.code),
        LabeledIcon(icon: Icons.tab_outlined, label: course.semester.getSemesterName()),
        LabeledIcon(icon: Icons.person_outline, label: course.teacher.toString()),
        LabeledIcon(icon: Icons.domain_outlined, label: course.subject.department.toString()),
        LabeledIcon(icon: Icons.check_circle_outline, label: "Credits: ${course.subject.credits}"),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Edit"),
            IconButton(
              onPressed: () {},
              iconSize: 20,
              splashRadius: 20,
              padding: const EdgeInsets.all(0),
              constraints: BoxConstraints.tight(const Size(20, 20)),
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ],
    );
  }
}
