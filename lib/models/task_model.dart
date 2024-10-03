class Task {
  final String id;
  final String title;
  bool isCompleted;

  Task({required this.id, required this.title, required this.isCompleted});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      isCompleted: json['done'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'done': isCompleted,
    };
  }

  void isChecked() {
    isCompleted = !isCompleted;
  }
}
