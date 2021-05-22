import 'package:agenda/components/buttons_cancel_save.dart';
import 'package:agenda/components/text_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'pacientes_screen.dart';

class PacienteCadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // final heightTotal = MediaQuery.of(context).size.height;
    final widthTotal = MediaQuery.of(context).size.width;

    final PreferredSizeWidget appBar = AppBar(
      title: Text(""),
    );

    void _saveItem() {
      print("salvou");
    }

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextInput(
                widthTotal: widthTotal,
                textInputType: TextInputType.text,
                labelText: "Nome do paciente",
                icon: Icon(Icons.person_outline_rounded),
              ),
              DropDown(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              TextInput(
                widthTotal: widthTotal,
                textInputType: TextInputType.number,
                labelText: "Valor da Consulta",
                hint: "R\$50,00",
                icon: Icon(Icons.monetization_on_outlined),
              ),
              TextInput(
                widthTotal: widthTotal,
                textInputType: TextInputType.datetime,
                icon: Icon(Icons.calendar_today),
                labelText: "Data de Atendimento",
                hint: "${DateFormat('dd/MM/y').format(DateTime.now())}",
              ),
              Container(
                width: widthTotal * 0.9,
                child: ButtonsCancelSave(
                  function: _saveItem,
                ),
              ),
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
        Container(
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: widthTotal * 0.12,
                height: widthTotal * 0.12,
                child: icon,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(4),
          child: FittedBox(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
