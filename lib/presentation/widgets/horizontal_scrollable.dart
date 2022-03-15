import 'package:flutter/material.dart';

class HorizontalScrollable extends StatelessWidget {
  final Widget child;
  const HorizontalScrollable({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          child: child,
        ),
      );
    });
  }
}
