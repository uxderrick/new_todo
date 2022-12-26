import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:new_todo/home.dart';

class NewNote extends StatelessWidget {
  VoidCallback onSave;
  final controller;
  NewNote({
    Key? key,
    required this.onSave,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 25, 46),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.arrow_back,
                      size: 20,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),

                //save button
                GestureDetector(
                  onTap: () {
                    onSave;
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 16, color: Colors.greenAccent),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 25, 46),
      ),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  maxLength: 140,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  style: const TextStyle(fontSize: 40, color: Colors.white),
                  maxLines: 10,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter new task here',
                      hintStyle: TextStyle(
                        fontSize: 40,
                        color: Colors.blueGrey.withOpacity(0.4),
                      )),
                ),
              ),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
