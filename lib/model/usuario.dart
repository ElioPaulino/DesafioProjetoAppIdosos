class Usuario {
  late String id;
  late String nome;
  late String idade;
  late String sexo;
  late String login;
  late String senha;

  Usuario(this.id, this.nome, this.idade, this.sexo, this.login, this.senha);

  Usuario.fromJson(Map<String, dynamic> map, String id) {
    this.id = id;
    this.nome = map['nome'];
    this.idade = map['idade'];
    this.sexo = map['sexo'];
    this.login = map['login'];
    this.senha = map['senha'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
      'idade': this.idade,
      'sexo': this.sexo,
      'login': this.login,
      'senha': this.senha
    };
  }
}