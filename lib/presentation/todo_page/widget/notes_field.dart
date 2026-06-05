import 'package:flutter/material.dart';

class NotesField extends StatelessWidget {
  final TextEditingController? controller;
  const NotesField({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Notes",
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: 6,
          decoration: InputDecoration(hintText: "Notes"),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Notes are required";
            }
            return null;
          },
        ),
      ],
    );
  }
}
