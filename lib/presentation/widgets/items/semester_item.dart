import 'package:my_aueb/data/models/semester.dart';
import 'package:my_aueb/presentation/widgets/expandable_card.dart';
import 'package:my_aueb/presentation/widgets/labeled_icon.dart';
import 'package:flutter/material.dart';

class SemesterItem extends StatefulWidget {
  final Semester semester;
  const SemesterItem({Key? key, required this.semester}) : super(key: key);

  @override
  _SemesterItemState createState() => _SemesterItemState();
}

class _SemesterItemState extends State<SemesterItem> {
  @override
  Widget build(BuildContext context) {
    final Semester semester = widget.semester;
    return ExpandableCard(
      title: Text(
        semester.getSemesterName(),
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).primaryTextTheme.subtitle1,
      ),
      details: [
        LabeledIcon(icon: Icons.calendar_today_outlined, label: semester.getSemesterDates()),
        LabeledIcon(icon: Icons.check_circle_outline, label: "Credits: ${semester.maxCredits}"),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 20,
              padding: const EdgeInsets.all(4),
              constraints: BoxConstraints.tight(const Size(38, 28)),
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {},
              iconSize: 20,
              padding: const EdgeInsets.all(4),
              constraints: BoxConstraints.tight(const Size(38, 28)),
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ],
      arrowAction: () => Navigator.of(context).pushNamed("/semester_detail", arguments: semester.id),
    );
  }
}
