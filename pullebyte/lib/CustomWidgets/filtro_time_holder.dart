import 'package:flutter/material.dart';
import 'package:pullebyte/CustomWidgets/ShowModal.dart';
import 'filtro_time_logic.dart';
import 'time_item.dart';

class FiltroTime extends StatefulWidget {
  const FiltroTime({Key? key}) : super(key: key);

  @override
  _FiltroTimeState createState() => _FiltroTimeState();
}

class _FiltroTimeState extends State<FiltroTime> {
  final FiltroTimeLogic filtroTimeLogic = FiltroTimeLogic();


  @override
  void initState() {
    super.initState();
    _carregarFiltros();
  }

  Future<void> _carregarFiltros() async {
    try {
      await filtroTimeLogic.carregarFiltrosDoFirestore();
      setState(() {});
    } catch (e) {
      print('Erro ao carregar filtros: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              "Filtrar por Times",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...filtroTimeLogic.timesSelecionados
                    .asMap()
                    .entries
                    .map((entry) {
                  final int index = entry.key;
                  final Map<String, dynamic> time = entry.value;
                  return TimeItem(
                    time: time,
                    onTap: () {
                      setState(() {
                        filtroTimeLogic.alternarSelecao(index);
                      });
                    },
                    onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Excluir Filtro?'),
                          content: Text(
                                'Deseja excluir o Filtro ${time['nome']}?'),
                                                      actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  filtroTimeLogic.excluirTime(index);
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Excluir'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
               }),
               MeuModalWidget(
                onItemSelected: (nome, escudoUrl) {
                  setState(() {
                    filtroTimeLogic.adicionarTime(nome, escudoUrl, context);
                  });
                },
             ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
