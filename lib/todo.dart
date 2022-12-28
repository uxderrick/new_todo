import 'package:flutter/material.dart';

List<String> taskList = [
  ('Ghana is a Country'),
  ('Derrick is good'),
];

class TodoList extends ChangeNotifier {
  ValueNotifier<List<String>> newvalue =
      ValueNotifier(['Ghana is a Country', 'Derrick is good']);
  ValueNotifier<List<String>> get newVal => newvalue;
  List<String> getValue() {
    print("new list" + newvalue.value.toString());
    return newvalue.value;
  }

  // getNewValue(List<String> newV) {
  //   newvalue.value = newV;
  //   print(newvalue.value);
  //   notifyListeners();
  // }

  addtoList(String newV) {
    newvalue.value.add(newV);
    print('adding new value $newV');
    getValue();
    print(newvalue.value);
    notifyListeners();
  }
}

class TaskData {
  final String title;
  final String date;

  TaskData({required this.title, required this.date});
}

List<TaskData> tasks = [
  TaskData(title: "Ghana is a Country", date: "10/20/22"),
  TaskData(title: "Derrick is good", date: "10/20/22"),
];

class ItemList extends ChangeNotifier {
  final List<TaskData> _items = tasks;

  void addItem(TaskData itemData) {
    _items.add(itemData);
    print(_items);
    notifyListeners();
  }

  List<TaskData> get basketItem {
    return tasks;
  }
}
