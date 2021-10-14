class todoItem {
  final String task;
  final String taskDesc;
  final int index;

  const todoItem({
    required this.task,
    required this.taskDesc,
    required this.index,
  });

  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'taskDesc': taskDesc,
      'id': index,
    };
  }
}
