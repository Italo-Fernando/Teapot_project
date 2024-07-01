import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pullebyte/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MeuModalWidget extends StatefulWidget {
  final void Function(String, String) onItemSelected; // Callback

  MeuModalWidget({required this.onItemSelected});

  @override
  _MeuModalWidgetState createState() => _MeuModalWidgetState();
}

class _MeuModalWidgetState extends State<MeuModalWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> allTimes = [];
  List<Map<String, dynamic>> _foundTimes = [];

  @override
  void initState() {
    super.initState();
    _fetchTimes();
  }

  Future<void> _fetchTimes() async {
    final response = await http.get(Uri.parse('https://pullebyte.onrender.com/times'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        allTimes = List<Map<String, dynamic>>.from(data);
        _foundTimes = List.from(allTimes);
      });
    } else {
      print('Erro ao carregar os dados');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _exibirModal(context);
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  void _exibirModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 400,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _searchController,
                    onChanged: (query) {
                      setState(() {
                        _foundTimes = _filterTimes(query);
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Pesquisar',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (_foundTimes.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Nenhum time encontrado',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  Expanded(
                    child: _foundTimes.isEmpty
                        ? SizedBox()
                        : ListView.builder(
                            key: UniqueKey(),
                            itemCount: _foundTimes.length,
                            itemBuilder: (context, index) {
                              final time = _foundTimes[index];
                              return _criarItem(context, time['nomeDoTime'], time['idImagem']);
                            },
                          ),
                  ),
                ],
              ),
            );
          },
          ),
        );
      },
    );
  }

  List<Map<String, dynamic>> _filterTimes(String query) {
    List<Map<String, dynamic>> filteredTimes = [];
    if (query.isNotEmpty) {
      for (var time in allTimes) {
        final nome = time['nomeDoTime'].toString().toLowerCase();
        if (nome.startsWith(query.toLowerCase())) {
          filteredTimes.add(time);
        }
      }
    } else {
      filteredTimes = List.from(allTimes);
    }
    return filteredTimes;
  }

  String getEscudoImageUrl(String id) {
    return 'https://pullebyte.onrender.com/get_escudo_image/$id';
  }

  Widget _criarItem(BuildContext context, dynamic nomeDoTime, dynamic idEscudo) {
    String nome = nomeDoTime ?? '';
    String id = idEscudo ?? '';
    String escudoUrl = getEscudoImageUrl(id);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(nome),
        leading: _buildEscudoImage(escudoUrl),
        onTap: () {
          widget.onItemSelected(nome, escudoUrl);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildEscudoImage(String escudoUrl) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: CustomColors.accentColor,
        borderRadius: BorderRadius.circular(70.0),
      ),
      child: ClipRRect(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CachedNetworkImage(
            imageUrl: escudoUrl,
            width: 48,
            height: 48,
            fit: BoxFit.contain,
            placeholder: (context, url) => const SizedBox(
              width: 10,
              height: 10,
              child: CircularProgressIndicator(strokeWidth: 2.0),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined),
          ),
        ),
      ),
    );
  }
}
