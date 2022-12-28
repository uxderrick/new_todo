import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_todo/todo.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import "package:hive_flutter/hive_flutter.dart";

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _myBox = Hive.openBox('myBox');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider<TodoList>(
          create: (BuildContext context) => TodoList(),
          lazy: false,
        ),
        ChangeNotifierProvider<ItemList>(
          create: (BuildContext context) => ItemList(),
          lazy: false,
        ),
      ], child: const Home()),
      theme: ThemeData(
        fontFamily: GoogleFonts.manrope().fontFamily,
      ),
    );
  }
}
