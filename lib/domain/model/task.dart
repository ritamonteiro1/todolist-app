class Task {
  Task({
    required this.description,
    this.completed = false,
  });

  bool completed;
  final String description;
}
