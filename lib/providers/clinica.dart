import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agenda/Utils/globals.dart' as globals;

class Clinica {
  final String _baseUri =
      'https://flutter-mobile-3e560-default-rtdb.firebaseio.com/clinicas';
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

      globals.listaClinicas.clear();
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
          globals.listaClinicas.add(clinica.toString());
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
      await carregaClinica();
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
      await carregaClinica();
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
      await carregaClinica();
      print(response);
    } finally {
      _client.close();
    }
  }
}
