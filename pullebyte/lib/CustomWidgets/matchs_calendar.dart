import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pullebyte/theme/colors.dart';

class MatchCalendarCard extends StatelessWidget {
  const MatchCalendarCard({super.key});

  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;

    final width = screenWidth * 0.85;
    return Container(
      decoration: BoxDecoration(
        color: customColorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: width,
        height: 155,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Ago 30, 2024", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text("Rodada 3 de 16", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Metade da altura/largura do container para garantir um círculo perfeito
                        border: Border.all(color: Colors.grey, width: 5), // Adiciona uma borda cinza de 2 pixels de largura
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25), // Metade da altura/largura do container para garantir um círculo perfeito
                        child: Image.asset(
                          'lib/Assets/Arsenal_FC.svg.png',
                          fit: BoxFit.contain, // Ajusta a imagem para cobrir o espaço do círculo
                          width: 40, // Defina a largura da imagem para 50 (opcional)
                          height: 45, // Defina a altura da imagem para 50 (opcional)
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Arsenal", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Bayern", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Metade da altura/largura do container para garantir um círculo perfeito
                        border: Border.all(color: Colors.grey, width: 5), // Adiciona uma borda cinza de 2 pixels de largura
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25), // Metade da altura/largura do container para garantir um círculo perfeito
                        child: Image.asset(
                          'lib/Assets/FC_Bayern_München_logo_(2017).svg.png',
                          fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço do círculo
                          width: 40, // Defina a largura da imagem para 50 (opcional)
                          height: 40, // Defina a altura da imagem para 50 (opcional)
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8), // Arredonda os cantos do container
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("1 ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text(" | ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey[600])),
                      Text("1.72", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8), // Arredonda os cantos do container
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("x ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text(" | ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey[600])),
                      Text("1.72", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(8), // Arredonda os cantos do container
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("2 ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                      Text(" | ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.grey[600])),
                      Text("1.72", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Column(
        // ),
      ),
    );
  }
}
