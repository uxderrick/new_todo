class ToDo {
  final String taskName;

  ToDo({
    required this.taskName,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(taskName: 'Walk the Dog'),
      ToDo(taskName: 'Buy a car'),
    ];
  }
}
