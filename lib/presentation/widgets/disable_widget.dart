import 'package:flutter/material.dart';

class DisableWidget extends StatelessWidget {
  const DisableWidget({Key? key, required this.disable, required this.child}) : super(key: key);

  final bool disable;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(absorbing: disable, child: Opacity(opacity: disable ? 0.4 : 1.0, child: child));
  }
}
