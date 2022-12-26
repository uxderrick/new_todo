class ToDo {
  String taskName;
  bool isDone = false;

  ToDo({
    required this.taskName,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(taskName: 'Walk the Dog'),
      ToDo(taskName: 'Buy a car'),
      ToDo(taskName: 'Pick up Ama from school'),
    ];
  }
}
