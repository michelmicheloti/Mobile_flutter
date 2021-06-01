import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.widthTotal,
    required this.textInputType,
    this.hint,
    this.labelText,
    this.icon,
    this.textController,
  }) : super(key: key);

  final double widthTotal;
  final TextInputType textInputType;
  final String? hint;
  final String? labelText;
  final Icon? icon;
  final TextEditingController? textController;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: widthTotal * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            style: TextStyle(
              fontSize: 20,
            ),
            controller: textController,
            keyboardType: textInputType,
            decoration: InputDecoration(
              labelText: labelText,
              hintText: hint,
              suffixIcon: icon,
              border: InputBorder.none,
            ),
          ),
          
        ),
      ],
    );
  }
}
