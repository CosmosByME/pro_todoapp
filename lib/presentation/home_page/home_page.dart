import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_todoapp/data/model/task_type.dart';
import 'package:pro_todoapp/data/model/to_do.dart';
import 'package:pro_todoapp/presentation/home_page/widget/completed_list_card.dart';
import 'package:pro_todoapp/presentation/home_page/widget/not_completed_list_card.dart';
import 'package:pro_todoapp/presentation/home_page/widget/title_giver.dart';
import 'package:pro_todoapp/presentation/todo_page/todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF4A3780);

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        toolbarHeight: 70,
        flexibleSpace: ClipRRect(
          child: Stack(
            children: [
              Container(color: primaryColor),
              // Left overlapping circles
              Positioned(
                left: -100,
                top: 30,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withAlpha(20),
                  ),
                ),
              ),
              Positioned(
                left: -80,
                top: 60,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                ),
              ),
              // Right overlapping circles
              Positioned(
                right: -90,
                bottom: -30,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withAlpha(20),
                  ),
                ),
              ),
              Positioned(
                right: -70,
                bottom: 0,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          titleGiver(),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(preferredSize: Size(double.infinity, 50), child: Container(
          color: Colors.transparent,
          height: 55,
          alignment: Alignment.topCenter,
          child: Text(
            "My Todo List",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),),
      ),
      body: SingleChildScrollView(
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
                          id: "f",
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
                          id: "f",
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
      floatingActionButton: FloatingActionButton(
        // shape: Shape,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const TodoPage()),
          );
        },
        backgroundColor: primaryColor,

        child: const Icon(Icons.add),
      ),
    );
  }
}
