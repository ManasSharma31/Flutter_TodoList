import 'package:flutter/material.dart';
import 'package:todoey_flutter/module/Tasks.dart';
import 'dart:collection';

class Taskdata extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    //this function gives a list on which we cannot perform any action on the list like add,length elc
    return UnmodifiableListView(_tasks);
  }

  int getCount() {
    return _tasks.length;
  }

  void updateTask(Task task) {
    task.toggle();
    notifyListeners();
  }

  void deleteTask(int taskIndex) {
    _tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void addTask(String newvalue) {
    _tasks.add(Task(name: newvalue));
    notifyListeners();
  }
}
