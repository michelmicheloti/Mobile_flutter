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
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 15,
              elevation: 16,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: ['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
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
                              width: 300,
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
        onPressed: () => Navigator.of(context).pushNamed(AppRoute.PACIENTES_CADASTRO),
        backgroundColor: Colors.blue.shade500,
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
