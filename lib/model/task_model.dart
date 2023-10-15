class Task {
  final String imagePath;
  final String title;
  final String? subtitle;
  bool completed = false;

  Task({
    required this.imagePath,
    required this.title,
    this.subtitle,
    required this.completed,
  });
}
// done
