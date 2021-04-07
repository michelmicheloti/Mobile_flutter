import 'package:agenda/models/home_page_icons.dart';
import 'package:flutter/material.dart';

class RendimentosScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final homePageIcons =
        ModalRoute.of(context)?.settings.arguments as HomePageIcons;

    return Scaffold(
      appBar: AppBar(
        // title: Text(homePageIcons.title),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Selecione a Clinica',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        Icons.arrow_downward,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Data Inicial',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        Icons.date_range,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Data Final',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Icon(
                        Icons.date_range,
                        size: 20,
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Valor a receber:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Container(
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'R\$ 50,00',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
