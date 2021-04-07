import 'package:agenda/components/buttons_cancel_save.dart';
import 'package:flutter/material.dart';

class ClinicaCadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Cadastro de Clínicas",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MyRow(
                title: "Início dos Atendimentos",
                hint: "12:00",
                textInputType: TextInputType.datetime,
              ),
              MyRow(
                title: "Fim dos Atendimentos",
                hint: "18:00",
                textInputType: TextInputType.datetime,
              ),
              MyRow(
                title: "Minutos de Atendimentos",
                hint: "30",
                textInputType: TextInputType.datetime,
              ),
              MyRow(
                title: "Valor do Atendimento",
                hint: "R\$ 50,00",
                textInputType: TextInputType.number,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dias de Atendimento",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DiasDaSemana(text: "SEG"),
                      DiasDaSemana(text: "TER"),
                      DiasDaSemana(text: "QUA"),
                      DiasDaSemana(text: "QUI"),
                      DiasDaSemana(text: "SEX"),
                      DiasDaSemana(text: "SAB"),
                    ],
                  ),
                  ButtonsCancelSave()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DiasDaSemana extends StatelessWidget {
  final String text;

  const DiasDaSemana({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            alignment: Alignment.center,
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  final String title;
  final String hint;
  final TextInputType textInputType;

  const MyRow({
    Key? key,
    required this.title,
    required this.hint,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 4,
      ),
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
