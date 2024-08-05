import 'package:flutter/material.dart';
import 'package:pullebyte/CustomWidgets/matchs_calendar.dart';
import 'dart:convert';

class CalendarGameMatch extends StatelessWidget {
  final List<dynamic> matchesData;
  final bool isLoading;

  const CalendarGameMatch(
      {super.key, required this.matchesData, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Próximos Jogos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: matchesData.map<Widget>((match) {
                        List<dynamic> partidas = match['partidas'];
                        return Column(
                          children: partidas.map<Widget>((partida) {
                            return partida['Situacao'] == 'Em breve'
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: MatchCalendarCard(
                                        jsonData: jsonEncode(partida)),
                                  )
                                : const SizedBox.shrink();
                          }).toList(),
                        );
                      }).toList(),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
