import 'dart:convert';
import 'package:http/http.dart' as http;

class Clinica {
  final String _baseUri =
      'https://teste-fb614-default-rtdb.firebaseio.com/clinicas';
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
      var response = await _client.get(Uri.parse("$_baseUri.json"));

      if (response.body != "null") {
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
      }

      return listaClinicas;
    } finally {
      _client.close();
    }
  }

  Future<void> addClinica() async {
    try {
      var uriResponse = await _client.post(Uri.parse("$_baseUri.json"),
          body: json.encode({
            'nomeClinica': this.nomeClinica,
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

  Future<void> removeClinica(id) async {
    id = id.toString().replaceAll("[{", "");
    try {
      final http.Response response = await http.delete(
        Uri.parse("$_baseUri/$id.json"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(response);
    } finally {
      _client.close();
    }
  }

  Future<void> update(id) async {
    id = id.toString().replaceAll("[", "");
    try {
      final http.Response response = await http.patch(
        Uri.parse("$_baseUri/$id.json"),
        body: json.encode({
          'nomeClinica': this.nomeClinica,
          'inicioAtentimentos': this.inicioAtentimentos,
          'fimAtentimentos': this.fimAtentimentos,
          'minutosAtentimentos': this.minutosAtentimentos,
          'valor': this.valor
        }),
      );

      print(response);
    } finally {
      _client.close();
    }
  }
}
