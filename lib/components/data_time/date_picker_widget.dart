import 'package:agenda/components/data_time/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:agenda/Utils/globals.dart' as globals;

class DatePickerWidget extends StatefulWidget {
  final String valueButton;
  final String textUpButton;
  final DateTime? data;
  final String typeDate;

  const DatePickerWidget({
    required this.valueButton,
    required this.textUpButton,
    required this.data,
    required this.typeDate,
  });

  String getTypeDate() {
    return typeDate;
  }

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? date;

  String getText(typeDate, data) {
    globals.count += 1;
    if (globals.update &&
        globals.count <= 2 &&
        !typeDate.toString().contains("dataAtendimento")) {
      date = data;
    } else if (typeDate.toString().contains("dataAtendimento") &&
        globals.update &&
        globals.count == 1) {
      date = data;
    }

    if (typeDate.toString().contains("dataInicial")) {
      globals.dataInicial = date;
    } else if (typeDate.toString().contains("dataFinal")) {
      globals.dataFinal = date;
    } else if (typeDate.toString().contains("dataAtendimento")) {
      globals.dataAtendimento = date;
    }
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
        text: getText(widget.typeDate, widget.data),
        onClicked: () => pickDate(context),
      );

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 1),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    // globals.dataInicial = date!;
    if (newDate == null) return;

    setState(() => date = newDate);
  }
}
