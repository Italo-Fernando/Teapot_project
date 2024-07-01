import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pullebyte/Screens/mapa.dart';
import 'package:pullebyte/theme/colors.dart';

class LiveCard extends StatelessWidget {
  const LiveCard({super.key, required this.jsonData});
  final String jsonData;

  String getEscudoImageUrl(String id) {
    return 'https://pullebyte.onrender.com/get_escudo_image/$id';
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = jsonDecode(jsonData);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Mapa(stadiumName: data['Estadio']),
          ),
        );
      },
      child: Container(
      decoration: BoxDecoration(
        color: customColorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: 244,
        height: 135,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: getEscudoImageUrl(data['ImgMand']),
                  width: 48,
                  height: 48,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined),
                ),
                const SizedBox(height: 4),
                Container(
                  constraints: const BoxConstraints(maxWidth: 80),
                  child: Text(
                    "${data['EquipeMand']}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: customColorScheme.onPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "1.2",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: customColorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 4),
                Text(
                  "${data['GolsMand']}:${data['GolsAdv']}",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: customColorScheme.onPrimary,
                  ),
                ),
                Text(
                  "${data['Hora'].substring(0, 2)}'",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: customColorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '1.7',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: customColorScheme.onPrimary,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: getEscudoImageUrl(data['ImgAdv']),
                  width: 48,
                  height: 48,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined),
                ),
                const SizedBox(height: 4),
                Container(
                  constraints: const BoxConstraints(maxWidth: 80),
                  child: Text(
                    "${data['EquipeAdv']}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: customColorScheme.onPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "1.7",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: customColorScheme.onPrimary,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
