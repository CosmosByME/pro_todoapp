import 'package:flutter/material.dart';
import 'package:pro_todoapp/core/services/svg_service.dart';

class EventBadge extends StatelessWidget {
  final double size;

  const EventBadge({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFE7E2F3),
      ),
      alignment: Alignment.center,
      child: SvgService.getIconWidget(
        "calendar",
        width: size * 0.6,
        height: size * 0.6,
      ),
    );
  }
}

class TaskBadge extends StatelessWidget {
  final double size;
  const TaskBadge({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFDBECF6),
      ),
      alignment: Alignment.center,
      child: SvgService.getIconWidget(
        "task",
        width: size * 0.6,
        height: size * 0.6,
      ),
    );
  }
}

class GoalBadge extends StatelessWidget {
  final double size;
  const GoalBadge({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFFEF5D3),
      ),
      alignment: Alignment.center,
      child: SvgService.getIconWidget(
        "goal",
        width: size * 0.6,
        height: size * 0.6,
      ),
    );
  }
}
