import 'package:flutter/material.dart';

import 'package:my_aueb/presentation/widgets/vertical_scrollable.dart';

class ScrollableForm extends StatelessWidget {
  const ScrollableForm({Key? key, required this.formKey, required this.children}) : super(key: key);

  final GlobalKey<FormState> formKey;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Form(
        key: formKey,
        child: VerticalScrollable(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
