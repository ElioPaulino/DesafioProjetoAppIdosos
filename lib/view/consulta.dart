import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Consulta extends StatefulWidget {
  @override
  _Calendario createState() => _Calendario();
}

class _Calendario extends State<Consulta> {
  String minuto = '00';
  String hora = '00';
  late bool segunda = false,
      terca = false,
      quarta = false,
      quinta = false,
      sexta = false,
      sabado = false,
      domingo = false;

  var nomeMedico = TextEditingController();
  var endereco = TextEditingController();
  var numero = TextEditingController();
  var celular = TextEditingController();

  var horastxt = TextEditingController();
  var minutostxt = TextEditingController();

  var dia = TextEditingController();
  var mes = TextEditingController();
  var ano = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Consulta'),
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
                Text(
                  "Informação médico",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: nomeMedico,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Informe o nome do Médico',
                      labelStyle: TextStyle(color: Colors.black)),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Flexible(
                    child: TextField(
                      controller: endereco,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: 'Endereço',
                          labelStyle: TextStyle(color: Colors.black)),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                      child: TextField(
                    controller: numero,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Número',
                        labelStyle: TextStyle(color: Colors.black)),
                    style: TextStyle(color: Colors.black),
                  ))
                ]),
                SizedBox(height: 30),
                TextField(
                  controller: celular,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Telefone de contato',
                      labelStyle: TextStyle(color: Colors.black)),
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 30),
                Text(
                  "Data da Consulta",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Flexible(
                    child: TextField(
                      controller: dia,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          labelText: 'Dia',
                          labelStyle: TextStyle(color: Colors.black)),
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 5),
                  Flexible(
                      child: TextField(
                    controller: mes,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Mês',
                        labelStyle: TextStyle(color: Colors.black)),
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                  )),
                  SizedBox(width: 5),
                  Flexible(
                      child: TextField(
                    controller: ano,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        labelText: 'Ano',
                        labelStyle: TextStyle(color: Colors.black)),
                    style: TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                  ))
                ]),
                SizedBox(height: 30),
                Text(
                  "Horário da Consulta",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 15),
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
                      'Registrar',
                      style: TextStyle(fontSize: 24),
                    ),
                    icon: Icon(Icons.queue_play_next_rounded),
                    onPressed: () {
                      setState(() {
                        var db = FirebaseFirestore.instance;
                        db.collection('Consulta').add({
                          "nomeMedico": nomeMedico.text,
                          "endereco": endereco.text,
                          "numero": numero.text,
                          "celular": celular.text,
                          "dia": dia.text,
                          "mes": mes.text,
                          "ano": ano.text,
                          "hora": hora,
                          "minuto": minuto,
                          "usuario": id
                        });
                          Navigator.pushReplacementNamed(context, '/menu',
                              arguments: id);
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
