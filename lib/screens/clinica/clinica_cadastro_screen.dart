import 'package:agenda/components/text_input.dart';
import 'package:agenda/models/clinica.dart';
import 'package:flutter/material.dart';

class ClinicaCadastroScreen extends StatefulWidget {
  @override
  _ClinicaCadastroScreenState createState() => _ClinicaCadastroScreenState();
}

class _ClinicaCadastroScreenState extends State<ClinicaCadastroScreen> {
  final TextEditingController _controladorInicioAtentimentos =
      TextEditingController();
  final TextEditingController _controladorFimAtentimentos =
      TextEditingController();
  final TextEditingController _controladorMinutosAtentimentos =
      TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();
  final TextEditingController _controladorNomeClinica = TextEditingController();
  // final TextEditingController _controladorDiaSemana = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final widthTotal = mediaQuery.size.width;

    final PreferredSizeWidget appBar = AppBar(
      title: Text(""),
    );

    void _saveItem() {
      Clinica(
        nomeClinica: _controladorNomeClinica.text,
        inicioAtentimentos: _controladorInicioAtentimentos.text,
        fimAtentimentos: _controladorFimAtentimentos.text,
        minutosAtentimentos: _controladorMinutosAtentimentos.text,
        valor: _controladorValor.text,
        // diaSemana: _controladorDiaSemana.text
      ).addClinica().then((_) => {Navigator.of(context).pop()});
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
        child: Form(
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
                    textController: _controladorNomeClinica,
                    widthTotal: widthTotal,
                    textInputType: TextInputType.text,
                    labelText: "Nome da Clínica",
                    hint: "Clinica Tal",
                    icon: Icon(Icons.text_fields),
                  ),
                  TextInput(
                    textController: _controladorInicioAtentimentos,
                    widthTotal: widthTotal,
                    textInputType: TextInputType.datetime,
                    labelText: "Início dos Atendimentos",
                    hint: "dd/mm/yyyy",
                    icon: Icon(Icons.calendar_today),
                  ),
                  TextInput(
                    textController: _controladorFimAtentimentos,
                    widthTotal: widthTotal,
                    textInputType: TextInputType.datetime,
                    labelText: "Fim dos Atendimentos",
                    hint: "dd/mm/yyyy",
                    icon: Icon(Icons.calendar_today),
                  ),
                  TextInput(
                    textController: _controladorMinutosAtentimentos,
                    widthTotal: widthTotal,
                    textInputType: TextInputType.datetime,
                    labelText: "Minutos de Atendimentos",
                    hint: "00:30",
                    icon: Icon(Icons.access_time),
                  ),
                  TextInput(
                    textController: _controladorValor,
                    widthTotal: widthTotal,
                    textInputType: TextInputType.number,
                    labelText: "Valor do Atendimento",
                    hint: "R\$50,00",
                    icon: Icon(Icons.monetization_on_outlined),
                  ),
                  Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(
                      //       "Dias de Atendimento",
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     DiasDaSemana(text: "SEG"),
                      //     DiasDaSemana(text: "TER"),
                      //     DiasDaSemana(text: "QUA"),
                      //     DiasDaSemana(text: "QUI"),
                      //     DiasDaSemana(text: "SEX"),
                      //     DiasDaSemana(text: "SAB"),
                      //   ],
                      // ),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            elevation: MaterialStateProperty.all<double>(5),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
