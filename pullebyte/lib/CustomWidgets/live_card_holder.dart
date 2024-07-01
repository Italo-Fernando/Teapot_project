import 'package:flutter/material.dart';
import 'package:pullebyte/CustomWidgets/live_card.dart';
import 'dart:convert';


class CardHolder extends StatelessWidget {
  final List<dynamic> matchesData;
  final bool isLoading;

  const CardHolder({super.key, required this.matchesData, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Ao Vivo",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 140,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: matchesData.map((match) {
                            List<dynamic> partidas = match['partidas'];
                            return Row(
                              children: partidas.map((partida) {
                                return partida['Situacao'] != ''
                                    ? Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: LiveCard(jsonData: jsonEncode(partida)),
                                      )
                                    : const SizedBox.shrink();
                              }).toList(),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
