import 'package:hive_ce_flutter/adapters.dart';
import 'package:pro_todoapp/data/model/to_do.dart';

class HiveService {
  Future<void> initialize() async {
    await Hive.initFlutter();
    await Hive.openBox("not_completed_tasks");
    await Hive.openBox("completed_tasks");
  }


  Future<void> addTask(ToDo task) async {
    Hive.box("completed_tasks").delete("${task.day}|${task.time}");
    var box = Hive.box("not_completed_tasks");
    final map = task.toMap();
    await box.put("${task.day}|${task.time}", map);
  }

  Future<void> completeTask(ToDo task) async {
    Hive.box("not_completed_tasks").delete("${task.day}|${task.time}");
    var box = Hive.box("completed_tasks");
    final map = task.toMap();
    await box.put("${task.day}|${task.time}", map);
  }

  List<ToDo> getNotCompletedTasks() {
    var box = Hive.box("not_completed_tasks");
    List<ToDo> tasks = [];
    for (var map in box.values) {
      tasks.add(ToDo.fromMap(map));
    }
    return tasks;
  }

  List<ToDo> getCompletedTasks() {
    var box = Hive.box("completed_tasks");
    List<ToDo> tasks = [];
    for (var map in box.values) {
      tasks.add(ToDo.fromMap(map));
    }
    return tasks;
  }
}