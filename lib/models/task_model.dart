class Tasks {
  String id;
  String title;
  bool isCompleted;
  DateTime date;
  Tasks({
    required this.isCompleted,
    required this.id,
    required this.title,
    required this.date,
  });

  Tasks copyWith(
      {bool? isCompleted, String? id, String? title, DateTime? date}) {
    return Tasks(
        isCompleted: this.isCompleted,
        id: this.id,
        title: this.title,
        date: this.date);
  }
}
