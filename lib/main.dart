import 'package:flutter/material.dart';

import 'package:my_aueb/config/app_routes.dart';
import 'package:my_aueb/config/app_theme.dart';
import 'package:my_aueb/config/constants.dart';
import 'package:my_aueb/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: kAppName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.dark,
        initialRoute: '/',
        onGenerateRoute: (settings) => AppRoutes.onGenerateRoutes(settings));
  }
}
