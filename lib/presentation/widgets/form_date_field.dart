import 'package:flutter/material.dart';

class FormDatePicker extends StatelessWidget {
  const FormDatePicker(
      {Key? key,
      required this.title,
      required this.req,
      required this.initialValue,
      required this.datePicker,
      this.spaceAfter = true})
      : super(key: key);

  final String title;
  final String initialValue;
  final bool req;
  final Function() datePicker;
  final bool spaceAfter;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        key: Key(initialValue),
        initialValue: initialValue,
        decoration: InputDecoration(border: const OutlineInputBorder(), labelText: "$title${req ? "*" : ""}"),
        onTap: datePicker,
        keyboardType: TextInputType.none,
      ),
      spaceAfter ? const SizedBox(height: 10) : Container()
    ]);
  }
}
