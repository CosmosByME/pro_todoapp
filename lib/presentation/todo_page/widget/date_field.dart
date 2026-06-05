import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../core/services/svg_service.dart';

class DateField extends StatefulWidget {
  final TextEditingController controller;

  const DateField({super.key, required this.controller});

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  void _selectDate() async {
    String? selectedDate = await getDateFromUser(context, DateTime.parse(widget.controller.text));
    setState(() {
      widget.controller.text = selectedDate ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date",
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          inputFormatters: [mask],
          decoration: InputDecoration(
            hintText: "Date",
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: GestureDetector(
                onTap: _selectDate,
                child: SvgService.getIconWidget("date", width: 15, height: 15),
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Date is required";
            }
            return null;
          },
        ),
      ],
    );
  }
}

final mask = MaskTextInputFormatter(
  mask: '##/##/####',
  filter: {"#": RegExp(r'[0-9]')},
);

Future<String?> getDateFromUser(BuildContext context, DateTime? initialDate) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    return "${pickedDate.day.toString().padLeft(2, "0")}/${pickedDate.month.toString().padLeft(2, "0")}/${pickedDate.year}";
  } else {
    return null;
  }
}
