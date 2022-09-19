import 'package:flutter/material.dart'; //contains build in widgets + base class to create own widgets
import 'package:marq_app/page/overview_page.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marq_app/widget/skeleton_screens/shimmer_widget.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: const Color(0xFFf6f5ee),
        ),
        home: const OverviewPage(),
      );
}
