import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_service.dart';
import 'task_tile.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskService = Provider.of<TaskService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddTaskScreen()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: taskService.tasks.length,
        itemBuilder: (context, index) {
          final task = taskService.tasks[index];
          return TaskTile(task: task);
        },
      ),
    );
  }
}
