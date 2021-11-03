import 'package:projeto_desafio_elio_lucas/model/usuario.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuarioState createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  var txtNome = TextEditingController();
  var txtIdade = TextEditingController();
  var txtSexo = TextEditingController();
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();
  var txtSenhaConf = TextEditingController();
  var _formId = GlobalKey<FormState>();

  //Recuperar um documento a partir do ID
  getDocumentById(String id) async {
    await FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(id)
        .get()
        .then((value) {
      txtNome.text = value.data()!['nome'].toString();
      txtIdade.text = value.data()!['idade'].toString();
      txtSexo.text = value.data()!['sexo'].toString();
      txtLogin.text = value.data()!['login'].toString();
      txtSenha.text = value.data()!['senha'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    //Recuperar o ID que foi passado como argumento
    var id = ModalRoute.of(context)?.settings.arguments;
    Usuario? usuario;
    if (id != null) {
      usuario = getDocumentById(id.toString());
      txtNome.text = usuario!.nome;
      txtIdade.text = usuario.idade;
      txtSexo.text = usuario.sexo;
      txtLogin.text = usuario.login;
      txtSenha.text = usuario.senha;
    }

    return Scaffold(
        backgroundColor: Colors.purple[800],
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(40),
            child: Form(
              key: _formId,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_box,
                    color: Colors.yellow,
                    size: 160,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: txtNome,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: "Informe o nome",
                      labelStyle: TextStyle(color: Colors.yellow),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: txtIdade,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: "Informe a Idade",
                      labelStyle: TextStyle(color: Colors.yellow),
                    ),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: txtSexo,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: "Informe o Sexo",
                      labelStyle: TextStyle(color: Colors.yellow),
                    ),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtLogin,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe o login',
                      labelStyle: TextStyle(color: Colors.yellow),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtSenha,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe a senha',
                      labelStyle: TextStyle(color: Colors.yellow),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: txtSenhaConf,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow)),
                      labelText: 'Informe a senha novamente',
                      labelStyle: TextStyle(color: Colors.yellow),
                    ),
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    height: 70,
                    child: ElevatedButton.icon(
                      style: ButtonStyle(backgroundColor:
                          MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.yellow;
                          return Colors.yellow;
                        },
                      )),
                      label: Text(
                        'Cadastrar',
                        style: TextStyle(fontSize: 24),
                      ),
                      icon: Icon(Icons.app_registration),
                      onPressed: () {
                        criarConta(txtNome.text, txtLogin.text, txtSenha.text,
                            txtIdade.text, txtSexo.text);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha, idade, sexo) {
    FirebaseAuth fa = FirebaseAuth.instance;

    fa
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      //armazenar dados da conta no Firestore
      var db = FirebaseFirestore.instance;
      db.collection('Usuarios').doc(resultado.user!.uid).set({
        'nome': nome,
        'idade': idade,
        'sexo': sexo,
      }).then((valor) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Usuário criado com sucesso.'),
          duration: Duration(seconds: 2),
        ));
        Navigator.pop(context);
      });
    }).catchError((erro) {
      var errorCode = erro.code;
      //print(errorCode);

      if (errorCode == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ERRO: O email informado já está em uso.'),
          duration: Duration(seconds: 2),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('ERRO ${erro.message}'),
          duration: Duration(seconds: 2),
        ));
      }
    });
  }
}
