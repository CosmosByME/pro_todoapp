import 'package:pro_todoapp/data/model/task_type.dart';

class ToDo {
  final String id;
  final TaskType taskType;
  final String title;
  final String description;
  final String day;
  final String time;
  final bool isCompleted;

  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.day,
    required this.time,
    required this.taskType,
    this.isCompleted = false,
  });

  ToDo copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,
    TaskType? taskType,
  }) {
    return ToDo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      day: day,
      time: time,
      isCompleted: isCompleted ?? this.isCompleted,
      taskType: taskType ?? this.taskType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'day': day,
      'time': time,
      'isCompleted': isCompleted,
      'taskType': taskType.name,
    };
  }

  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      day: map['day'] ?? '',
      time: map['time'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
      taskType: TaskType.values.firstWhere(
        (e) => e.name == map['taskType'],
        orElse: () => TaskType.task,
      ),
    );
  }
}
