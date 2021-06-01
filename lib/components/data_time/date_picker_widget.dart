import 'package:agenda/components/data_time/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final String valueButton;
  final String textUpButton;

  const DatePickerWidget({
    required this.valueButton,
    required this.textUpButton,
  });

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;

  String getText() {
    if (date == null) {
      return DateFormat('dd/MM/yyyy').format(DateTime.now());
    } else {
      return DateFormat('dd/MM/yyyy').format(date!);
      // return '${date.month}/${date.day}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: widget.textUpButton,
        text: getText(),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return;

    setState(() => date = newDate);
  }
}
