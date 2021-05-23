import 'dart:convert';

import 'package:http/http.dart' as http;

class Clinica {
  final String nomeClinica;
  final String inicioAtentimentos;
  final String fimAtentimentos;
  final String minutosAtentimentos;
  final String valor;
  // final String diaSemana;

  Clinica(
      {required this.nomeClinica,
      required this.inicioAtentimentos,
      required this.fimAtentimentos,
      // required this.diaSemana,
      required this.minutosAtentimentos,
      required this.valor});

  // Future<void> addClinica(Clinica novaClinica) async {
  //   // const url = '';
  //   // var response = await http.get(url);
  // }

  Future<void> addClinica() async {
    var client = http.Client();
    try {
      var uriResponse = await client.post(
          Uri.parse(
              'https://mobile-flutter-fb11c-default-rtdb.firebaseio.com/clinicas.json'),
          body: json.encode({
            'nomeClinica': 'teste',
            'inicioAtentimentos': this.inicioAtentimentos,
            'fimAtentimentos': this.fimAtentimentos,
            'minutosAtentimentos': this.minutosAtentimentos,
            'valor': this.valor
          }));
      print(uriResponse);
    } finally {
      client.close();
    }
  }
}
