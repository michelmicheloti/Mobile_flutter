import 'package:flutter/material.dart';

class TextWithTextInput extends StatelessWidget {
  final String title;
  final String hint;
  final TextInputType textInputType;

  const TextWithTextInput({
    Key? key,
    required this.title,
    required this.hint,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
              keyboardType: textInputType,
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}