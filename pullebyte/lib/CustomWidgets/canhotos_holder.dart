import 'package:flutter/material.dart';
import 'package:pullebyte/CustomWidgets/canhotos_card.dart';

class CanhotosHolder extends StatefulWidget {
  const CanhotosHolder({ super.key });

  @override
  _CanhotosHolderState createState() => _CanhotosHolderState();
}

class _CanhotosHolderState extends State<CanhotosHolder> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Aqui vai ter o filtro dos canhotos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 18),
              Column(
                children: List.generate(
                  10,
                  (index) => const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CanhotosCard(),
                  ),
                ).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}