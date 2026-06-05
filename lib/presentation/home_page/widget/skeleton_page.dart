import 'package:flutter/material.dart';
import 'package:pro_todoapp/data/model/task_type.dart';
import 'package:pro_todoapp/data/model/to_do.dart';
import 'package:pro_todoapp/presentation/home_page/widget/completed_list_card.dart';
import 'package:pro_todoapp/presentation/home_page/widget/not_completed_list_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonPage extends StatelessWidget {
  const SkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey[300]!,
      enableSwitchAnimation: true,
      child: SingleChildScrollView(
          // Safely handles physics over screen bounds
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Section
                          // Task Content Box
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16),
      
                    // Active Todos Card List
                    NotCompletedListCard(
                      toDos: [
                        for (int i = 0; i < 4; i++)
                          ToDo(
                            title: "Task Title Example",
                            description: "10:00 AM",
                            day: "Monday",
                            time: "10:00 AM",
                            taskType: TaskType.event,
                          ),
                      ],
                    ),
      
                    const SizedBox(height: 24),
      
                    // Completed Header Title Label
                    const Text(
                      "Completed",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
      
                    const SizedBox(height: 12),
      
                    CompletedListCard(
                      toDos: [
                        for (int i = 0; i < 4; i++)
                          ToDo(
                            title: "Task Title Example",
                            description: "10:00 AM",
                            day: "Monday",
                            time: "10:00 AM",
                            taskType: TaskType.goal,
                          ),
                      ],
                    ),
      
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}