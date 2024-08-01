import 'package:flutter/material.dart';
import 'package:pullebyte/CustomWidgets/custom_app_bar.dart';

class Insights extends StatefulWidget {
  const Insights({super.key});

  @override
  _InsightsState createState() => _InsightsState();
}

class _InsightsState extends State<Insights> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomAppBar(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tela_cadastro');
                  },
                  child: const Text('Insights'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
