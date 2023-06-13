import 'package:flutter/material.dart';

class Relatorio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text('Relatórios'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            _buildRelatorio(
              context,
              'Reservas Canceladas',
              Icons.cancel,
              Colors.red,
            ),
            _buildRelatorio(
              context,
              'Reservas Não Pagas',
              Icons.money_off,
              Colors.orange,
            ),
            _buildRelatorio(
              context,
              'Reservas do Dia',
              Icons.calendar_today,
              Colors.blue,
            ),
            _buildRelatorio(
              context,
              'Reservas por Período',
              Icons.date_range,
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRelatorio(BuildContext context, String titulo, IconData icon, Color cor) {
    return GestureDetector(
      onTap: () {
        // Ação ao clicar no relatório
        // Atualizar as informações do relatório
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: cor,
              size: 48,
            ),
            SizedBox(height: 16),
            Text(
              titulo,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
