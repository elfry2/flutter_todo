class Task {
  final String id;
  String title;
  String description;
  bool isDone;
  DateTime? deadline; // Added deadline field

  Task({
    required this.id,
    required this.title,
    this.description = '',
    this.isDone = false,
    this.deadline,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isDone': isDone,
        'deadline': deadline?.toIso8601String(), // Convert DateTime to String for storage
      };

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        description: json['description'] ?? '',
        isDone: json['isDone'] ?? false,
        deadline: json['deadline'] != null
            ? DateTime.parse(json['deadline']) // Parse String back to DateTime
            : null,
      );
}