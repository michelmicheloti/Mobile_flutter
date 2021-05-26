import 'package:agenda/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import './auth_screen.dart';

class AuthOrHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? HomeScreen() : AuthScreen();
    // return FutureBuilder(
    //   future: auth.tryAutoLogin(),
    //   builder: (ctx, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.error != null) {
    //       return Center(child: Text('Ocorreu um erro!'));
    //     } else {
    //       return auth.isAuth ? ProductOverviewScreen() : AuthScreen();
    //     }
    //   },
    // );
  }
}
