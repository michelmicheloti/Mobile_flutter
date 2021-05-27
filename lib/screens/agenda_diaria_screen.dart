import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/providers/paciente.dart';
import 'package:flutter/material.dart';

class AgendaDiariaScreen extends StatefulWidget {
  @override
  _AgendaDiariaScreen createState() => _AgendaDiariaScreen();
}

class _AgendaDiariaScreen extends State<AgendaDiariaScreen> {
  List<String> listaPacientes = [];
  late Future<List<String>> pacientes;

  @override
  void initState() {
    pacientes = Paciente().carregaPaciente();
    super.initState();
  }

  bool status(statusAtendimento) {
    return statusAtendimento.toString().contains("false");
  }

  Color _isLiked(statusAtendimento) {
    Color colorBox;
    bool a = statusAtendimento.toString().contains("false");
    if (a) {
      colorBox = Colors.white;
    } else {
      colorBox = Colors.green.shade300;
    }

    return colorBox;
  }

  @override
  Widget build(BuildContext context) {
    // final homePageIcons =
    //     ModalRoute.of(context)?.settings.arguments as HomePageIcons;

    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Agenda",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
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
            appBar: appBar,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: availabelHeight * 0.9,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                              decoration: BoxDecoration(
                                color: _isLiked(
                                    listaPacientes[index].split(",")[3]),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                listaPacientes[index]
                                    .split(",")[5]
                                    .replaceAll("}]", ""),
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.symmetric(
                                  horizontal: 1,
                                ),
                                decoration: BoxDecoration(
                                  color: _isLiked(
                                      listaPacientes[index].split(",")[3]),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  listaPacientes[index].split(",")[1],
                                ),
                              ),
                            ),
                            Material(
                              color:
                                  _isLiked(listaPacientes[index].split(",")[3]),
                              borderRadius: BorderRadius.circular(15),
                              child: InkWell(
                                splashColor: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  Paciente()
                                      .removePaciente(
                                          listaPacientes[index].split(",")[0])
                                      .then((_) => {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    AppRoute.AGENDA_DIARIA)
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
                            if (listaPacientes[index]
                                .split(",")[3]
                                .contains("false"))
                              Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                child: InkWell(
                                  splashColor: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(15),
                                  onTap: () {
                                    Paciente()
                                        .updateStatusAtendimento(
                                            listaPacientes[index].split(",")[0])
                                        .then((_) => {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      AppRoute.AGENDA_DIARIA)
                                            });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(12),
                                      child: Icon(
                                        Icons.check_circle,
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
          );
        },
      ),
    );
  }
}

// class Buttons extends StatelessWidget {
//   final IconData icon;
//   final Color color;
//   final void function;

//   const Buttons({
//     Key? key,
//     required this.icon,
//     required this.color,
//     required this.function,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(15),
//       child: InkWell(
//         splashColor: Theme.of(context).primaryColor,
//         borderRadius: BorderRadius.circular(15),
//         onTap: () {
//           // ignore: unnecessary_statements
//           function;
//         },
//         child: Container(
//             padding: EdgeInsets.all(12),
//             child: Icon(
//               icon,
//               color: color,
//             )),
//       ),
//     );
//   }
// }

// class NomePaciente extends StatelessWidget {
//   const NomePaciente({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       fit: FlexFit.tight,
//       child: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.all(15),
//         margin: EdgeInsets.symmetric(
//           horizontal: 1,
//         ),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Text(
//           "testa",
//         ),
//       ),
//     );
//   }
// }

// class Hora extends StatelessWidget {
//   const Hora({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(15),
//       margin: EdgeInsets.symmetric(
//         horizontal: 1,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Text(
//         'HORA',
//       ),
//     );
//   }
// }
