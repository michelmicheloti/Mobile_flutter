import 'package:flutter/material.dart';

class PacienteCadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availabelWidht = mediaQuery.size.width;

    final PreferredSizeWidget appBar = AppBar(
      title: Text(""),
    );

    final availabelHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Cadastro de Pacientes",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          height: availabelHeight * 1,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: availabelWidht * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Clinica",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              DropDown(),
            ],
          ),
        ),
      ),
    );
  }
}

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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
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
      ),
    );
  }
}
