import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  @override
  _Calendario createState() => _Calendario();
}

class _Calendario extends State<Calendario> {
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
                
                    TextField(
                      controller: horastxt,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: 'Horas',
                          labelStyle: TextStyle(color: Colors.black)),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: minutostxt,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: 'Minutos',
                          labelStyle: TextStyle(color: Colors.black)),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
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
                        //
                        Navigator.pushReplacementNamed(context, '/menu');
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
