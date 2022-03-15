import 'dart:math';

import 'package:flutter/material.dart';

class ShowMoreCard extends StatefulWidget {
  final Widget title;
  final Widget? details;
  const ShowMoreCard({
    Key? key,
    required this.title,
    this.details,
  }) : super(key: key);

  @override
  State<ShowMoreCard> createState() => _ShowMoreCardState();
}

class _ShowMoreCardState extends State<ShowMoreCard> with SingleTickerProviderStateMixin {
  bool _hideDetails = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
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
    bool _hasDetails = widget.details != null;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 10.0),
        child: Column(
          children: [
            widget.title,
            _hideDetails ? Container() : const Divider(),
            _hideDetails ? Container() : widget.details ?? Container(),
            _hideDetails ? Container() : const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  _hideDetails ? "More" : "Less",
                  style: TextStyle(
                      color: _hasDetails ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).disabledColor),
                ),
                RotationTransition(
                  turns: Tween(begin: 1.0, end: 0.0).animate(_controller),
                  child: IconButton(
                    onPressed: _hasDetails
                        ? () {
                            setState(() {
                              if (_hideDetails) {
                                _controller.forward(from: 0.0);
                              } else {
                                _controller.reverse(from: 1.0);
                              }
                              _hideDetails = !_hideDetails;
                            });
                          }
                        : null,
                    iconSize: 20,
                    splashRadius: 20,
                    padding: const EdgeInsets.all(0),
                    constraints: BoxConstraints.tight(const Size(20, 20)),
                    icon: Transform.rotate(
                      angle: pi / 2,
                      child: const Icon(Icons.chevron_right),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
