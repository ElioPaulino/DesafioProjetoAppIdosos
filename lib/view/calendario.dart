import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Calendario extends StatefulWidget {
  @override
  _Calendario createState() => _Calendario();
}

class _Calendario extends State<Calendario> {
  String minuto = '00';
  String hora = '00';
  late bool segunda = false,
      terca = false,
      quarta = false,
      quinta = false,
      sexta = false,
      sabado = false,
      domingo = false;
  var nomeRemedio = TextEditingController();
  var nomeMedico = TextEditingController();

  var horastxt = TextEditingController();
  var minutostxt = TextEditingController();

  TimeOfDay horas = TimeOfDay.now();

  var txtLogin = TextEditingController();
  var txtHoras = TextEditingController();
  String texto = '';
  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendamento'),
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
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                SizedBox(height: 30),
                TextField(
                  controller: nomeRemedio,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Informe o nome do remédio',
                      labelStyle: TextStyle(color: Colors.black)),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: nomeMedico,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Informe o nome do Médico prescritor',
                      labelStyle: TextStyle(color: Colors.black)),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 30),
                Text(
                  "Informe os dias: ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                /*  TextField(
                  controller: txtLogin,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.utc(2010, 10, 16),
                                  lastDate: DateTime.utc(2030, 3, 14))
                              .then((value) => setState(() {
                                    txtLogin.text = value.toString();
                                  }));
                        },
                        icon: Icon(Icons.calendar_today, color: Colors.yellow)),
                    labelText: 'Informe a validade',
                    // hintText: _selectedDay.toString(),
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: txtHoras,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          showTimePicker(context: context, initialTime: horas)
                              .then((value) => setState(() {
                                    txtHoras.text = value.toString();
                                  }));
                        },
                        icon: Icon(Icons.lock_clock, color: Colors.yellow)),
                    labelText: 'Ecolha a Hora',
                    // hintText: _selectedDay.toString(),
                    labelStyle: TextStyle(color: Colors.yellow),
                  ),
                  style: TextStyle(color: Colors.black),
                ),*/
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text(
                      "Domingo",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                          setState(() {
                            domingo = !domingo;
                          })
                        },
                    color: domingo ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                RaisedButton(
                    child: Text(
                      "Segunda-Feira",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                          setState(() {
                            segunda = !segunda;
                          })
                        },
                    color: segunda ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                RaisedButton(
                    child: Text(
                      "Terça-Feira",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                          setState(() {
                            terca = !terca;
                          })
                        },
                    color: terca ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                RaisedButton(
                    child: Text(
                      "Quarta-Feira",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                          setState(() {
                            quarta = !quarta;
                          })
                        },
                    color: quarta ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                RaisedButton(
                    child: Text(
                      "Quinta-Feira",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                          setState(() {
                            quinta = !quinta;
                          })
                        },
                    color: quinta ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                RaisedButton(
                    child: Text(
                      "Sexta-Feira",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                          setState(() {
                            sexta = !sexta;
                          })
                        },
                    color: sexta ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                RaisedButton(
                    child: Text(
                      "Sábado",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => {
                          setState(() {
                            sabado = !sabado;
                          })
                        },
                    color: sabado ? Colors.green : Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
                SizedBox(height: 30),
                Text(
                  "Informe o horário do remédio: ",
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: hora,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          hora = newValue!;
                        });
                      },
                      items: <String>[
                        '00',
                        '01',
                        '02',
                        '03',
                        '04',
                        '05',
                        '06',
                        '07',
                        '08',
                        '09',
                        '10',
                        '11',
                        '12',
                        '13',
                        '14',
                        '15',
                        '16',
                        '17',
                        '18',
                        '19',
                        '20',
                        '21',
                        '22',
                        '23',
                        '24'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(width: 15),
                    Text(":"),
                    SizedBox(width: 15),
                    DropdownButton<String>(
                      value: minuto,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          minuto = newValue!;
                        });
                      },
                      items: <String>['00',
                        '01',
                        '02',
                        '03',
                        '04',
                        '05',
                        '06',
                        '07',
                        '08',
                        '09',
                        '10',
                        '11',
                        '12',
                        '13',
                        '14',
                        '15',
                        '16',
                        '17',
                        '18',
                        '19',
                        '20',
                        '21',
                        '22',
                        '23',
                        '24',
                        '25',
                        '26',
                        '27',
                        '28',
                        '29',
                        '30',
                        '31',
                        '32',
                        '33',
                        '34',
                        '35',
                        '36',
                        '37',
                        '38',
                        '39',
                        '40',
                        '41',
                        '42',
                        '43',
                        '44',
                        '45',
                        '46',
                        '47',
                        '48',
                        '49',
                        '50',
                        '51',
                        '52',
                        '53',
                        '54',
                        '55',
                        '56',
                        '57',
                        '58',
                        '59',
                        '60',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                SizedBox(height: 30),
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
                      'Cadastrar',
                      style: TextStyle(fontSize: 24),
                    ),
                    icon: Icon(Icons.login),
                    onPressed: () {
                      setState(() {
                        var db = FirebaseFirestore.instance;
                        db.collection('Remedios').add({
                          "nomeRemedio": nomeRemedio.text,
                          "nomeMedico": nomeMedico.text,
                          "segunda" : segunda,
                          "terca": terca,
                          "quarta":quarta,
                          "quinta":quinta,
                          "sexta":sexta,
                          "sabado":sabado,
                          "domingo":domingo,
                          "hora":hora,
                          "minuto":minuto,
                          "usuario": id
                        });
                        Navigator.pushReplacementNamed(context, '/menu', arguments: id);
                      });
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
