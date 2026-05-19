import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wiki_reader/go_router.dart';
import 'package:hive/hive.dart';
import 'package:wiki_reader/summary_hive_box.dart';

Future main() async {
  await Hive.initFlutter();
  await Hive.openBox(summaryHiveBox);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router);
  }
}
