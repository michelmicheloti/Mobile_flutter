class Clinica {
  final String inicioAtentimentos;
  final String fimAtentimentos;
  final String minutosAtentimentos;
  final String valor;
  final String diaSemana;

  Clinica(
      {required this.inicioAtentimentos,
      required this.fimAtentimentos,
      required this.diaSemana,
      required this.minutosAtentimentos,
      required this.valor});

  // Future<void> addClinica(Clinica novaClinica) async {
  //   // const url = '';
  //   // var response = await http.get(url);
  // }

  void addClinica(Clinica novaClinica) {
    print(novaClinica.inicioAtentimentos);
    // const url = '';
    // http.post(url);
  }

  void testeTeste() {
    print(this.inicioAtentimentos);
    // const url = '';
    // http.post(url);
  }
}
