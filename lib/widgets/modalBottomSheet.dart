import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';

import 'package:todoapp/models/task_model.dart';
import '../providers/todoProvider.dart';

class ModalBottomSheet extends ConsumerStatefulWidget {
  const ModalBottomSheet({super.key});
  @override
  ModalBottomSheetState createState() => ModalBottomSheetState();
}

class ModalBottomSheetState extends ConsumerState<ModalBottomSheet> {
  final titleController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              fillColor: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.1),
              filled: true,
              label: Text(
                'Enter title',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2024));
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                    print(titleController.text);
                    print(selectedDate.toString());
                  },
                  icon: const Icon(Icons.date_range),
                  label: const Text('Select Date')),
              Text(DateFormat.yMMMEd().format(selectedDate)),
            ],
          ),
          const SizedBox(height: 40),
          ElevatedButton(
              onPressed: () {
                if (titleController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Enter valid title'),
                    ),
                  );
                  Navigator.of(context).pop();
                } else {
                  final newTask = Tasks(
                      isCompleted: false,
                      date: selectedDate,
                      id: DateTime.now().toString(),
                      title: titleController.text);
                  ref.read(tasksProvider.notifier).addTasks(newTask);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Create Task'))
        ],
      ),
    );
  }
}
