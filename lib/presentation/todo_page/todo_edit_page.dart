import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todoapp/data/model/to_do.dart';
import 'package:pro_todoapp/presentation/home_page/bloc/home_bloc.dart';
import 'package:pro_todoapp/presentation/todo_page/bloc/todo_bloc.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/category_selecting.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/date_field.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/notes_field.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/task_title_field.dart';
import 'package:pro_todoapp/presentation/todo_page/widget/time_field.dart';

class TodoEditPage extends StatefulWidget {
  final ToDo toDo;
  const TodoEditPage({super.key, required this.toDo});

  @override
  State<TodoEditPage> createState() => _TodoEditPageState();
}

class _TodoEditPageState extends State<TodoEditPage> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.toDo.title;
    notesController.text = widget.toDo.description;
    dateController.text = widget.toDo.day;
    timeController.text = widget.toDo.time;
  }

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
              Container(
                color: const Color(0xFF4A3780),
              ), 
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
                    color: Color(0xFF4A3780),
                  ),
                ),
              ),

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
          "Edit Task",
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
                                      EditTodoEvent(
                                        widget.toDo,
                                        widget.toDo.copyWith(
                                          title: titleController.text,
                                          description: notesController.text,
                                          day: dateController.text,
                                          time: timeController.text,
                                          taskType: taskType,
                                        ),
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
