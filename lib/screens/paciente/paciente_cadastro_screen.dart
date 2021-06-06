import 'package:agenda/components/data_time/date_picker_widget.dart';
import 'package:agenda/components/dropdown.dart';
import 'package:agenda/components/text_input.dart';
import 'package:agenda/Utils/globals.dart' as globals;
import 'package:agenda/providers/paciente.dart';
import 'package:flutter/material.dart';

class PacienteCadastroScreen extends StatefulWidget {
  @override
  _PacienteCadastroScreen createState() => _PacienteCadastroScreen();
}

class _PacienteCadastroScreen extends State<PacienteCadastroScreen> {
  String id = "";
  String data = "";
  TextEditingController _controladorNomePaciente = TextEditingController();
  TextEditingController _controladorValorConsulta = TextEditingController();

  GlobalKey<FormState> _form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final widthTotal = MediaQuery.of(context).size.width;

    final PreferredSizeWidget appBar = AppBar(
      title: Text(""),
    );

    if (globals.updatePaciente) {
      globals.count = 0;
      List<String> lista = globals.listaPacientes.toString().split(",");
      id = lista[0].replaceAll("[[{", "");
      data = lista[5].replaceAll("}", "");
      String lDataAtendimento = data.trimLeft();
      List<String> listDataAtendimento = lDataAtendimento.split(" ");
      lDataAtendimento = listDataAtendimento[0] + "T03:18:31.177769-04:00";
      globals.dataAtendimento = DateTime.parse(lDataAtendimento);
      _controladorNomePaciente =
          new TextEditingController(text: lista[1].trimLeft());
      _controladorValorConsulta =
          new TextEditingController(text: lista[4].trimLeft());

      // _controladorDataAtendimento =
      //     new TextEditingController(text: data.replaceAll("]", "").trimLeft());
    } else {
      globals.dataAtendimento = DateTime.now();
    }

    void _saveItem() {
      if (id.isEmpty) {
        Paciente(
          nomePaciente: _controladorNomePaciente.text,
          clinica: globals.valueDropClinica,
          valorConsulta: _controladorValorConsulta.text,
          dataAtendimento: globals.dataAtendimento.toString(),
        ).addPaciente().then((_) => {Navigator.of(context).pop()});
      } else {
        Paciente(
          nomePaciente: _controladorNomePaciente.text,
          clinica: globals.valueDropClinica,
          valorConsulta: _controladorValorConsulta.text,
          dataAtendimento: globals.dataAtendimento.toString(),
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
        child: Form(
          key: _form,
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
                TextInput(
                  textController: _controladorValorConsulta,
                  widthTotal: widthTotal,
                  textInputType: TextInputType.number,
                  labelText: "Valor da Consulta",
                  hint: "R\$50,00",
                  icon: Icon(Icons.monetization_on_outlined),
                ),
                DatePickerWidget(
                  valueButton: 'Selecione uma Data',
                  textUpButton: 'Data do Atendimento',
                  data: globals.dataAtendimento,
                  typeDate: "dataAtendimento",
                ),
                // TextInput(
                //   textController: _controladorDataAtendimento,
                //   widthTotal: widthTotal,
                //   textInputType: TextInputType.datetime,
                //   icon: Icon(Icons.calendar_today),
                //   labelText: "Data de Atendimento",
                //   hint: "${DateFormat('dd/MM/y').format(DateTime.now())}",
                // ),
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
