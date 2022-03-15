import 'package:my_aueb/presentation/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      drawer: const NavigationDrawer(currentRoute: '/'),
      body: const Center(
        child: Text('This is the home page'),
      ),
    );
  }
}
