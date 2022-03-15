import 'package:flutter/material.dart';

class ConfirmOnLeave extends StatelessWidget {
  const ConfirmOnLeave({Key? key, required this.title, required this.child}) : super(key: key);

  final String title;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(title),
                content: const Text('Are you sure you want to leave? Any and all changes you made will be lost!'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: const Text('Leave'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            },
          );
          return value == true;
        },
        child: child);
  }
}
