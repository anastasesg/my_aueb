import 'dart:math';

import 'package:flutter/material.dart';

class ExpandableCard extends StatefulWidget {
  final Widget title;
  final List<Widget> details;
  final Function()? arrowAction;
  const ExpandableCard({
    Key? key,
    required this.title,
    required this.details,
    this.arrowAction,
  }) : super(key: key);

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> with SingleTickerProviderStateMixin {
  bool _hideDetails = true;
  late bool _hasAction;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _hasAction = widget.arrowAction != null;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      upperBound: 0.5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: widget.title,
                ),
                RotationTransition(
                  turns: Tween(begin: 0.0, end: _hasAction ? 0.5 : 1.0).animate(_controller),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_hideDetails) {
                          _controller.forward(from: 0.0);
                        } else {
                          _controller.reverse(from: 1.0);
                          if (_hasAction) {
                            widget.arrowAction!();
                          }
                        }
                        _hideDetails = !_hideDetails;
                      });
                    },
                    iconSize: 20,
                    splashRadius: 20,
                    padding: const EdgeInsets.all(0),
                    constraints: BoxConstraints.tight(const Size(20, 20)),
                    icon: Transform.rotate(
                      angle: pi / 2,
                      child: const Icon(Icons.chevron_left),
                    ),
                  ),
                ),
              ],
            ),
            ...(!_hideDetails ? [const Divider(), ...widget.details] : [Container()]),
          ],
        ),
      ),
    );
  }
}
