import 'package:agenda/components/data_time/button_widget.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? time;

  String getText() {
    if (time == null) {
      return '00:30';
    } else {
      final hours = time!.hour.toString().padLeft(2, '0');
      final minutes = time!.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) => ButtonHeaderWidget(
        title: 'Tempo de atendimento',
        text: getText(),
        onClicked: () => pickTime(context),
      );

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 0, minute: 30);
    final newTime = await showTimePicker(
      context: context,
      initialTime: time ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => time = newTime);
  }
}
