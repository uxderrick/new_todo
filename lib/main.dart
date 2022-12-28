import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_todo/todo.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
