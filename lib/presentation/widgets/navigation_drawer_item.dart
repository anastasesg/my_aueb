import 'package:flutter/material.dart';

class NavigationDrawerItem extends StatelessWidget {
  final String title;
  final String route;
  final bool isActive;
  final IconData activeIcon;
  final IconData inactiveIcon;

  const NavigationDrawerItem(
      {Key? key,
      required this.title,
      required this.route,
      required this.isActive,
      required this.activeIcon,
      required this.inactiveIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(isActive ? activeIcon : inactiveIcon), const SizedBox(width: 10), Text(title)]),
      onTap: () {
        if (isActive) return;
        Navigator.of(context).pushReplacementNamed(route);
      },
    );
  }
}
