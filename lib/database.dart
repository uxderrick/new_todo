import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  //
  List taskData = [];

  //reference box
  final _myBox = Hive.openBox('myBox');
}
