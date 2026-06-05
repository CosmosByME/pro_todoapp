import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_todoapp/data/model/to_do.dart';
import 'package:pro_todoapp/presentation/home_page/bloc/home_bloc.dart';
import 'package:pro_todoapp/presentation/home_page/widget/not_completed_tile.dart';
import 'package:pro_todoapp/presentation/todo_page/todo_edit_page.dart';

class NotCompletedListCard extends StatelessWidget {
  final List<ToDo> toDos;

  const NotCompletedListCard({super.key, required this.toDos});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Clean design looks flat with subtle contrast
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: ListView.separated(
        shrinkWrap: true, // Crucial inside SingleChildScrollView
        physics:
            const NeverScrollableScrollPhysics(), // Disables inner fight for scroll gesture
        padding: EdgeInsets.zero,
        itemCount: toDos.length,
        itemBuilder: (context, index) {
          final toDo = toDos[index];
          return GestureDetector(
            onLongPressStart: (details) {
              final offset = details.globalPosition;
              showMenu(
                color: Colors.white,
                context: context,
                position: RelativeRect.fromLTRB(
                  offset.dx, 
                  offset.dy, 
                  offset.dx + 1, 
                  offset.dy + 1, 
                ),
                items: [
                  const PopupMenuItem(
                    value: 'edit',
                    child: ListTile(
                      leading: Icon(Icons.edit, color: Colors.blueGrey),
                      title: Text(
                        'Edit Task',
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: ListTile(
                      leading: Icon(Icons.delete, color: Colors.red),
                      title: Text(
                        'Delete Task',
                        style: TextStyle(color: Colors.red),
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ).then((value) {
                if (value == 'delete') {
                  if (context.mounted) {
                    context.read<HomeBloc>().add(DeleteToDoEvent(toDo));
                  }
                }
                if (value == 'edit') {
                  if (context.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TodoEditPage(toDo: toDo),
                      ),
                    );
                  }
                }
              });
            },
            child: NotCompletedTile(toDo: toDo),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFFF1F5F9), // Light separation borders
          );
        },
      ),
    );
  }
}
