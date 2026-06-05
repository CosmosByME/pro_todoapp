import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pro_todoapp/core/services/internet_connection_service.dart';
import 'package:pro_todoapp/presentation/home_page/bloc/home_bloc.dart';
import 'package:pro_todoapp/presentation/todo_page/bloc/todo_bloc.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/category_selecting.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/date_field.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/notes_field.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/task_title_field.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/time_field.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void dispose() {
    dateController.dispose();
    timeController.dispose();
    titleController.dispose();
    notesController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        flexibleSpace: ClipRRect(
          child: Stack(
            children: [
              // Background base color
              Container(
                color: const Color(0xFF4A3780),
              ), // Your primary purple hex
              // Left overlapping circles
              Positioned(
                left: -100,
                top: 30,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withAlpha(20), // Soft outer circle
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
                    color: Color(0xFF4A3780), // Soft inner circle
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
                    color: Color(0xFF4A3780),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 56,
        actionsPadding: const EdgeInsets.only(right: 16.0),
actions: [
  SizedBox(
    width: 40, // 1. Lock a specific width so the AppBar allocates space instantly
    child: StreamBuilder<InternetConnectionStatus>(
      // 2. Fetch the current connection state as initial data to prevent immediate layout collapse
      initialData: InternetConnectionStatus.connected, 
      stream: connectionService.onStatusChange,
      builder: (context, asyncSnapshot) {
        // Now hasData will always evaluate properly on frame #1
        if (asyncSnapshot.hasData) {
          final status = asyncSnapshot.data!;
          if (status == InternetConnectionStatus.connected) {
            return const Icon(
              Icons.wifi,
              color: Colors.greenAccent,
              size: 30,
            );
          } else if (status == InternetConnectionStatus.slow) {
            return const Icon(
              Icons.wifi,
              color: Colors.orangeAccent,
              size: 30,
            );
          } else {
            return const Icon(
              Icons.wifi_off,
              color: Colors.redAccent,
              size: 30,
            );
          }
        }
        // Fallback icon just in case the snapshot is physically waiting
        return const Icon(Icons.wifi, color: Colors.white24, size: 30);
      },
    ),
  ),
],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.close,
                size: 20,
                color: Color(0xFF4A3780),
              ),
            ),
          ),
        ),
        title: const Text(
          "Add New Task",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(24),
          child: SizedBox(),
        ),
      ),
      body: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state.isCompleted) {
            context.read<HomeBloc>().add(FetchToDosEvent());
            Navigator.of(context).pop();
          }
        },
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 24.0,
                  ),
                  child: Form(
                    key: formKey,
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TaskTitleField(controller: titleController),
                          const SizedBox(height: 20),

                          const SizedBox(height: 8),
                          CategorySelecting(),
                          const SizedBox(height: 24),

                          Row(
                            children: [
                              Expanded(
                                child: DateField(controller: dateController),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: TimeField(controller: timeController),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          NotesField(controller: notesController),

                          const Spacer(),
                          const SizedBox(height: 32),

                          BlocBuilder<TodoBloc, TodoState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    final taskType = state.taskType;
                                    context.read<TodoBloc>().add(
                                      FormSubmitted(
                                        title: titleController.text,
                                        description: notesController.text,
                                        day: dateController.text,
                                        time: timeController.text,
                                        taskType: taskType,
                                      ),
                                    );
                                  }
                                },
                                child: state.isLoading
                                    ? SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        "Save Task",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.onPrimary,
                                            ),
                                      ),
                              );
                            },
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
