import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task_model.dart';

class TaskNotifire extends StateNotifier<List<Tasks>> {
  TaskNotifire() : super([]);
  void addTasks(Tasks task) {
    state = [...state, task];
  }

  void removeTasks(String id) {
    state = [
      for (final task in state)
        if (task.id != id) task
    ];
  }

  void toggale(String id) {
    for (final task in state) {
      if (task.id == id) {
        task.copyWith(isCompleted: !task.isCompleted);
      } else {
        task;
      }
    }
  }
}

final tasksProvider = StateNotifierProvider<TaskNotifire, List<Tasks>>((ref) {
  return TaskNotifire();
});
