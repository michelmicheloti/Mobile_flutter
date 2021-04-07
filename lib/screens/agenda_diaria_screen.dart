import 'package:agenda/models/home_page_icons.dart';
import 'package:flutter/material.dart';

class AgendaDiariaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageIcons =
        ModalRoute.of(context)?.settings.arguments as HomePageIcons;

    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            homePageIcons.title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );

    final availabelHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

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
              itemCount: 12,
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
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'HORA',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.symmetric(
                          horizontal: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          'Nome Paciente',
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                Icons.cancel,
                                color: Colors.red.shade300,
                              )),
                          Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.symmetric(
                                horizontal: 1,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.green.shade300,
                              )),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
