class Consulta {
  late String id;
  late String nomeMedico;
  late String endereco;
  late String numero;
  late String celular;
  late String dia;
  late String mes;
  late String ano;
  late String usuario;
  late String hora;
  late String minuto;

  Consulta(
      this.id,
      this.nomeMedico,
      this.endereco,
      this.numero,
      this.celular,
      this.dia,
      this.mes,
      this.ano,
      this.usuario,
      this.hora,
      this.minuto);

  Consulta.fromJson(Map<String, dynamic> map, String id) {
    this.id = id;
    this.nomeMedico = map['nomeMedico'];
    this.endereco = map['endereco'];
    this.numero = map['numero'];
    this.celular = map['celular'];
    this.dia = map['dia'];
    this.mes = map['mes'];
    this.ano = map['ano'];
    this.usuario = map['usuario'];
    this.hora = map['hora'];
    this.minuto = map['minuto'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nomeMedico': this.nomeMedico,
      'endereco': this.endereco,
      'numero': this.numero,
      'celular': this.celular,
      'dia': this.dia,
      'mes': this.mes,
      'ano': this.ano,
      'usuario': this.usuario,
      'hora': this.hora,
      'minuto': this.minuto
    };
  }
}
