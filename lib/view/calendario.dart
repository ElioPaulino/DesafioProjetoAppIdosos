import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class Calendario extends StatefulWidget {
  @override
  _Calendario createState() => _Calendario();
}

class _Calendario extends State<Calendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
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
      ),
      body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              SizedBox(height: 30),
              TextField(
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
                  labelText: 'Ecolha a data',
                  // hintText: _selectedDay.toString(),
                  labelStyle: TextStyle(color: Colors.yellow),
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
              ),
              
              Container(
                padding: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 70,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
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
    );
  }
}
