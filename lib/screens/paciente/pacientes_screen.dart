import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/models/clinica.dart';
import 'package:agenda/Utils/globals.dart' as globals;
import 'package:agenda/models/home_page_icons.dart';
import 'package:flutter/material.dart';

import 'paciente_cadastro_screen.dart';

class PacientesScreen extends StatefulWidget {
  const PacientesScreen({Key? key}) : super(key: key);

  @override
  _PacientesScreenState createState() => _PacientesScreenState();
}

class _PacientesScreenState extends State<PacientesScreen> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    // final homePageIcons =
    //     ModalRoute.of(context)?.settings.arguments as HomePageIcons;

    final mediaQuery = MediaQuery.of(context);

    final PreferredSizeWidget appBar = AppBar(
      title: Text("Pacientes"),
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
              "Pacientes",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: mediaQuery.size.width * 0.98,
              child: DropDown(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: availabelHeight * 0.8,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: mediaQuery.size.width * 0.9,
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                'Nome do Paciente',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.of(context).pushNamed(AppRoute.PACIENTES_CADASTRO),
        backgroundColor: Colors.blue.shade500,
        child: Icon(
          Icons.add,
          size: 35,
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
  List<String> listaClinicas = [];
  late Future<List<String>> clinicas;

  @override
  void initState() {
    clinicas = Clinica().carregaClinica();
    super.initState();
  }

  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: clinicas,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          listaClinicas = snapshot.data.toString().split("}, {");
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                  iconSize: 32,
                  isExpanded: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue as String;
                      globals.valueDropClinica =
                          valueChoose.toString().split(",")[1];
                    });
                  },
                  items: listaClinicas.map(
                    (valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            valueItem.split(",")[1],
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
