import 'package:flutter/material.dart';

class ButtonsCancelSave extends StatelessWidget {
  final Function function;
  const ButtonsCancelSave({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyButton(
            text: "Cancelar",
            function: function,
            color: MaterialStateColor.resolveWith(
              (states) => Colors.red.shade400,
            ),
          ),
          MyButton(
            text: "Salvar",
            function: function,
            color: MaterialStateColor.resolveWith(
              (states) => Colors.green.shade300,
            ),
          ),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  final MaterialStateColor color;
  final Function function;

  const MyButton({
    Key? key,
    required this.text,
    required this.color,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var elevatedButton = ElevatedButton(
      onPressed: function(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: color,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(5),
        padding: MaterialStateProperty.all(EdgeInsets.all(12)),
      ),
    );
    return elevatedButton;
  }
}
