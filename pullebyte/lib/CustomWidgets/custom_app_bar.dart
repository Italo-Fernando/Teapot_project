import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pullebyte/CustomWidgets/logo_header.dart';
import 'package:pullebyte/theme/colors.dart';
import 'package:pullebyte/controller_Database.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String icon = 'lib/Assets/Icon_widget.svg';
  final DatabaseController _databaseController = DatabaseController();
  CustomAppBar({super.key});

  void _logout(BuildContext context) async {
    _databaseController.signOut();
    Navigator.pushNamed(context, '/tela_login');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 50, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: const LogoHeader(),
          ),
          Container(
            decoration: BoxDecoration(
              color: customColorScheme.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: SizedBox(
              width: 46,
              height: 46,
              child: IconButton(
                icon: SvgPicture.asset(
                  'lib/Assets/Icon_widget.svg',
                  color: customColorScheme.onPrimary,
                  fit: BoxFit.contain,
                  semanticsLabel: 'Icon',
                ),
                onPressed: () {
                  _logout(context);
                  // Adicione a ação que você deseja realizar ao clicar no ícone aqui
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
