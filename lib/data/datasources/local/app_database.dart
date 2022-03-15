import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> initializeDatabase() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  return openDatabase(
    join(await getDatabasesPath(), 'app_database.db'),
    onCreate: (db, version) async {
      // call database script that is saved in a file in assets
      String script = await rootBundle
          .loadString('assets/scripts/app_database.sql'); //.loadString(".\\assets\\scripts\\app_database.sql");
      List<String> scripts = script.split(";");
      for (var v in scripts) {
        if (v.isNotEmpty) {
          db.execute(v.trim());
        }
      }
    },
    version: 1,
  );
}
