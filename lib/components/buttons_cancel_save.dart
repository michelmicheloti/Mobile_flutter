import 'package:flutter/material.dart';

class ButtonsCancelSave extends StatelessWidget {
  const ButtonsCancelSave({
    Key? key,
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
            color: MaterialStateColor.resolveWith(
              (states) => Colors.red.shade400,
            ),
          ),
          MyButton(
            text: "Salvar",
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

  const MyButton({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        text,
      ),
      style: ButtonStyle(
        backgroundColor: color,
      ),
    );
  }
}