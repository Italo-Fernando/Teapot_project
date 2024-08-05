import 'package:flutter/material.dart';
import 'package:pullebyte/theme/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CanhotosCard extends StatefulWidget {
  const CanhotosCard({super.key});

  @override
  _CanhotosCardState createState() => _CanhotosCardState();
}

class _CanhotosCardState extends State<CanhotosCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final width = screenWidth * 0.85;
    return Container(
      decoration: BoxDecoration(
        color: customColorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        width: width,
        height: 155,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Ago 30, 2024",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: customColorScheme.secondary, width: 5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            'lib/Assets/FC_Bayern_München_logo_(2017).svg.png',
                            fit: BoxFit.cover,
                            width: 36,
                            height: 36,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Bayern",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 130,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(8), // Arredonda os cantos do container
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "R\$ 214,30",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: CachedNetworkImage(
                width: width / 2,
                height: 155,
                imageUrl: "",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
