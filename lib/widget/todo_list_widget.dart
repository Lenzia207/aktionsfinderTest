import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import 'package:marq_app/widget/todo_widget.dart';
import 'package:marq_app/model/todo_model.dart';
import 'package:marq_app/provider/todo_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marq_app/widget/skeleton_screens/shimmer_widget.dart';
import 'dart:async';

class TodoListWidget extends HookConsumerWidget {
  const TodoListWidget({Key? key}) : super(key: key);

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
    Future.delayed(const Duration(seconds: 1), () {
      isLoadingShimmer.value = false;

      //new element of the todo loaded (true)
      for (var element in todos) {
        element.isLoaded = true;
      }
    });

    inspect(todos);
    //Render the todos in a scrollable list view --> ListView()
    return todos.isEmpty
        ? const Center(
            child: Text(
              'Keine Aufgaben',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 5),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              // _1_
              //When isLoadingShimmer.value is true AND the isLoaded of new todo-items false (default false)
              // --> Show the shimmer Effect
              if (todos[index].isLoaded == false) {
                return buildTodoShimmer();
              }

              return TodoWidget(todo: todos[index]);
            });
  }

  Widget buildTodoShimmer() => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.white,
        ),
        child: Card(
          //color: Colors.white,
          elevation: 0,
          child: Row(
            children: [
              const SizedBox(
                child: ShimmerWidget.rectangular(
                  height: 22,
                  width: 20,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ShimmerWidget.rectangular(
                    height: 22,
                    width: 150,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const ShimmerWidget.rectangular(
                      height: 20,
                      width: 500,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      );
}
