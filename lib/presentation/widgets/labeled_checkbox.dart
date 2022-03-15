import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  final String title;
  final bool initialValue;
  final Function(bool? value) onChanged;
  const LabeledCheckbox({Key? key, required this.title, required this.initialValue, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: initialValue,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
