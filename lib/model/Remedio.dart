class Remedio {
  late String id;
  late String nomeRemedio;
  late String nomeMedico;
  late bool segunda;
  late bool terca;
  late bool quarta;
  late bool quinta;
  late bool sexta;
  late bool sabado;
  late bool domingo;
  late String usuario;
  late String hora;
  late String minuto;

  Remedio(
      this.id,
      this.nomeRemedio,
      this.nomeMedico,
      this.segunda,
      this.terca,
      this.quarta,
      this.quinta,
      this.sexta,
      this.sabado,
      this.domingo,
      this.usuario,
      this.hora,
      this.minuto);

  Remedio.fromJson(Map<String, dynamic> map, String id) {
    this.id = id;
    this.nomeRemedio = map['nomeRemedio'];
    this.nomeMedico = map['nomeMedico'];
    this.segunda = map['segunda'];
    this.terca = map['terca'];
    this.quarta = map['quarta'];
    this.quinta = map['quinta'];
    this.sexta = map['sexta'];
    this.sabado = map['sabado'];
    this.domingo = map['domingo'];
    this.usuario = map['usuario'];
    this.hora = map['hora'];
    this.minuto = map['minuto'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nomeRemedio': this.nomeRemedio,
      'nomeMedico': this.nomeMedico,
      'segunda': this.segunda,
      'terca': this.terca,
      'quarta': this.quarta,
      'quinta': this.quinta,
      'sexta': this.sexta,
      'sabado': this.sabado,
      'domingo': this.domingo,
      'usuario': this.usuario,
      'hora': this.hora,
      'minuto': this.minuto
    };
  }
}
