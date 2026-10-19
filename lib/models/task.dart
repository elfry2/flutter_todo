class Task {
  final String id;
  String title;
  String description;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.isDone = false,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isDone': isDone,
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        description: json['description'] ?? '',
        isDone: json['isDone'] ?? false,
      );
}