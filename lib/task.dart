class Task {
  final String text;
  final bool isCompleted;
  Task(this.text, this.isCompleted);

  Task copyWith({String text, bool isCompleted}) {
    return Task(text ?? this.text, isCompleted ?? this.isCompleted);
  }
}
