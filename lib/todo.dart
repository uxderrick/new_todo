import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

final _myBox = Hive.openBox('myBox');

List<String> taskList = [
  ('Sample task'),
];

class TodoList extends ChangeNotifier {
  ValueNotifier<List<String>> newvalue = ValueNotifier([]);
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
  TaskData(
      title: "Sample task", date: DateFormat.yMMMMd().format(DateTime.now())
      // DateFormat.yMMMMd().format(DateTime.now())}
      ),
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
