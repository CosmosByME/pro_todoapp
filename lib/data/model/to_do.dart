import 'package:pro_todoapp/data/model/task_type.dart';

class ToDo {
  final TaskType taskType;
  final String title;
  final String description;
  final String day;
  final String time;
  final bool isCompleted;

  ToDo({
    required this.title,
    required this.description,
    required this.day,
    required this.time,
    required this.taskType,
    this.isCompleted = false,
  });

  ToDo copyWith({
    String? title,
    String? description,
    bool? isCompleted,
    String? day,
    String? time,
    TaskType? taskType,
  }) {
    return ToDo(
      title: title ?? this.title,
      description: description ?? this.description,
      day: day ?? this.day,
      time: time ?? this.time,
      isCompleted: isCompleted ?? this.isCompleted,
      taskType: taskType ?? this.taskType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
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
