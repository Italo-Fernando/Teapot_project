import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pullebyte/theme/colors.dart';
//Bom dia
class TextFieldSample extends StatelessWidget {
  final String hintText;
  final bool isSenha;
  final TextEditingController controller;

  const TextFieldSample({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isSenha,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Calcula a largura desejada em porcentagem da tela (ex: 70%)
    final width = screenWidth * 0.85;
    return Theme(
      data: ThemeData(
        colorScheme: customColorScheme,
      ),
      child: SizedBox(
        width: width,
        child: TextField(
          controller: controller, 
          cursorRadius: const Radius.circular(8),
          obscureText: isSenha,
          style: const TextStyle(color: CustomColors.accentColor),
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.textFieldColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: CustomColors.textFieldColor,
              ),
            ),
            hintText: hintText,
            labelText: hintText,
            labelStyle: const TextStyle(color: CustomColors.accentColor),
          ),
        ),
      ),
    );
  }
}
