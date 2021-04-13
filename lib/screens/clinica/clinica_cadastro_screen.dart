import 'package:agenda/components/buttons_cancel_save.dart';
import 'package:agenda/components/text_input.dart';
import 'package:flutter/material.dart';

class ClinicaCadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final widthTotal = mediaQuery.size.width;

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
        child: Container(
          height: availabelHeight * 1,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: 16,
              right: 16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextInput(
                  widthTotal: widthTotal,
                  textInputType: TextInputType.datetime,
                  labelText: "Início dos Atendimentos",
                  hint: "12:00",
                  icon: Icon(Icons.calendar_today),
                ),
                TextInput(
                  widthTotal: widthTotal,
                  textInputType: TextInputType.datetime,
                  labelText: "Fim dos Atendimentos",
                  hint: "18:00",
                  icon: Icon(Icons.calendar_today),
                ),
                TextInput(
                  widthTotal: widthTotal,
                  textInputType: TextInputType.datetime,
                  labelText: "Minutos de Atendimentos",
                  hint: "00:30",
                  icon: Icon(Icons.access_time),
                ),
                TextInput(
                  widthTotal: widthTotal,
                  textInputType: TextInputType.number,
                  labelText: "Valor do Atendimento",
                  hint: "R\$50,00",
                  icon: Icon(Icons.monetization_on_outlined),
                ),
                Column(
                  children: [
                    Row(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DiasDaSemana(text: "SEG"),
                        DiasDaSemana(text: "TER"),
                        DiasDaSemana(text: "QUA"),
                        DiasDaSemana(text: "QUI"),
                        DiasDaSemana(text: "SEX"),
                        DiasDaSemana(text: "SAB"),
                      ],
                    ),
                    Container(
                      width: mediaQuery.size.width * 0.9,
                      child: ButtonsCancelSave(),
                    ),
                  ],
                ),
              ],
            ),
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
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
          ),
        ),
      ),
    );
  }
}
