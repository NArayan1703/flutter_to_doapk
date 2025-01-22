// lib/providers/task_provider.dart
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => [..._tasks];
  late SharedPreferences _prefs;

  TaskProvider() {
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    await loadTasks();
  }

  Future<void> loadTasks() async {
    final tasksJson = _prefs.getStringList('tasks') ?? [];
    _tasks = tasksJson
        .map((task) => Task.fromJson(json.decode(task)))
        .toList();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    await _saveTasks();
    notifyListeners();
  }

  Future<void> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index >= 0) {
      _tasks[index] = task;
      await _saveTasks();
      notifyListeners();
    }
  }

  Future<void> deleteTask(String id) async {
    _tasks.removeWhere((task) => task.id == id);
    await _saveTasks();
    notifyListeners();
  }

  Future<void> _saveTasks() async {
    final tasksJson = _tasks
        .map((task) => json.encode(task.toJson()))
        .toList();
    await _prefs.setStringList('tasks', tasksJson);
  }

  List<Task> getTodayTasks() {
    final now = DateTime.now();
    return _tasks.where((task) {
      final taskDate = task.createdAt;
      return taskDate.year == now.year &&
          taskDate.month == now.month &&
          taskDate.day == now.day;
    }).toList();
  }
}