import 'dart:convert';
import 'package:http/http.dart' as http;

class Clinica {
  final String _uri =
      'https://mobile-flutter-fb11c-default-rtdb.firebaseio.com/clinicas.json';
  final _client = http.Client();
  List<String> listaClinicas = [];
  final String? id;
  final String? nomeClinica;
  final String? inicioAtentimentos;
  final String? fimAtentimentos;
  final String? minutosAtentimentos;
  final String? valor;
  // final String diaSemana;

  Clinica(
      {this.id,
      this.nomeClinica,
      this.inicioAtentimentos,
      this.fimAtentimentos,
      // required this.diaSemana,
      this.minutosAtentimentos,
      this.valor});

  Future<List<String>> carregaClinica() async {
    try {
      var clinica;
      var response = await _client.get(Uri.parse(_uri));
      Map<String, dynamic> data = json.decode(response.body);
      data.forEach((idClinica, clinicaData) {
        clinica = {
          idClinica,
          clinicaData['nomeClinica'],
          clinicaData['inicioAtentimentos'],
          clinicaData['fimAtentimentos'],
          clinicaData['minutosAtentimentos'],
          clinicaData['valor'],
        };
        listaClinicas.add(clinica.toString());
      });
      return listaClinicas;
    } finally {
      _client.close();
    }
  }

  Future<void> addClinica() async {
    try {
      var uriResponse = await _client.post(Uri.parse(_uri),
          body: json.encode({
            'nomeClinica': 'teste',
            'inicioAtentimentos': this.inicioAtentimentos,
            'fimAtentimentos': this.fimAtentimentos,
            'minutosAtentimentos': this.minutosAtentimentos,
            'valor': this.valor
          }));
      print(uriResponse);
    } finally {
      _client.close();
    }
  }
}
