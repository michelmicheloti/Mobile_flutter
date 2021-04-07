import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/models/home_page_icons.dart';
import 'package:flutter/material.dart';

class ClinicasScreen extends StatelessWidget {
  const ClinicasScreen({Key? key}) : super(key: key);

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
                            'Nome da Clínica',
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
  }
}
