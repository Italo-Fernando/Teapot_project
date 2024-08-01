import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pullebyte/CustomWidgets/filtro_time_holder.dart';
import 'package:pullebyte/CustomWidgets/custom_app_bar.dart';
import 'package:pullebyte/CustomWidgets/live_card_holder.dart';
import 'package:pullebyte/CustomWidgets/match_card_holder.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  List<dynamic> matchesData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMatchData();
  }

  Future<void> _fetchMatchData() async {
    const url = 'https://pullebyte.onrender.com/matches-data';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        matchesData = json.decode(utf8.decode(response.bodyBytes))['campeonatos'];
        isLoading = false;
      });
    }
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 1));
    await _fetchMatchData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(),
                const FiltroTime(),
                CardHolder(
                  matchesData: matchesData,
                  isLoading: isLoading,
                ),
                CalendarGameMatch(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}