import 'package:agenda/components/buttons_cancel_save.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PacienteCadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final heightTotal = MediaQuery.of(context).size.height;
    final widthTotal = MediaQuery.of(context).size.width;

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
          height: availabelHeight * 1,
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextInput(
                widthTotal: widthTotal,
                textInputType: TextInputType.text,
                labelText: "Nome do paciente",
                icon: Icon(Icons.person_outline_rounded),
              ),
              DropDown(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Seletores(
                      widthTotal: widthTotal,
                      icon: Icon(Icons.crop_square, size: 40),
                      text: "Convênio",
                    ),
                    Seletores(
                      widthTotal: widthTotal,
                      icon: Icon(Icons.crop_square, size: 40),
                      text: "Particular",
                    ),
                  ],
                ),
              ),
              TextInput(
                widthTotal: widthTotal,
                textInputType: TextInputType.number,
                labelText: "Valor da Consulta",
                hint: "R\$50,00",
                icon: Icon(Icons.monetization_on_outlined),
              ),
              TextInput(
                icon: Icon(Icons.calendar_today),
                widthTotal: widthTotal,
                textInputType: TextInputType.datetime,
                labelText: "Data de Atendimento",
                hint: "${DateFormat('dd/MM/y').format(DateTime.now())}",
              ),
              ButtonsCancelSave(),
            ],
          ),
        ),
      ),
    );
  }
}

class Seletores extends StatelessWidget {
  const Seletores({
    Key? key,
    required this.widthTotal,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final double widthTotal;
  final Icon icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () {},
            child: Container(
              width: widthTotal * 0.15,
              height: widthTotal * 0.15,
              child: icon,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 8, right: 16),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.widthTotal,
    required this.textInputType,
    this.hint,
    this.labelText,
    this.icon,
  }) : super(key: key);

  final double widthTotal;
  final TextInputType textInputType;
  final String? hint;
  final String? labelText;
  final Icon? icon;

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
              fontSize: 24,
            ),
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
