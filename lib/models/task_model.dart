class Task {
  final String title;
  bool isCompleted;

  Task({required this.title, required this.isCompleted});

  void isChecked() {
    isCompleted = !isCompleted;
  }
}
