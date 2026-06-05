import 'package:hive_ce_flutter/adapters.dart';
import 'package:pro_todoapp/data/model/to_do.dart';

class HiveService {
  HiveService._internal();

  // 2. Static final instance initialized via the private constructor
  static final HiveService _instance = HiveService._internal();

  // 3. Factory constructor that intercepts calls and returns the cached instance
  factory HiveService() {
    return _instance;
  }

  Future<void> initialize() async {
    await Hive.initFlutter();
    await Hive.openBox("not_completed_tasks");
    await Hive.openBox("completed_tasks");
  }

  Future<void> addTask(ToDo task) async {
    await Hive.box("completed_tasks").delete("${task.day}|${task.time}");
    var box = Hive.box("not_completed_tasks");
    final map = task.toMap();
    await box.put("${task.day}|${task.time}", map);
  }

  Future<void> completeTask(ToDo task) async {
    await Hive.box("not_completed_tasks").delete("${task.day}|${task.time}");
    var box = Hive.box("completed_tasks");
    final map = task.toMap();
    await box.put("${task.day}|${task.time}", map);
  }

  List<ToDo> getNotCompletedTasks() {
    final box = Hive.box("not_completed_tasks");

    // Convert box values safely to Map<String, dynamic> before creating the object
    return box.values
        .map((dynamic value) => ToDo.fromMap(Map<String, dynamic>.from(value)))
        .toList();
  }

  List<ToDo> getCompletedTasks() {
    final box = Hive.box("completed_tasks");

    // Clean, modern, and type-safe approach
    return box.values
        .map((dynamic value) => ToDo.fromMap(Map<String, dynamic>.from(value)))
        .toList();
  }
}
