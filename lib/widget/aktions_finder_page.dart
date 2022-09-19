import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:marq_app/widget/todo_widget.dart';
import 'package:marq_app/model/todo_model.dart';
import 'package:marq_app/provider/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marq_app/widget/skeleton_screens/shimmer_main_page.dart';
import 'dart:async';
import 'aktion_card_widget.dart';

class AktionsFinderPage extends HookConsumerWidget {
  const AktionsFinderPage({Key? key}) : super(key: key);

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

    return isLoadingShimmer.value
        ? MainPageShimmer()
        : SingleChildScrollView(
            child: Column(
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1),
                    shrinkWrap:
                        true, //important: so it doesn't break the layout
                    children: const [
                      AktionCardsWidget(),
                      AktionCardsWidget(),
                      AktionCardsWidget(),
                      AktionCardsWidget()
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
