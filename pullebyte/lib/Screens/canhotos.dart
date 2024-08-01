import 'package:flutter/material.dart';
import 'package:pullebyte/CustomWidgets/custom_app_bar.dart';

class Canhotos extends StatefulWidget {
  const Canhotos({super.key});

  @override
  _CanhotosState createState() => _CanhotosState();
}

class _CanhotosState extends State<Canhotos> with AutomaticKeepAliveClientMixin {
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
                    Navigator.pushNamed(context, '/tela_login');
                  },
                  child: const Text('Login'),
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
