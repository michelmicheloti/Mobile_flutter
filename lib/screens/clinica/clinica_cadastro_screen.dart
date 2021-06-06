import 'package:agenda/components/data_time/date_picker_widget.dart';
import 'package:agenda/components/data_time/time_picker_widget.dart';
import 'package:agenda/components/text_input.dart';
import 'package:agenda/providers/clinica.dart';
import 'package:flutter/material.dart';
import 'package:agenda/Utils/globals.dart' as globals;

class ClinicaCadastroScreen extends StatefulWidget {
  @override
  _ClinicaCadastroScreenState createState() => _ClinicaCadastroScreenState();
}

class _ClinicaCadastroScreenState extends State<ClinicaCadastroScreen> {
  String id = "";
  String valor = "";

  TextEditingController _controladorValor = TextEditingController();
  TextEditingController _controladorNomeClinica = TextEditingController();

  GlobalKey<FormState> _form = GlobalKey();

  @override
  void initState() {
    super.initState();
    if (globals.updateClinica) {
      List<String> lista = globals.listaClinicas.toString().split(",");

      String lDataInicial = lista[2].trimLeft();
      List<String> listDataInicial = lDataInicial.split(" ");
      lDataInicial = listDataInicial[0] + "T03:18:31.177769-04:00";
      globals.dataInicial = DateTime.parse(lDataInicial);

      String lDataFinal = lista[3].trimLeft();
      List<String> listDataFinal = lDataFinal.split(" ");
      lDataFinal = listDataFinal[0] + "T03:18:31.177769-04:00";
      globals.dataFinal = DateTime.parse(lDataFinal);

      id = lista[0].replaceAll("[[{", "");
      valor = lista[5].replaceAll("}", "");
      _controladorNomeClinica =
          new TextEditingController(text: lista[1].trimLeft());
      _controladorValor =
          new TextEditingController(text: valor.replaceAll("]", "").trimLeft());
    } else {
      globals.dataInicial = DateTime.now();
      globals.dataFinal = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final widthTotal = mediaQuery.size.width;

    final PreferredSizeWidget appBar = AppBar(
      title: Text(""),
    );

    void _saveItem() {
      if (id.isEmpty) {
        Clinica(
          nomeClinica: _controladorNomeClinica.text,
          inicioAtentimentos: globals.dataInicial.toString(),
          fimAtentimentos: globals.dataFinal.toString(),
          minutosAtentimentos: '00:30',
          valor: _controladorValor.text,
        ).addClinica().then((_) => {Navigator.of(context).pop()});
      } else {
        Clinica(
          nomeClinica: _controladorNomeClinica.text,
          inicioAtentimentos: globals.dataInicial.toString(),
          fimAtentimentos: globals.dataFinal.toString(),
          valor: _controladorValor.text,
        ).update(id).then((_) => {Navigator.of(context).pop()});
      }
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
          key: _form,
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
                    hint: "Clínica",
                    icon: Icon(Icons.text_fields),
                  ),
                  DatePickerWidget(
                    valueButton: 'Selecione uma Data',
                    textUpButton: 'Início dos Atendimentos',
                    data: globals.dataInicial,
                    typeDate: "dataInicial",
                  ),
                  DatePickerWidget(
                    valueButton: 'Selecione uma Data',
                    textUpButton: 'Fim dos Atendimentos',
                    data: globals.dataFinal,
                    typeDate: "dataFinal",
                  ),
                  TimePickerWidget(),
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
                      Container(
                        width: mediaQuery.size.width * 0.9,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_form.currentState!.validate()) {
                              _saveItem();
                            }
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
                // TextInput(
                //   textController: _controladorInicioAtentimentos,
                //   widthTotal: widthTotal,
                //   textInputType: TextInputType.datetime,
                //   labelText: "Início dos Atendimentos",
                //   hint: "dd/mm/yyyy",
                //   icon: Icon(Icons.calendar_today),
                // ),
                // TextInput(
                //   textController: _controladorFimAtentimentos,
                //   widthTotal: widthTotal,
                //   textInputType: TextInputType.datetime,
                //   labelText: "Fim dos Atendimentos",
                //   hint: "dd/mm/yyyy",
                //   icon: Icon(Icons.calendar_today),
                // ),
                // TextInput(
                //   textController: _controladorMinutosAtentimentos,
                //   widthTotal: widthTotal,
                //   textInputType: TextInputType.datetime,
                //   labelText: "Minutos de Atendimentos",
                //   hint: "00:30",
                //   icon: Icon(Icons.access_time),
                // ),
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
