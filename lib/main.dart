import 'package:flutter/material.dart';
import 'package:sa/telas/tela_cadastro.dart';
import 'package:sa/telas/tela_inicio.dart';
import 'package:sa/telas/tela_pagamento.dart';
import 'package:sa/telas/tela_quarto_detalhes.dart';
import 'package:sa/telas/tela_relatorio.dart';

import 'telas/tela_login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pousada App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/inicio': (context) => Inicio(),
        '/detalhes_quarto': (context) => DetalhesQuarto(
              informacoesQuarto: [
                'Vista com Varanda',
                'Cama Queen Size',
                'Wi-Fi Grátis',
                'Acesso à Piscina'
              ],
            ),
        '/relatorio': (context) => Relatorio(),
        '/pagamento': (context) => Pagamento(),
        '/cadastro': (context) => Cadastro(),
      },
    );
  }
}