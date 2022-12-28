import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> taskList = [
  ('Sample task'),
];

class TodoList extends ChangeNotifier {
  ValueNotifier<List<String>> newvalue = ValueNotifier([]);
  ValueNotifier<List<String>> get newVal => newvalue;
  List<String> getValue() {
    return newvalue.value;
  }

  addtoList(String newV) {
    newvalue.value.add(newV);
    getValue();
    notifyListeners();
  }
}

class TaskData {
  final String title;
  final String date;

  TaskData({required this.title, required this.date});
}

List<TaskData> tasks = [
  TaskData(
      title: "Sample task", date: DateFormat.yMMMMd().format(DateTime.now())),
];

class ItemList extends ChangeNotifier {
  final List<TaskData> _items = tasks;

  void addItem(TaskData itemData) {
    _items.add(itemData);
    notifyListeners();
  }

  List<TaskData> get basketItem {
    return tasks;
  }
}
