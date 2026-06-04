import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/services/svg_service.dart';

class TimeField extends StatefulWidget {
  final TextEditingController controller;

  const TimeField({super.key, required this.controller});

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  void _selectTime() async {
    String? selectedTime = await getTimeFromUser(context);
    setState(() {
      widget.controller.text = selectedTime ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Time",
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          inputFormatters: [mask],
          decoration: InputDecoration(
            hintText: "Time",
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: GestureDetector(
                onTap: _selectTime,
                child: SvgService.getIconWidget("clock", width: 15, height: 15),
              ),
            ),
          ),
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}

final mask = MaskTextInputFormatter(
  mask: '##:##',
  filter: {"#": RegExp(r'[0-9]')},
);

Future<String?> getTimeFromUser(BuildContext context) async {
  TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
    initialEntryMode: TimePickerEntryMode.inputOnly,
    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );
    },
  );

  if (selectedTime != null) {
    return "${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}";
  }
  return null;
}
