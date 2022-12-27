import 'package:flutter/material.dart';
import 'package:new_todo/newnote.dart';
import 'package:new_todo/todo.dart';

import 'list_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosLists = ToDo.todoList();
  final _controller = TextEditingController();

  //save new task
  void saveNewTask() {
    setState(() {
      todosLists.add(ToDo(taskName: _controller.text));
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 25, 46),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 64,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.menu),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: Colors.blueGrey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(90)),
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 16,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            NetworkImage('https://i.pravatar.cc/300'),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Derrick',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              )
            ],
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 0, 25, 46),
        ),

        //body here

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'Note.ly',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 80,
                      height: 1,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24)),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today is ${DateTime.now()}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Text(
                            'You have',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 20),
                          ),
                          Text(
                            ' ${todosLists.length} tasks',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            ' to complete',
                            style:
                                TextStyle(color: Colors.blueGrey, fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'All tasks',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      height: 1,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 16,
                ),

                //for loop
                // for (ToDo todo in todosLists)
                //You dont need a for loop for this cos list builder comes with the index
                //feature which allows u to make returns based on each item of the list
                //the for loop too didnt have an end so thats why the loop kept going and created a long list
                //for the Container i added for the beginin to check the height i removed it cos the widget(ListCard)
                //that u were using had an already defined height so that would work fine with the Single Child Sroll view
                //i added the item count in the List view builder too that assigns the list that u want to use to the builder
                //list view
                ListView.builder(
                  shrinkWrap: true,
                  //here is the little change that i made 🙂
                  itemCount: todosLists.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    //here is the little change that i made 🙂
                    return ListCard(
                      taskName: todosLists[index].taskName,
                    );
                  },
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ),

        //floating action button
        //Changed the location here
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => NewNote(
                          controller: _controller,
                          onSave: () {
                            saveNewTask;
                          },
                        ))));
          },
          child: const Icon(
            Icons.add,
            size: 32,
            color: Color.fromARGB(255, 0, 25, 46),
          ),
        ));
  }
}
