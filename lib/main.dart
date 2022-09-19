// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart'; //contains build in widgets + base class to create own widgets
import 'package:marq_app/page/overview_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        /*  theme: ThemeData(
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: const Color(0xFFf6f5ee),
        ), */
        home: OverviewPage(),
      );
}
