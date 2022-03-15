import 'package:flutter/material.dart';

class VerticalScrollable extends StatelessWidget {
  final Widget child;
  const VerticalScrollable({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: child,
        ),
      );
    });
  }
}
