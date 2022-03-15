import 'package:flutter/material.dart';
// import 'package:university_manager/src/core/utils/base_validator.dart';

class FormTextField extends StatelessWidget {
  const FormTextField({
    Key? key,
    this.title,
    this.leading,
    this.keyboardType,
    this.disable,
    this.textInputAction,
    this.controller,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.onSaved,
    this.initialValue,
  }) : super(key: key);

  final String? title;
  final String? initialValue;
  final Widget? leading;
  final bool? disable;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            leading ?? Container(),
            const SizedBox(width: 10),
            Expanded(
              child: AbsorbPointer(
                absorbing: disable ?? false,
                child: TextFormField(
                  key: initialValue != null ? Key(initialValue!) : null,
                  decoration: InputDecoration(label: Text(title ?? '')),
                  initialValue: initialValue,
                  keyboardType: keyboardType,
                  controller: controller,
                  textInputAction: textInputAction,
                  onChanged: onChanged,
                  onFieldSubmitted: onFieldSubmitted,
                  onSaved: onSaved,
                ),
              ),
            ),
          ],
        ));
  }
}
