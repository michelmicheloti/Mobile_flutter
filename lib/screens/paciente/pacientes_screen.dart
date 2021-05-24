import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/components/dropdown.dart';
import 'package:agenda/models/paciente.dart';
import 'package:flutter/material.dart';

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
                          itemCount: listaPacientes.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: mediaQuery.size.width * 0.9,
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
