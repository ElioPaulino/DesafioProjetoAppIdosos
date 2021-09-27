import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Hora do Remédio",

    //Rotas
    initialRoute: "/primeira",
    routes: {
      "/primeira": (context) => PrimeiraTela()
    },
  ));
}

class PrimeiraTela extends StatefulWidget {
  const PrimeiraTela({Key? key}) : super(key: key);

  @override
  _PrimeiraTelaState createState() => _PrimeiraTelaState();
}

class _PrimeiraTelaState extends State<PrimeiraTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tela de entrada"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(40),
          
        )
    );
  }
}
