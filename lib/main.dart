import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_desafio_elio_lucas/view/CadastroUsuario.dart';
import 'package:projeto_desafio_elio_lucas/view/calendario.dart';
import 'package:projeto_desafio_elio_lucas/view/consulta.dart';
import 'package:projeto_desafio_elio_lucas/view/menu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Hora do Remédio',

    //ROTAS DE NAVEGAÇÃO
    initialRoute: '/primeira',
    routes: {
      '/primeira': (context) => PrimeiraTela(),
      '/menu': (context) => HomeState(),
      '/calendario': (context) => Calendario(),
      '/cadastro': (context) => CadastroUsuario(),
      '/consulta': (context) => Consulta()
    },
    //Tema
    theme: ThemeData(
      primaryColor: Colors.purple[800],
      backgroundColor: Colors.purple[800],
      fontFamily: 'Roboto', //Raleway
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 30),
      ),
    ),
  ));
}

class PrimeiraTela extends StatefulWidget {
  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  var txtLogin = TextEditingController();
  var txtSenha = TextEditingController();

  var _formId = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formId,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('lib/imagens/Hora_do_Remedio.png'),
                //
                SizedBox(height: 30),
                TextField(
                  controller: txtLogin,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow)),
                    icon: Icon(Icons.person_outline, color: Colors.yellow),
                    labelText: 'Insira o Usuário',
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
                    icon: Icon(Icons.lock_outline, color: Colors.yellow),
                    labelText: 'Senha',
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
                          return Colors.yellow.shade700;
                        return Colors.yellow.shade600;
                      },
                    )),
                    label: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 24),
                    ),
                    icon: Icon(Icons.login),
                    onPressed: () {
                      txtLogin.text = "elio_paulino@hotmail.com";
                      txtSenha.text = "eppp010899";
                      login(txtLogin.text, txtSenha.text);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/cadastro');
        },
        icon: Icon(Icons.add),
        label: Text('Cadastrar'),
        backgroundColor: Colors.yellow.shade600,
      ),
    );
  }

  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      FirebaseFirestore.instance
          .collection('Usuarios')
          .doc(resultado.user!.uid)
          .get()
          .then((value) {
        if (value.data()!['nome'].toString().isNotEmpty) {
          Navigator.pushReplacementNamed(context, '/menu',
              arguments: resultado.user!.uid);
        }
      });
    }).catchError((erro) {
      var errorCode = erro.code;
      var mensagem = '';
      if (errorCode == 'user-not-found') {
        mensagem = 'Usuário não encontrado';
      } else if (errorCode == 'wrong-password') {
        mensagem = 'Senha inválida';
      } else if (errorCode == 'invalid-email') {
        mensagem = 'Email inválido';
      } else {
        mensagem = erro.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('ERRO: $mensagem'),
        duration: Duration(seconds: 2),
      ));
    });
  }
}
