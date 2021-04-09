import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/models/home_page_icons.dart';
import 'package:flutter/material.dart';

class PacientesScreen extends StatefulWidget {
  const PacientesScreen({Key? key}) : super(key: key);

  @override
  _PacientesScreenState createState() => _PacientesScreenState();
}

class _PacientesScreenState extends State<PacientesScreen> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    final homePageIcons =
        ModalRoute.of(context)?.settings.arguments as HomePageIcons;

    final mediaQuery = MediaQuery.of(context);

    final PreferredSizeWidget appBar = AppBar(
      title: Text(homePageIcons.title),
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
              homePageIcons.title,
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
  String? valueChoose;
  List listItem = [
    "Clínica_1",
    "Clínica_2",
    "Clínica_3",
    "Clínica_4",
    "Clínica_5",
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
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
            iconSize: 24,
            isExpanded: true,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue as String;
              });
            },
            items: listItem.map(
              (valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      valueItem,
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
