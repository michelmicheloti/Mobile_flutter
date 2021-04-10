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
                widthTotal: widthTotal,
                textInputType: TextInputType.datetime,
                icon: Icon(Icons.calendar_today),
                labelText: "Data de Atendimento",
                hint: "${DateFormat('dd/MM/y').format(DateTime.now())}",
              ),
              Container(
                width: widthTotal * 0.9,
                child: ButtonsCancelSave(),
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
