import 'package:flutter/material.dart';

import 'package:my_aueb/data/models/semester.dart';
import 'package:my_aueb/presentation/widgets/detail_card.dart';
import 'package:my_aueb/presentation/widgets/labeled_icon.dart';

class SemesterDetailItem extends StatelessWidget {
  final Semester semester;
  final double declaredCredits;
  final double actualCredits;
  const SemesterDetailItem({
    Key? key,
    required this.semester,
    required this.declaredCredits,
    required this.actualCredits,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxCredits = semester.maxCredits;
    return DetailCard(
      details: [
        LabeledIcon(icon: Icons.calendar_month_outlined, label: "Academic Year: ${semester.getAcademicYear()}"),
        LabeledIcon(icon: Icons.calendar_today_outlined, label: semester.getSemesterDates()),
        LabeledIcon(icon: Icons.check_circle_outline, label: "Declared Credits: $declaredCredits of $maxCredits"),
        LabeledIcon(icon: Icons.check_circle, label: "Actual Credits: $actualCredits of $maxCredits"),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Edit"),
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.all(0),
              constraints: BoxConstraints.tight(const Size(20, 20)),
              splashRadius: 20,
              icon: const Icon(Icons.chevron_right, size: 20),
            ),
          ],
        ),
      ],
    );
  }
}
