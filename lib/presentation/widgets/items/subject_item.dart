import 'package:flutter/material.dart';

import 'package:my_aueb/data/models/subject.dart';
import 'package:my_aueb/presentation/widgets/expandable_card.dart';
import 'package:my_aueb/presentation/widgets/labeled_icon.dart';

class SubjectItem extends StatelessWidget {
  final Subject subject;
  const SubjectItem({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      title: LabeledIcon(icon: Icons.school_outlined, label: subject.name),
      details: [
        LabeledIcon(icon: Icons.tag, label: subject.code),
        LabeledIcon(icon: Icons.check_circle_outline, label: "Credits: ${subject.credits}"),
        LabeledIcon(icon: Icons.square_foot_outlined, label: subject.subjectType.toString()),
        LabeledIcon(icon: Icons.domain_outlined, label: subject.department.toString()),
        LabeledIcon(icon: Icons.tab_outlined, label: subject.semesterType.toString()),
      ],
    );
  }
}
