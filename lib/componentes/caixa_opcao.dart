import 'package:flutter/material.dart';

class CaixaOpcao extends StatelessWidget {
  final int numero;
  final double preco;
  final String descricao;

  CaixaOpcao({
    required this.numero,
    required this.preco,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.hotel),
            title: Text('Quarto $numero'),
            subtitle: Text('Preço: R\$ $preco'),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              descricao,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}