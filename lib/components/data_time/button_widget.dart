import 'package:flutter/material.dart';

class ButtonHeaderWidget extends StatelessWidget {
  final String? title;
  final String text;
  final VoidCallback onClicked;

  const ButtonHeaderWidget({
    Key? key,
    required this.title,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => HeaderWidget(
        title: title!,
        child: ButtonWidget(
          text: text,
          onClicked: onClicked,
        ),
      );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateColor.resolveWith((states) => Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          minimumSize: MaterialStateProperty.resolveWith(
              (states) => Size.fromHeight(60)),
          elevation: MaterialStateProperty.all<double>(5),
          padding: MaterialStateProperty.all(EdgeInsets.all(12)),
        ),

        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        onPressed: onClicked,
      );
}

class HeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const HeaderWidget({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          child,
        ],
      );
}
