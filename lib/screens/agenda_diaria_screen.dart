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
                      Hora(),
                      NomePaciente(),
                      Buttons(
                        icon: Icons.cancel,
                        color: Colors.red.shade300,
                      ),
                      Buttons(
                        icon: Icons.check_circle,
                        color: Colors.green.shade300,
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

class Buttons extends StatelessWidget {
  final IconData icon;
  final Color color;

  const Buttons({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: () {},
        child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(
              horizontal: 1,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: color,
            )),
      ),
    );
  }
}

class NomePaciente extends StatelessWidget {
  const NomePaciente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        alignment: Alignment.center,
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
    );
  }
}

class Hora extends StatelessWidget {
  const Hora({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
