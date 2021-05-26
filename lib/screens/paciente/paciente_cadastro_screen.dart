import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/components/dropdown.dart';
import 'package:agenda/components/text_input.dart';
import 'package:agenda/Utils/globals.dart' as globals;
import 'package:agenda/providers/paciente.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PacienteCadastroScreen extends StatelessWidget {
  final TextEditingController _controladorNomePaciente =
      TextEditingController();
  final TextEditingController _controladorValorConsulta =
      TextEditingController();
  final TextEditingController _controladorDataAtendimento =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final widthTotal = MediaQuery.of(context).size.width;

    final PreferredSizeWidget appBar = AppBar(
      title: Text(""),
    );

    void _saveItem() {
      Paciente(
        nomePaciente: _controladorNomePaciente.text,
        clinica: globals.valueDropClinica,
        valorConsulta: _controladorValorConsulta.text,
        dataAtendimento: _controladorDataAtendimento.text,
      )
          .addPaciente()
          .then((_) => {Navigator.of(context).pushNamed(AppRoute.PACIENTES)});
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
                textController: _controladorNomePaciente,
                widthTotal: widthTotal,
                textInputType: TextInputType.text,
                labelText: "Nome do paciente",
                icon: Icon(Icons.person_outline_rounded),
              ),
              DropDown(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Seletores(
              //       widthTotal: widthTotal,
              //       icon: Icon(Icons.crop_square, size: 40),
              //       text: "Convênio",
              //     ),
              //     Seletores(
              //       widthTotal: widthTotal,
              //       icon: Icon(Icons.crop_square, size: 40),
              //       text: "Particular",
              //     ),
              //   ],
              // ),
              TextInput(
                textController: _controladorValorConsulta,
                widthTotal: widthTotal,
                textInputType: TextInputType.number,
                labelText: "Valor da Consulta",
                hint: "R\$50,00",
                icon: Icon(Icons.monetization_on_outlined),
              ),
              TextInput(
                textController: _controladorDataAtendimento,
                widthTotal: widthTotal,
                textInputType: TextInputType.datetime,
                icon: Icon(Icons.calendar_today),
                labelText: "Data de Atendimento",
                hint: "${DateFormat('dd/MM/y').format(DateTime.now())}",
              ),
              Container(
                width: mediaQuery.size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    _saveItem();
                  },
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => Colors.green.shade300,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all<double>(5),
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  ),
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
