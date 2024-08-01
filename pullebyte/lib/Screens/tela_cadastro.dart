import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pullebyte/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pullebyte/CustomWidgets/Textinput.dart';
import 'package:pullebyte/CustomWidgets/MainButton.dart';
import 'package:pullebyte/controller_Database.dart';

class CadastroScreen extends StatelessWidget {
  final DatabaseController _databaseController = DatabaseController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  CadastroScreen({Key? key}) : super(key: key);

  void _register(BuildContext context) async {
    User? user = await _databaseController.registerWithEmailAndPassword(
      _emailController.text,
      _passwordController.text,
      _usernameController.text,
    );
    if (user != null) {
      Navigator.pushNamed(context, '/home'); // Navegar para a tela inicial
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao fazer cadastro')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String assetName = 'lib/Assets/Icon_cadastro.svg';
    return Scaffold(
      backgroundColor: customColorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 110,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              assetName,
              height: 150,
            ),
            SizedBox(height: 20),
            TextFieldSample(
              controller: _usernameController,
              hintText: 'Nome de Usuário',
              isSenha: false,
            ),
            SizedBox(height: 20),
            TextFieldSample(
              controller: _emailController,
              hintText: 'Email',
              isSenha: false,
            ),
            SizedBox(height: 20),
            TextFieldSample(
              controller: _passwordController,
              hintText: 'Senha',
              isSenha: true,
            ),
            SizedBox(height: 20),
            MainButton(
              text: 'Cadastrar',
              onPressed: () => _register(context),
            ),
          ],
        ),
      ),
    );
  }
}
