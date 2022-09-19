import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:marq_app/main.dart';
import 'package:marq_app/widget/skeleton_screens/shimmer_widget.dart';
import 'dart:async';

import '../widget/todo_list_widget.dart';
import '../widget/aktions_finder_page.dart';
//import 'package:marq_app/assets/logo_aktionsfinder_klein.json';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  int selectedIndex = 0;
  late bool _isLoadingShimmer = false;

  _loadData() {
    _isLoadingShimmer = true;

    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() {
        _isLoadingShimmer = false;
      });
    });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      AktionsFinderPage(),
      const TodoListWidget(),
    ];

    return _isLoadingShimmer
        ? buildScaffoldShimmer()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 238, 115, 48),
              elevation: 0,
              toolbarHeight: 80,
              leading:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey[300],
                          size: 26,
                        )),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color.fromARGB(255, 238, 115, 48),
              unselectedItemColor: Colors.white.withOpacity(0.7),
              selectedItemColor: Colors.white,
              currentIndex: selectedIndex,
              onTap: (index) => setState(() {
                selectedIndex = index;
              }),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.fact_check_outlined),
                  label: "TO DO's",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.done, size: 28),
                  label: "Geschafft!",
                ),
              ],
            ),
            body: tabs[selectedIndex],

            //Add TO DO Task BUTTON
            /* floatingActionButton: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              backgroundColor: Colors.amber,
              onPressed: (() => showDialog(
                    builder: (context) => AddTodoDialog(),
                    context: context,
                  )),
              child: const Icon(Icons.add),
            ), */
          );
  }

  Widget buildScaffoldShimmer() => Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Container(
            color: const Color.fromARGB(255, 238, 115, 48),
            child: Column(
              children: [
                Lottie.asset(
                  'assets/logo_aktionsfinder_bigger.json',
                ),
              ],
            ),
          ),
        ),
        body: Container(
          color: const Color.fromARGB(255, 243, 243, 243),
        ),
        bottomNavigationBar: const ShimmerWidget.rectangular(height: 60),
      );
}
