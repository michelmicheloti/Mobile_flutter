import 'dart:convert';
import 'package:http/http.dart' as http;

class Paciente {
  final String _uri =
      'https://mobile-flutter-fb11c-default-rtdb.firebaseio.com/pacientes.json';
  final _client = http.Client();
  List<String> listaPaciente = [];
  final String? id;
  final String? nomePaciente;
  final String? clinica;
  final String? convenioParticular;
  final String? valorConsulta;
  final String? dataAtendimento;

  Paciente(
      {this.id,
      this.nomePaciente,
      this.clinica,
      this.convenioParticular,
      this.valorConsulta,
      this.dataAtendimento});

  Future<List<String>> carregaPaciente() async {
    try {
      var paciente;
      var response = await _client.get(Uri.parse(_uri));
      Map<String, dynamic> data = json.decode(response.body);
      data.forEach((idPaciente, pacienteData) {
        paciente = {
          idPaciente,
          pacienteData['nomePaciente'],
          pacienteData['clinica'],
          pacienteData['convenioParticular'],
          pacienteData['valorConsulta'],
          pacienteData['dataAtendimento'],
        };
        listaPaciente.add(paciente.toString());
      });
      return listaPaciente;
    } finally {
      _client.close();
    }
  }

  Future<void> addPaciente() async {
    try {
      var uriResponse = await _client.post(Uri.parse(_uri),
          body: json.encode({
            'nomePaciente': 'teste',
            'clinica': this.clinica,
            'convenioParticular': this.convenioParticular,
            'valorConsulta': this.valorConsulta,
            'dataAtendimento': this.dataAtendimento
          }));
      print(uriResponse);
    } finally {
      _client.close();
    }
  }
}
