import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projeto_desafio_elio_lucas/model/Consulta.dart';
import 'package:projeto_desafio_elio_lucas/model/Remedio.dart';

class HomeState extends StatefulWidget {
  final String uid;
  HomeState({required this.uid});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeState> {
  late CollectionReference remedios;
  late PageController _pageController;
  late String nome = "";
  late String idade = "";
  late String sexo = "";
  late Remedio remedio;
  var lista;

  List<Consulta> listaConsulta = [];

  var id;
  int count = 0;

  getDocumentById() async {
    await FirebaseFirestore.instance
        .collection('Usuarios')
        .doc(widget.uid)
        .get()
        .then((value) {
      nome = value.data()!['nome'].toString();
      idade = value.data()!['idade'].toString();
      sexo = value.data()!['sexo'].toString();
    });
    if (count == 0) {
      setState(() {});
      count = 1;
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  bool clickedCentreFAB = false;
  int selectedIndex = 0;
  String text = "Home";

  getDocuments(String id) {
    FirebaseFirestore.instance
        .collection('Remedios')
        .where("usuario", isEqualTo: id.toString());
  }

  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    id = widget.uid;
    getDocumentById();
    buscarConsultas(id);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hora do Remédio'),
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pushNamed(context, '/primeira');
            },
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {});
        },
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(14),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                          child: Text("Informações pessoais",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23)))),
                  Card(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      child: Column(
                        children: <Widget>[
                          Text("Seja bem-vindo\n " + nome,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.yellow)),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Text(
                                    "Sexo: " + sexo,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  )
                                ]),
                                Row(children: <Widget>[
                                  Text(
                                    "Idade: " + idade,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  )
                                ]),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    color: Colors.purple[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              )),
          Container(
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                        (index == 0
                            ? "Segunda - Feira"
                            : index == 1
                                ? "Terca - Feira"
                                : index == 2
                                    ? "Quarta - Feira"
                                    : index == 3
                                        ? "Quinta - Feira"
                                        : index == 4
                                            ? "Sexta - Feira"
                                            : index == 5
                                                ? "Sabado"
                                                : index == 6
                                                    ? "Domingo"
                                                    : ""),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Remedios')
                                .where("usuario", isEqualTo: id.toString())
                                .where(
                                    (index == 0
                                        ? "segunda"
                                        : index == 1
                                            ? "terca"
                                            : index == 2
                                                ? "quarta"
                                                : index == 3
                                                    ? "quinta"
                                                    : index == 4
                                                        ? "sexta"
                                                        : index == 5
                                                            ? "sabado"
                                                            : index == 6
                                                                ? "domingo"
                                                                : ""),
                                    isEqualTo: true)
                                .snapshots(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return Center(child: Text('Erro'));
                                case ConnectionState.waiting:
                                  return Center(
                                      child: CircularProgressIndicator());
                                default:
                                  final dados = snapshot.requireData;
                                  return ListView.builder(
                                      itemCount: dados.size,
                                      itemBuilder: (context, index) {
                                        return listTile(dados.docs[index]);
                                      });
                              }
                            }),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            child: ListView.builder(
              itemCount: 1,
              scrollDirection: Axis.horizontal,
              physics: PageScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(children: <Widget>[
                      Text("Marcar a consulta ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/consulta',
                                arguments: id);
                          },
                          icon: Icon(Icons.add)),
                    ]),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Consulta')
                                .where("usuario", isEqualTo: id.toString())
                                .snapshots(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                  return Center(child: Text('Erro'));
                                case ConnectionState.waiting:
                                  return Center(
                                      child: CircularProgressIndicator());
                                default:
                                  final dados = snapshot.requireData;
                                  return ListView.builder(
                                      itemCount: dados.size,
                                      itemBuilder: (context, index) {
                                        return listTileConsulta(
                                            dados.docs[index]);
                                      });
                              }
                            }),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
              //color: Colors.pink,
              ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            clickedCentreFAB = !clickedCentreFAB;
            Navigator.pushNamed(context, '/calendario', arguments: id);
          });
        },
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.purple[800],
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  updateTabSelection(0);
                  _pageController.animateToPage(0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  color: selectedIndex == 0 ? Colors.yellow[600] : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1);
                  _pageController.animateToPage(1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.calendar_today,
                  color: selectedIndex == 1 ? Colors.yellow[600] : Colors.white,
                ),
              ),
              SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2);
                  _pageController.animateToPage(2,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.medication_rounded,
                  color: selectedIndex == 2 ? Colors.yellow[600] : Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3);
                  _pageController.animateToPage(3,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.info_rounded,
                  color: selectedIndex == 3 ? Colors.yellow[600] : Colors.white,
                ),
              ),
            ],
          ),
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.purple[800],
      ),
    );
  }

  void buscarConsultas(Object? id) async {
    final Future<QuerySnapshot<Map<String, dynamic>>> a = FirebaseFirestore
        .instance
        .collection('Consulta')
        .where("usuario", isEqualTo: id.toString())
        .get();

    a.then((value) {
      listaConsulta.clear();
      for (var item in value.docs) {
        Consulta consulta = Consulta.fromJson(item.data(), item.id);
        listaConsulta.add(consulta);
      }
    });
  }

  Widget listTileConsulta(item) {
    Consulta consulta = Consulta.fromJson(item.data(), item.id);
    return Column(
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Column(
              children: <Widget>[
                Text(consulta.dia + " / " + consulta.mes + " / " + consulta.ano,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black)),
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          "Horário: " + consulta.hora + " : " + consulta.minuto,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                //backgroundColor: Colors.purple,
                                title: const Text(
                                    'Tem certeza que deseja excluir?'),
                                content: const Text(''),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'Cancelar');
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      count = 0;
                                      FirebaseFirestore.instance
                                          .collection("Consulta")
                                          .doc(consulta.id)
                                          .delete();
                                      setState(() {});
                                      Navigator.pop(context, 'OK');
                                    },
                                    child: const Text('Sim'),
                                  ),
                                ],
                              ),
                            );
                            setState(() {});
                          },
                        ),
                      ]),
                      Row(children: <Widget>[
                        Text("Médico: " + consulta.nomeMedico,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                      ]),
                      Row(children: <Widget>[
                        Text("Endereco: " + consulta.endereco,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                      ]),
                      Row(children: <Widget>[
                        Text("Celular: " + consulta.celular,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black)),
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          //color: Colors.purple[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }

  Widget listTile(item) {
    Remedio remedio = Remedio.fromJson(item.data(), item.id);
    return Column(
      children: [
        Card(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" Remédio: ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23,
                            color: Colors.yellow)),
                    Text(remedio.nomeRemedio,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.yellow)),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          "Dias da semana: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 23, color: Colors.grey),
                        )
                      ]),
                      Row(children: <Widget>[
                        Text(
                          (remedio.segunda ? "Seg" : "") +
                              (remedio.terca ? " Ter" : "") +
                              (remedio.quarta ? " Quar" : "") +
                              (remedio.quinta ? " Quin" : "") +
                              (remedio.sexta ? " Sex" : "") +
                              (remedio.sabado ? " Sab" : "") +
                              (remedio.domingo ? " Dom" : ""),
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ]),
                      Row(children: <Widget>[
                        Text(
                          "Nome do médico: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 23, color: Colors.grey),
                        )
                      ]),
                      Row(children: <Widget>[
                        Text(
                          " " + remedio.nomeMedico,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ]),
                      Row(children: <Widget>[
                        Text(
                          "Horário: " + remedio.hora + " : " + remedio.minuto,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 23, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        IconButton(
                          iconSize: 40,
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: Colors.purple,
                                title: const Text(
                                    'Tem certeza que deseja excluir?'),
                                content: const Text(''),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, 'Cancelar');
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection("Remedios")
                                          .doc(remedio.id)
                                          .delete();
                                      Navigator.pop(context, 'OK');
                                    },
                                    child: const Text('Sim'),
                                  ),
                                ],
                              ),
                            );
                            setState(() {});
                          },
                        ),
                      ]),
                    ],
                  ),
                )
              ],
            ),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          color: Colors.purple[800],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ],
    );
  }
}
