import 'package:my_aueb/config/constants.dart';
import 'package:my_aueb/presentation/widgets/navigation_drawer_item.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  final String? currentRoute;
  const NavigationDrawer({Key? key, required this.currentRoute}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 34),
          const ListTile(title: Text(kAppName, style: TextStyle(fontSize: 32))),
          const SizedBox(height: 10),
          NavigationDrawerItem(
              title: "Home",
              route: '/',
              isActive: widget.currentRoute == '/',
              activeIcon: Icons.home,
              inactiveIcon: Icons.home_outlined),
          const Divider(
            indent: 15,
            endIndent: 30,
          ),
          NavigationDrawerItem(
              title: "Schedule",
              route: '/schedule',
              isActive: widget.currentRoute == '/schedule',
              activeIcon: Icons.watch_later,
              inactiveIcon: Icons.watch_later_outlined),
          NavigationDrawerItem(
              title: "Courses",
              route: '/courses',
              isActive: widget.currentRoute == '/courses',
              activeIcon: Icons.school,
              inactiveIcon: Icons.school_outlined),
          NavigationDrawerItem(
              title: "Semesters",
              route: '/semesters',
              isActive: widget.currentRoute == '/semesters',
              activeIcon: Icons.tab,
              inactiveIcon: Icons.tab_outlined),
          NavigationDrawerItem(
              title: "Exams",
              route: '/exams',
              isActive: widget.currentRoute == '/exams',
              activeIcon: Icons.fact_check,
              inactiveIcon: Icons.fact_check_outlined),
          const Divider(
            indent: 15,
            endIndent: 30,
          ),
          NavigationDrawerItem(
              title: "Subjects",
              route: '/subjects',
              isActive: widget.currentRoute == '/subjects',
              activeIcon: Icons.book,
              inactiveIcon: Icons.book_outlined),
          NavigationDrawerItem(
              title: "Teachers",
              route: '/teachers',
              isActive: widget.currentRoute == '/teachers',
              activeIcon: Icons.people,
              inactiveIcon: Icons.people_outline),
        ],
      ),
    );
  }
}
