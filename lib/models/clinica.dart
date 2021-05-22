import 'package:http/http.dart' as http;

class Clinica {
  final String id;
  final DateTime inicioAtentimentos;
  final DateTime fimAtentimentos;
  final String minutosAtentimentos;
  final double valor;
  final String diaSemana;

  Clinica(
      {required this.id,
      required this.inicioAtentimentos,
      required this.fimAtentimentos,
      required this.diaSemana,
      required this.minutosAtentimentos,
      required this.valor});

  // Future<void> addClinica(Clinica novaClinica) async {
  //   // const url = '';
  //   // var response = await http.get(url);
  // }
}
