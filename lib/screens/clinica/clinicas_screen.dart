import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/providers/clinica.dart';
import 'package:flutter/material.dart';
import 'package:agenda/Utils/globals.dart' as globals;

class ClinicasScreen extends StatefulWidget {
  @override
  _ClinicasScreen createState() => _ClinicasScreen();
}

// ignore: must_be_immutable
class _ClinicasScreen extends State<ClinicasScreen> {
  List<String> listaClinicas = [];
  late Future<List<String>> clinicas;

  @override
  void initState() {
    clinicas = Clinica().carregaClinica();
    globals.updateClinica = false;
    globals.listaClinicas.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final PreferredSizeWidget appBar = AppBar(
      title: Text("Clinicas"),
    );

    final availabelHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;
    return Container(
      child: FutureBuilder(
        future: clinicas,
        builder: (ctx, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          listaClinicas = snapshot.data.toString().split("}, {");

          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Clinicas",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            body: Center(
              child: Column(
                children: [
                  Container(
                    height: availabelHeight * 0.9,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: listaClinicas[0].contains(",")
                          ? listaClinicas.length
                          : 0,
                      itemBuilder: (value, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 250,
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  listaClinicas[index].split(",")[1],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                child: InkWell(
                                  splashColor: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {
                                    Clinica()
                                        .removeClinica(
                                            listaClinicas[index].split(",")[0])
                                        .then((_) => {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      AppRoute.CLINICAS)
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
                                  splashColor: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {
                                    globals.listaClinicas
                                        .add(listaClinicas[index]);
                                    globals.updateClinica = true;
                                    Navigator.of(context).pushReplacementNamed(
                                        AppRoute.CLINICAS_CADASTRO);
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
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(AppRoute.CLINICAS_CADASTRO),
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
