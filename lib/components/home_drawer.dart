import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  Widget _createItem(String label, void Function() onTap) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.pink,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Menu',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 20),
          // Divider(),
          // _createItem(
          //   'Home',
          //   () => Navigator.of(context).pushReplacementNamed(
          //     AppRoute.HOME,
          //   ),
          // ),
          // Divider(),
          // _createItem(
          //   'Agenda Diária',
          //   () => Navigator.of(context).pushReplacementNamed(
          //     AppRoute.HOME,
          //   ),
          // ),
          // Divider(),
          // _createItem(
          //   'Clínicas',
          //   () => Navigator.of(context).pushReplacementNamed(
          //     AppRoute.HOME,
          //   ),
          // ),
          // Divider(),
          // _createItem(
          //   'Pacientes',
          //   () => Navigator.of(context).pushReplacementNamed(
          //     AppRoute.HOME,
          //   ),
          // ),
          // Divider(),
          // _createItem(
          //   'Rendimentos',
          //   () => Navigator.of(context).pushReplacementNamed(
          //     AppRoute.HOME,
          //   ),
          // ),
          Divider(),
          ListTile(
            // leading: Icon(Icons.exit_to_app),
            title: Text(
              'Sair',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
