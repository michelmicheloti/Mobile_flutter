import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/providers/paciente.dart';
import 'package:flutter/material.dart';
import 'package:agenda/Utils/globals.dart' as globals;

class PacientesScreen extends StatefulWidget {
  const PacientesScreen({Key? key}) : super(key: key);

  @override
  _PacientesScreenState createState() => _PacientesScreenState();
}

class _PacientesScreenState extends State<PacientesScreen> {
  String dropdownValue = 'One';

  List<String> listaPacientes = [];
  late Future<List<String>> pacientes;

  @override
  void initState() {
    pacientes = Paciente().carregaPaciente();
    super.initState();
    globals.updatePaciente = false;
    globals.listaPacientes.clear();
  }

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

    return Container(
      child: FutureBuilder(
        future: pacientes,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          listaPacientes = snapshot.data.toString().split("}, {");

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: availabelHeight * 0.7,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                          itemCount: listaPacientes[0].contains(",")
                              ? listaPacientes.length
                              : 0,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 250,
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      listaPacientes[index].split(",")[1],
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    child: InkWell(
                                      splashColor:
                                          Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        Paciente()
                                            .removePaciente(
                                                listaPacientes[index]
                                                    .split(",")[0])
                                            .then((_) => {
                                                  Navigator.of(context)
                                                      .pushReplacementNamed(
                                                          AppRoute.PACIENTES)
                                                });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(12),
                                          child: Icon(
                                            Icons.cancel,
                                            color: Colors.red.shade300,
                                          )),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    child: InkWell(
                                      splashColor:
                                          Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        globals.listaPacientes
                                            .add(listaPacientes[index]);
                                        globals.updatePaciente = true;
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                AppRoute.PACIENTES_CADASTRO);
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(12),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.green.shade300,
                                          )),
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
        },
      ),
    );
  }
}
