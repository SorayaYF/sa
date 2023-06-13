import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../componentes/carrossel.dart';

class DetalhesQuarto extends StatefulWidget {
  final List<String> informacoesQuarto;

  const DetalhesQuarto({required this.informacoesQuarto});

  @override
  _DetalhesQuartoState createState() => _DetalhesQuartoState();
}

class _DetalhesQuartoState extends State<DetalhesQuarto> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDate = DateTime.now();

  void _onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      _selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text('Detalhes do Quarto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.grey[200], // Cor de fundo do container
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Icon(
                Icons.bed,
                size: 120.0,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Informações do Quarto',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.informacoesQuarto.map((informacao) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4.0,
                    margin: EdgeInsets.only(bottom: 8.0),
                    child: Carrossel(
                      icon: Icons.info,
                      text: informacao,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Economize 15% ao reservar 3 ou mais diárias!',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Data de Reserva',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8.0),
            TableCalendar(
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(Duration(days: 365)),
              focusedDay: _selectedDate,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: _onDaySelected,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pagamento');
              },
              child: Text('Fazer Reserva'),
            ),
          ],
        ),
      ),
    );
  }
}


