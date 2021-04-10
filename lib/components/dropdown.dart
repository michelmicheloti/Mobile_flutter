import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? valueChoose;
  List listItem = [
    "Clínica_1",
    "Clínica_2",
    "Clínica_3",
    "Clínica_4",
    "Clínica_5",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: DropdownButton(
          hint: Container(
            child: Text("Selecione uma Clínica"),
            alignment: Alignment.center,
          ),
          dropdownColor: Colors.white,
          underline: SizedBox(),
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          isExpanded: true,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
          value: valueChoose,
          onChanged: (newValue) {
            setState(() {
              valueChoose = newValue as String;
            });
          },
          items: listItem.map(
            (valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    valueItem,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}