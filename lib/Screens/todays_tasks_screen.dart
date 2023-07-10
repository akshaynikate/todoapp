import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:todoapp/data/List_of_Tasks.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/providers/todoProvider.dart';
import 'package:todoapp/widgets/modalBottomSheet.dart';

class TodaysTasksScreen extends ConsumerStatefulWidget {
  const TodaysTasksScreen({super.key});
  @override
  TodaysTaskScreenState createState() => TodaysTaskScreenState();
}

class TodaysTaskScreenState extends ConsumerState<TodaysTasksScreen> {
  @override
  Widget build(BuildContext context) {
    List<Tasks> tasks = ref.watch(tasksProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: Text(
          'Tasks for today',
          style: TextStyle(color: Theme.of(context).colorScheme.background),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((context) => const ModalBottomSheet()),
                );
              },
              icon: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.background,
              ))
        ],
      ),
      body: tasks.isEmpty
          ? const Center(
              child: Text('No tasks added'),
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  tasks[index].title,
                ),
                leading: Checkbox(
                    value: tasks[index].isCompleted,
                    onChanged: (newvalue) {
                      ref.read(tasksProvider.notifier).toggale(tasks[index].id);
                      setState(() {
                        tasks[index].isCompleted = newvalue!;
                      });
                    }),
                trailing: IconButton(
                  onPressed: () {
                    ref
                        .read(tasksProvider.notifier)
                        .removeTasks(tasks[index].id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                ),
              ),
            ),
    );
  }
}
