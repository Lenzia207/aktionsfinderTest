import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:marq_app/widget/todo_widget.dart';
import 'package:marq_app/model/todo_model.dart';
import 'package:marq_app/provider/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marq_app/widget/shimmer_widget.dart';
import 'dart:async';
import 'package:getwidget/getwidget.dart';
import 'package:widgetbook/widgetbook.dart';

class AktionsFinderPage extends HookConsumerWidget {
  AktionsFinderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todosLength = useState(0); //needs to above the provider
    List<Todo> todos = ref.watch(todosProvider);
    //final filter = ref.watch(todoListFilter);
    var isLoadingShimmer = useState(true);

    //Makes sure that only the new added Todo shows the shimmer loading effect
    if (todosLength.value != todos.length) {
      todosLength.value = todos.length;
      isLoadingShimmer.value = true;
    }

    // _2_
    //First the todos.index items are being set to false so the shimmer for the added Task is abled
    //But after delay all todo items are then set to true and the loading shimmer set to false to stop the shimmer Effect
    Future.delayed(const Duration(seconds: 5), () {
      isLoadingShimmer.value = false;

      //new element of the todo loaded (true)
      for (var element in todos) {
        element.isLoaded = true;
      }
    });

    //Render the todos in a scrollable list view --> ListView()
    return isLoadingShimmer.value
        ? buildTodoShimmer()
        : Column(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 50,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  Positioned(
                    top: 10,
                    left: 20,
                    child: Row(children: [
                      Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(23))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(23))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(23))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 150,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(23))),
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1),
                  children: [
                    aktionCard(),
                    aktionCard(),
                    aktionCard(),
                    aktionCard()
                  ],
                ),
              )

              /* Card(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: const ShimmerWidget.rectangular(height: 150)),
                    const SizedBox(
                      height: 10,
                    ),
                    const ShimmerWidget.rectangular(
                      height: 30,
                      width: 70,
                    ),
                  ],
                ),
              ), */
            ],
          );
  }

  Widget buildTodoShimmer() => Column(
        children: [
          const ShimmerWidget.rectangular(height: 200),
          Stack(children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 50,
              width: double.infinity,
              color: Colors.white,
            ),
            Positioned(
              top: 10,
              left: 20,
              child: Row(children: [
                ShimmerWidget.circular(
                  height: 30,
                  width: 50,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ShimmerWidget.circular(
                  height: 30,
                  width: 100,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ShimmerWidget.circular(
                  height: 30,
                  width: 80,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ShimmerWidget.circular(
                  height: 30,
                  width: 150,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
              ]),
            ),
          ]),
          /*     Card(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    child: const ShimmerWidget.rectangular(height: 150)),
                const SizedBox(
                  height: 10,
                ),
                const ShimmerWidget.rectangular(
                  height: 30,
                  width: 70,
                ),
              ],
            ),
          ), */
        ],
      );

  Widget aktionCard() => SizedBox(
        height: double.infinity,
        child: Card(
          semanticContainer: true,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  height: 110,
                  width: double.infinity,
                  color: Colors.grey[300],
                ),
                const Text(
                  'Titel',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '10.3. - 10.4.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
