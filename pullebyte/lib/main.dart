import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pullebyte/Screens/tela_login.dart';
import 'package:pullebyte/theme/colors.dart';
import 'package:pullebyte/CustomWidgets/NavigatorBar.dart' ;
import 'Screens/tela_cadastro.dart';
import 'Screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    title: 'Pullebyte',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: customColorScheme.onPrimary,
      ),
      colorScheme: customColorScheme,
      useMaterial3: true,
    ),
    initialRoute: '/tela_login',
    routes: {
      '/tela_login': (context) =>  LoginScreen(),
      '/tela_cadastro': (context) =>  CadastroScreen(),
      '/home': (context) =>  Scaffold(
        body:  Home(),
        bottomNavigationBar: HomeScreen(),
      ),
    },
  ));
}
