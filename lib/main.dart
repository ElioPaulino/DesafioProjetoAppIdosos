import 'package:flutter/material.dart';
void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Hora do Remédio',

    //ROTAS DE NAVEGAÇÃO
    initialRoute: '/primeira',
    routes: {
      '/primeira': (context) => PrimeiraTela(),
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
  bool isLoading = false;
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
                      setState(() {
                        //
                      });

                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}