import 'package:flutter/material.dart';
import 'package:pro_todoapp/core/main_widgets/category_badges.dart';

class CategorySelecting extends StatefulWidget {
  const CategorySelecting({super.key});

  @override
  State<CategorySelecting> createState() => _CategorySelectingState();
}

class _CategorySelectingState extends State<CategorySelecting> {
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Category",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 24),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCategoryIndex = 0;
            });
          },
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: selectedCategoryIndex == 0 ? Theme.of(context).colorScheme.primary : Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
                child: TaskBadge(size: 34),
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCategoryIndex = 1;
            });
          },
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: selectedCategoryIndex == 1 ? Theme.of(context).colorScheme.primary : Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: EventBadge(size: 34),
            ),
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedCategoryIndex = 2;
            });
          },
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: selectedCategoryIndex == 2 ? Theme.of(context).colorScheme.primary : Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: GoalBadge(size: 34),
            ),
          ),
        )
      ],
    );
  }
}
