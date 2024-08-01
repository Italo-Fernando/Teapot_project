import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pullebyte/CustomWidgets/MainButton.dart';
import 'package:pullebyte/CustomWidgets/Textinput.dart';
import 'package:pullebyte/CustomWidgets/logo_header.dart';
import 'package:pullebyte/CustomWidgets/main_text.dart';
import 'package:pullebyte/theme/colors.dart';
import 'package:pullebyte/controller_Database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final DatabaseController _databaseController = DatabaseController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  void _login(BuildContext context) async {
  User? user = await _databaseController.signInWithEmailAndPassword(
    _emailController.text,
    _passwordController.text,
  );
  if (user != null) {
    await _databaseController.addUser(user.uid, user.email!);
    Navigator.of(context).pop(); // Fechar o popup
    Navigator.pushNamed(context, '/home'); // Navegar para a tela inicial
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Erro ao fazer login')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    final String assetName = 'lib/Assets/Soccer-cuate.svg';
    return Scaffold(
      backgroundColor: customColorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 110,
        centerTitle: true,
        leadingWidth: 300,
        leading: Container(
          padding: const EdgeInsets.only(left: 16),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: LogoHeader(),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: SvgPicture.asset(assetName,
                  fit: BoxFit.contain,
                  semanticsLabel: 'Soccer Image',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 16),
                       TextFieldSample(
                        controller:_emailController, 
                        hintText: "Email", 
                        isSenha: false,),
                      const SizedBox(height: 16),
                       TextFieldSample(
                      controller: _passwordController, 
                      hintText: "Senha", 
                      isSenha: true,),
                      const SizedBox(height: 24),
                      MainButton(
                        text: "Login",
                        onPressed:() => _login(context)),
              
                      const SizedBox(height: 20),

                      const LinkAndText(
                        text: "Ainda não possui login? ",
                        linkText: "Cadastre-se",
                        route: '/tela_cadastro',
                        alignment: MainAxisAlignment.end,
                      ),
                      const SizedBox(height: 30),
                      const LinkAndText(
                        text: "",
                        route: '/tela_cadastro',
                        linkText: "Esqueceu a senha?",
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
