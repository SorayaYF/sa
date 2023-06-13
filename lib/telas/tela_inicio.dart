import 'package:flutter/material.dart';

import '../componentes/caixa_opcao.dart';

class Inicio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text('Opções de Quartos'),
      ),
      body: Container(
        color: Colors.blueGrey[50], // Cor de fundo do container
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white, // Cor de fundo do container
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                'Opções de Quartos',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Número de quartos disponíveis
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detalhes_quarto');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 4.0,
                      margin: EdgeInsets.all(16.0),
                      child: CaixaOpcao(
                        numero: index + 1, // Número do quarto
                        preco: 100, // Preço do quarto
                        descricao: 'Descrição do quarto $index',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
