import 'package:flutter/material.dart';

class Pagamento extends StatefulWidget {
  @override
  _PagamentoState createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  String nomeCartao = '';
  String numeroCartao = '';
  String dataExpiracao = '';
  String formaPagamento = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formas de Pagamento'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selecione a forma de pagamento:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildOpcaoPagamento(
                  Icons.credit_card,
                  'Cartão de Crédito',
                  'cartao_credito',
                ),
                SizedBox(width: 20),
                _buildOpcaoPagamento(
                  Icons.attach_money,
                  'Pix',
                  'pix',
                ),
                SizedBox(width: 20),
                _buildOpcaoPagamento(
                  Icons.payment,
                  'Cartão de débito',
                  'cartao_debito',
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nome no cartão',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    nomeCartao = value;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Número do cartão',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    numeroCartao = value;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Data de expiração',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(16),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    dataExpiracao = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _mostrarPopupReserva(context);
              },
              child: Text('Concluir Reserva'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpcaoPagamento(IconData icon, String title, String forma) {
    return GestureDetector(
      onTap: () {
        setState(() {
          formaPagamento = forma;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: formaPagamento == forma ? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(icon, size: 40),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: formaPagamento == forma ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _mostrarPopupReserva(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text('Valor total do pagamento'),
          content: Text('R\$ 100,00'), // Substitua pelo valor total do pagamento
          actions: [
            TextButton(
              onPressed: () {
                // Implemente a ação de confirmação do pagamento
                _mostrarPopupConfirmacao(context);
              },
              child: Text('Confirmar'),
            ),
            TextButton(
              onPressed: () {
                // Implemente a ação de cancelamento do pagamento
                _mostrarPopupCancelamento(context);
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarPopupConfirmacao(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Reserva Confirmada'),
          ],
        ),
        content: Text('Sua reserva foi confirmada com sucesso!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

void _mostrarPopupCancelamento(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Row(
          children: [
            Icon(Icons.error, color: Colors.red),
            SizedBox(width: 8),
            Text('Reserva Cancelada'),
          ],
        ),
        content: Text('Sua reserva foi cancelada!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
}

