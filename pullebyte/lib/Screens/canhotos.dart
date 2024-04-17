import 'package:flutter/material.dart';
import 'package:pullebyte/CustomWidgets/logo_header.dart';

class Canhotos extends StatelessWidget {
  const Canhotos({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Calcula a posição horizontal desejada em porcentagem da tela (ex: 10%)
    final leftPosition = screenWidth * 0.05;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 35,
            left: leftPosition,
            child: LogoHeader(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tela_cadastro');
                  },
                  child: const Text('Canhotos'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}