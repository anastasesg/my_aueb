import 'package:flutter/material.dart';

import 'package:my_aueb/data/models/exam.dart';
import 'package:my_aueb/presentation/widgets/expandable_card.dart';
import 'package:my_aueb/presentation/widgets/labeled_icon.dart';

class ExamItem extends StatefulWidget {
  final Exam exam;
  const ExamItem({Key? key, required this.exam}) : super(key: key);

  @override
  _ExamItemState createState() => _ExamItemState();
}

class _ExamItemState extends State<ExamItem> {
  @override
  Widget build(BuildContext context) {
    final Exam exam = widget.exam;
    final bool _hasScore = exam.score != null;
    final bool _passed = _hasScore ? exam.score! >= 5.0 : false;
    return ExpandableCard(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _hasScore
              ? Icon(
                  _passed ? Icons.done : Icons.close,
                  color: Color(_passed ? Colors.green.value : Colors.red.value),
                )
              : const Icon(Icons.horizontal_rule),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              exam.subject.name,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).primaryTextTheme.subtitle1,
            ),
          ),
        ],
      ),
      details: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledIcon(icon: Icons.tab_outlined, label: exam.semester.getSemesterName()),
            LabeledIcon(icon: Icons.school_outlined, label: exam.subject.department.toString()),
            LabeledIcon(icon: Icons.fact_check_outlined, label: "Εξεταστική ${exam.period.toString()}"),
            LabeledIcon(icon: Icons.calendar_month_outlined, label: exam.getDate()),
            LabeledIcon(icon: Icons.location_on_outlined, label: exam.schedule.room),
            LabeledIcon(icon: Icons.tag, label: "Grade: ${exam.score ?? '-'}"),
          ],
        ),
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
    );
  }
}
