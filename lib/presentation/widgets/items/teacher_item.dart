import 'package:my_aueb/data/models/teacher.dart';
import 'package:my_aueb/presentation/widgets/expandable_card.dart';
import 'package:my_aueb/presentation/widgets/labeled_icon.dart';
import 'package:flutter/material.dart';

class TeacherItem extends StatefulWidget {
  final Teacher teacher;
  const TeacherItem({Key? key, required this.teacher}) : super(key: key);

  @override
  State<TeacherItem> createState() => _TeacherItemState();
}

class _TeacherItemState extends State<TeacherItem> {
  @override
  Widget build(BuildContext context) {
    Teacher teacher = widget.teacher;
    return ExpandableCard(
      title: LabeledIcon(icon: Icons.person_outlined, label: "${teacher.firstName} ${teacher.lastName}"),
      details: [
        LabeledIcon(icon: Icons.phone_outlined, label: teacher.phone == '' ? "No phone data" : "+30 ${teacher.phone}"),
        LabeledIcon(icon: Icons.email_outlined, label: teacher.email == '' ? "No email data" : teacher.email),
        LabeledIcon(icon: Icons.domain_outlined, label: teacher.department.toString()),
        LabeledIcon(icon: Icons.title_outlined, label: teacher.title.toString()),
      ],
    );
  }
}
