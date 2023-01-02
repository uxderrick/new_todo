import 'package:flutter/material.dart';
import 'package:new_todo/newnote.dart';
import 'package:intl/intl.dart';
import 'list_card.dart';

class Home extends StatefulWidget {
  final List<String> stringList;
  const Home({super.key, required this.stringList});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                        backgroundImage: NetworkImage(
                            'https://media.licdn.com/dms/image/D4D03AQHrAy4t4kGOdw/profile-displayphoto-shrink_200_200/0/1666960656997?e=1678320000&v=beta&t=YhRU-XW6m45NKaCc1K3qjoA-pgq245qYRP6JN2o4NB4'),
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
                  'Task.ly',
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
                      //added a little change to format the date... thats why i added the intl package 🙂
                      Text(
                        'Today is ${DateFormat.yMMMMd().format(DateTime.now())}',
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
                            widget.stringList.length == 1
                                ? ' ${widget.stringList.length} task'
                                : ' ${widget.stringList.length} tasks',
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
                ListView.builder(
                  shrinkWrap: true,
                  //here is the little change that i made 🙂
                  itemCount: widget.stringList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    //here is the little change that i made 🙂
                    return Dismissible(
                      key: Key(widget.stringList[index]),
                      onDismissed: (direction) async {
                        setState(() {
                          widget.stringList.removeAt(index);
                        });
                      },
                      child: ListCard(
                        string: widget.stringList[index],
                        // stringList: [stringList[index]],
                      ),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => NewNote())));
          },
          child: const Icon(
            Icons.add,
            size: 32,
            color: Color.fromARGB(255, 0, 25, 46),
          ),
        ));
  }
}
