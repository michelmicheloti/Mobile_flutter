import 'package:agenda/Utils/app_routs.dart';
import 'package:agenda/providers/auth.dart';
import 'package:agenda/screens/agenda_diaria_screen.dart';
import 'package:agenda/screens/auth_home_screen.dart';
import 'package:agenda/screens/auth_screen.dart';
import 'package:agenda/screens/clinica/clinica_cadastro_screen.dart';
import 'package:agenda/screens/clinica/clinicas_screen.dart';
import 'package:agenda/screens/home_screen.dart';
import 'package:agenda/screens/paciente/paciente_cadastro_screen.dart';
import 'package:agenda/screens/paciente/pacientes_screen.dart';
import 'package:agenda/screens/rendimentos_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Agenda',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          // primaryColor: Color.fromRGBO(204, 147, 145, 0.9),
          accentColor: Color.fromRGBO(172, 100, 98, 1),
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(239, 198, 197, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              ),
        ),
        // home: HomeScreen(),
        routes: {
          // AppRoute.AUTH: (ctx) => AuthScreen(),
          // AppRoute.HOME: (ctx) => HomeScreen(),
          AppRoute.AUTH_HOME: (ctx) => AuthOrHomeScreen(),
          AppRoute.AGENDA_DIARIA: (ctx) => AgendaDiariaScreen(),
          AppRoute.PACIENTES: (ctx) => PacientesScreen(),
          AppRoute.PACIENTES_CADASTRO: (ctx) => PacienteCadastroScreen(),
          AppRoute.CLINICAS: (ctx) => ClinicasScreen(),
          AppRoute.CLINICAS_CADASTRO: (ctx) => ClinicaCadastroScreen(),
          AppRoute.RENDIMENTOS: (ctx) => RendimentosScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(),
    );
  }
}
