import 'package:flutter/material.dart';

import 'package:my_aueb/data/models/course.dart';
import 'package:my_aueb/presentation/widgets/expandable_card.dart';
import 'package:my_aueb/presentation/widgets/labeled_icon.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  final Function(Course course) onDelete;
  const CourseItem({Key? key, required this.course, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15,
            height: 15,
            child: Container(decoration: BoxDecoration(color: course.color, shape: BoxShape.circle)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              course.subject.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
          ),
        ],
      ),
      details: [
        LabeledIcon(icon: Icons.label_outlined, label: course.subject.code),
        LabeledIcon(icon: Icons.person_outline, label: course.teacher.getConcatedTeacherName()),
        LabeledIcon(icon: Icons.domain_outlined, label: course.subject.department.toString()),
        LabeledIcon(icon: Icons.check_circle_outline, label: "Credits: ${course.subject.credits}"),
        const Divider(),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 20,
              splashRadius: 20,
              padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
              constraints: BoxConstraints.tight(const Size(30, 20)),
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () => onDelete(course),
              iconSize: 20,
              splashRadius: 20,
              padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
              constraints: BoxConstraints.tight(const Size(30, 20)),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ],
      arrowAction: () => Navigator.of(context).pushNamed("/course_detail", arguments: course.id),
    );
  }
}
