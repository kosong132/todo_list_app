import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'task.dart';

class TaskService with ChangeNotifier {
  final List<Task> _tasks = [];

  TaskService() {
    // Initialize tasks with provided data
    _initializeTasks();
  }

  List<Task> get tasks => _tasks;

  // Method to initialize tasks with provided data
  void _initializeTasks() {
    _tasks.addAll([
      Task(
        id: const Uuid().v4(),
        name: 'Web Programming Project 1',
        status: 'Urgent',
        dueDate: DateTime(2024, 6, 22),
      ),
      Task(
        id: const Uuid().v4(),
        name: 'Application Development progress check',
        status: 'To Do',
        dueDate: DateTime(2024, 6, 28),
      ),
      Task(
        id: const Uuid().v4(),
        name: 'Artificial Intelligence Assessment 2',
        status: 'Done',
        dueDate: DateTime(2024, 6, 25),
      ),
    ]);
  }

  void addTask(String name, String status, DateTime dueDate) {
    final task = Task(id: const Uuid().v4(), name: name, status: status, dueDate: dueDate);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(String id, String name, String status, DateTime dueDate) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = Task(id: id, name: name, status: status, dueDate: dueDate);
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
