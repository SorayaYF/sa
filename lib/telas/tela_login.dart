import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text('Login'),
      ),
      body: Container(
        color: Colors.blueGrey[50], // Cor de fundo do container
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_location_alt_rounded,
                size: 50,
              ),
              SizedBox(height: 16),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.hotel,
                            size: 32,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Bem-vindo(a) à Pousada Reservas',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome de usuário',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Ação de login
                          // Verificar tipo de usuário (cliente ou gerente)
                          // Redirecionar para a tela correspondente
                          String tipoUsuario =
                              'cliente'; // Altere para 'gerente' para testar a tela do gerente
                          if (tipoUsuario == 'cliente') {
                            Navigator.pushNamed(context, '/inicio');
                          } else if (tipoUsuario == 'gerente') {
                            Navigator.pushNamed(context, '/relatorio');
                          }
                        },
                        child: Text('Entrar'),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cadastro');
                        },
                        child: Text('Cadastrar-se'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
